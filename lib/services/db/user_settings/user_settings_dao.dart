import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_participant_code.dart';
import 'package:nepanikar/services/analytics/bpd_analytics.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_models.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';

class UserSettingsDao {
  UserSettingsDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = StoreRef(_storeKeyName);

  Future<UserSettingsDao> init() async {
    registry.registerSingleton<UserSettingsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>> _store;

  Database get _db => _dbService.database;

  static const _themeModeKey = 'theme_mode';
  static const _mainColorKey = 'main_color';
  static const _storeKeyName = 'user_settings';
  static const _languageKey = 'language';
  static const _notificationKeyPrefix = 'notification_type_';
  static const _bpdProgrammeStatusKey = 'bpd_programme_status';
  static const _bpdProgrammeUnlockedKey = 'bpd_programme_unlocked';
  static const _notifPermissionAskedKey = 'notification_permission_asked';

  /// The store holds JSON maps, so the unlocked flag is a one-field record
  /// rather than a bare bool.
  static const _unlockedRecord = <String, dynamic>{'unlocked': true};

  static bool _isUnlocked(Map<String, dynamic>? record) => record?['unlocked'] == true;
  static const _bpdUserProfileKey = 'bpd_user_profile';
  static const _bpdParticipantCodeKey = 'bpd_participant_code';

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final themeModeStr = UserThemeMode.themeModeToString(themeMode);
    final userThemeMode = UserThemeMode(themeMode: themeModeStr);
    debugPrint('UserSettingsDao: Changing theme mode to: $themeModeStr');
    await _store.record(_themeModeKey).put(_db, userThemeMode.toJson());
  }

  Future<ThemeMode> getThemeMode() async {
    final json = await _store.record(_themeModeKey).get(_db);
    if (json == null) return ThemeMode.system;
    final userThemeMode = UserThemeMode.fromJson(json);
    return userThemeMode.getThemeMode();
  }

  Stream<ThemeMode> get themeModeStream =>
      _store.record(_themeModeKey).onSnapshot(_db).map((snapshot) {
        final themeModeStr = snapshot?.value;
        if (themeModeStr == null) return ThemeMode.system;
        final userThemeMode = UserThemeMode.fromJson(themeModeStr);
        return userThemeMode.getThemeMode();
      }).asBroadcastStream();

  Future<void> saveMainColor(Color mainColor) async {
    final mainColorInt = mainColor.toARGB32();
    debugPrint('UserSettingsDao: Changing primary color to: $mainColorInt');
    await _store.record(_mainColorKey).put(_db, <String, dynamic>{'color': mainColorInt});
  }

  Future<Color> getMainColor() async {
    final json = await _store.record(_mainColorKey).get(_db);
    if (json == null) return NepanikarColors.defaultPrimary;
    return Color(json['color'] as int);
  }

  Stream<Color> get mainColorStream => _store.record(_mainColorKey).onSnapshot(_db).map((snapshot) {
    final value = snapshot?.value;
    if (value == null) return NepanikarColors.defaultPrimary;
    return Color(value['color'] as int);
  }).asBroadcastStream();

  String _getNotificationKey(NotificationType type) =>
      '$_notificationKeyPrefix${type.name.toLowerCase()}';

  Locale _locale = initialLocale;

  Locale get locale => _locale;

  Future<void> saveLocale(Locale locale) async {
    final json = UserLanguage.fromLocale(locale).toJson();
    debugPrint('UserSettingsDao: Changing language to: $json');
    await _store.record(_languageKey).put(_db, json);
  }

  Future<Locale?> getLocale() async {
    final json = await _store.record(_languageKey).get(_db);
    if (json == null) return null;
    final userLanguage = UserLanguage.fromJson(json);
    return userLanguage.toLocale();
  }

  Stream<Locale> get localeStream =>
      _store
          .record(_languageKey)
          .onSnapshot(_db)
          .mapNotNull((snapshot) {
            final json = snapshot?.value;
            if (json == null) return null;
            final userLanguage = UserLanguage.fromJson(json);
            return userLanguage.toLocale();
          })
          .startWith(initialLocale)
          .asBroadcastStream()
        ..listen((event) => _locale = event);

  Future<void> updateNotificationTypeSettings(NotificationType type, TimeOfDay timeOfDay) async {
    final notifSettings = NotificationTypeSettings(
      type: type,
      scheduledHour: timeOfDay.hour,
      scheduledMinute: timeOfDay.minute,
    );
    debugPrint('UserSettingsDao: Changing notification settings to: $notifSettings');
    await _store.record(_getNotificationKey(type)).put(_db, notifSettings.toJson());
  }

  Future<void> removeNotificationTypeSettings(NotificationType type) async {
    debugPrint('UserSettingsDao: Removing notification settings for: $type');
    await _store.record(_getNotificationKey(type)).delete(_db);
  }

  Stream<List<NotificationTypeSettings>> get notificationTypeSettingsStream => _store
      .query(
        finder: Finder(
          filter: Filter.or(
            NotificationType.values.map((type) => Filter.byKey(_getNotificationKey(type))).toList(),
          ),
        ),
      )
      .onSnapshots(_db)
      .map(
        (snapshots) => snapshots.map((s) => NotificationTypeSettings.fromJson(s.value)).toList(),
      );

  Future<NotificationTypeSettings?> getNotificationTypeSettings(NotificationType type) async {
    final json = await _store.record(_getNotificationKey(type)).get(_db);
    if (json == null) return null;
    return NotificationTypeSettings.fromJson(json);
  }

