import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_models.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';

class UserSettingsDao {
  UserSettingsDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = StoreRef(_storeKeyName);

  Future<UserSettingsDao> init() async {
    registry.registerSingleton<UserSettingsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>> _store;

  Database get _db => _dbService.database;

  static const _themeModeKey = 'theme_mode';
  static const _storeKeyName = 'user_settings';
  static const _languageKey = 'language';
  static const _notificationKeyPrefix = 'notification_type_';

  Future<void> saveThemeMode(ThemeMode themeMode) async{
    final themeModeStr = UserThemeMode.themeModeToString(themeMode);
    final userThemeMode = UserThemeMode(themeMode: themeModeStr);
    debugPrint('UserSettingsDao: Changing theme mode to: $themeModeStr');
    await _store.record(_themeModeKey).put(_db, userThemeMode.toJson());
  }

  Future<ThemeMode> getThemeMode() async {
    final json = await _store.record(_themeModeKey).get(_db);
    if(json == null) return ThemeMode.system;
    final userThemeMode = UserThemeMode.fromJson(json);
    return userThemeMode.getThemeMode();
  }

  Stream<ThemeMode> get themeModeStream => _store
      .record(_themeModeKey)
      .onSnapshot(_db)
      .map((snapshot){
        final themeModeStr = snapshot?.value;
        if(themeModeStr == null) return ThemeMode.system;
        final userThemeMode = UserThemeMode.fromJson(themeModeStr);
        return userThemeMode.getThemeMode();
  })
      .asBroadcastStream();

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

  Stream<Locale> get localeStream => _store
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

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