  /// Whether the app has already offered to turn notifications on.
  ///
  /// The OS grants exactly one chance to show its permission dialog, so this
  /// records that the offer was made — whatever the answer was. Someone who
  /// said no is never asked again on launch; Settings → Notifications stays
  /// open to them.
  Future<bool> hasAskedNotificationPermission() async {
    final record = await _store.record(_notifPermissionAskedKey).get(_db);
    return record?['asked'] == true;
  }

  Future<void> markNotificationPermissionAsked() async {
    debugPrint('UserSettingsDao: Marking the notification permission offer as made');
    await _store.record(_notifPermissionAskedKey).put(_db, <String, dynamic>{'asked': true});
  }

  /// Unlocks the DBT programme after someone entered the access code.
  ///
  /// What is stored is the unlocked state, not the code, so changing
  /// `kBpdAccessCode` later never locks anyone back out.
  Future<void> unlockBpdProgramme() async {
    debugPrint('UserSettingsDao: Unlocking the BPD programme');
    await _store.record(_bpdProgrammeUnlockedKey).put(_db, _unlockedRecord);
  }

  Future<bool> isBpdProgrammeUnlocked() async {
    final record = await _store.record(_bpdProgrammeUnlockedKey).get(_db);
    if (_isUnlocked(record)) return true;
    // Anyone already walking the programme when the gate was introduced keeps
    // their access — re-locking them would hide their own entries from them.
    return (await getBpdProgrammeStatus()).hasStarted;
  }

  /// Whether the programme (its home tile and its tab) should be visible.
  ///
  /// Falls back to `hasStarted` on every emission rather than migrating the
  /// old records once, so the grandfathering also covers a database restored
  /// from a backup made before the gate existed.
  Stream<bool> get bpdProgrammeUnlockedStream =>
      _store.record(_bpdProgrammeUnlockedKey).onSnapshot(_db).asyncMap((snapshot) async {
        if (_isUnlocked(snapshot?.value)) return true;
        return (await getBpdProgrammeStatus()).hasStarted;
      }).asBroadcastStream();

  Future<void> markBpdProgrammeStarted() async {
    final now = DateTime.now();
    // The landing screen shows "Začít svou cestu" on every visit, so this runs
    // again for people who are already walking the programme. Only the first
    // time is a start.
    final wasAlreadyStarted = (await getBpdProgrammeStatus()).hasStarted;
    final status = BpdProgrammeStatus(hasStarted: true, startedAt: now);
    debugPrint('UserSettingsDao: Marking BPD Programme as started');
    await _store.record(_bpdProgrammeStatusKey).put(_db, status.toJson());
    // Starting implies unlocked; keeps the stream truthful without waiting for
    // the `hasStarted` fallback.
    await _store.record(_bpdProgrammeUnlockedKey).put(_db, _unlockedRecord);

    // Initialize weeks with time-based unlock
    final bpdWeeksDao = registry.get<BpdWeeksDao>();
    await bpdWeeksDao.initializeWeeks(now);

    if (!wasAlreadyStarted) await BpdAnalytics.logProgrammeStarted();
  }

  Future<BpdProgrammeStatus> getBpdProgrammeStatus() async {
    final json = await _store.record(_bpdProgrammeStatusKey).get(_db);
    if (json == null) return const BpdProgrammeStatus(hasStarted: false);
    return BpdProgrammeStatus.fromJson(json);
  }

  Stream<BpdProgrammeStatus> get bpdProgrammeStatusStream =>
      _store.record(_bpdProgrammeStatusKey).onSnapshot(_db).map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return const BpdProgrammeStatus(hasStarted: false);
        return BpdProgrammeStatus.fromJson(json);
      }).asBroadcastStream();

  /// The participant's study number, as the researcher issued it by e-mail.
  ///
  /// Null until someone types it in, which is the honest state: the app has no
  /// way to invent this number and must not pretend it has one.
  Future<String?> getBpdParticipantCode() async {
    final existing = await _store.record(_bpdParticipantCodeKey).get(_db);
    final stored = existing?['code'];
    return stored is String && stored.isNotEmpty ? stored : null;
  }

  Stream<String?> get bpdParticipantCodeStream =>
      _store.record(_bpdParticipantCodeKey).onSnapshot(_db).map((snapshot) {
        final stored = snapshot?.value['code'];
        return stored is String && stored.isNotEmpty ? stored : null;
      }).asBroadcastStream();

  /// Stores the number, or clears it when given something blank.
  Future<void> setBpdParticipantCode(String code) async {
    final normalized = normalizeBpdParticipantCode(code);
    if (normalized.isEmpty) {
      await _store.record(_bpdParticipantCodeKey).delete(_db);
      return;
    }
    await _store.record(_bpdParticipantCodeKey).put(_db, <String, dynamic>{'code': normalized});
    debugPrint('UserSettingsDao: Stored the participant number');
  }

  Future<void> saveBpdUserProfile(BpdUserProfile profile) async {
    final profileWithTimestamp = BpdUserProfile(
      name: profile.name,
      pronoun: profile.pronoun,
      createdAt: profile.createdAt ?? DateTime.now(),
    );
    debugPrint('UserSettingsDao: Saving BPD user profile: ${profileWithTimestamp.name}');
    await _store.record(_bpdUserProfileKey).put(_db, profileWithTimestamp.toJson());
  }

  Future<BpdUserProfile?> getBpdUserProfile() async {
    final json = await _store.record(_bpdUserProfileKey).get(_db);
    if (json == null) return null;
    return BpdUserProfile.fromJson(json);
  }

  Stream<BpdUserProfile?> get bpdUserProfileStream =>
      _store.record(_bpdUserProfileKey).onSnapshot(_db).map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return null;
        return BpdUserProfile.fromJson(json);
      }).asBroadcastStream();

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
