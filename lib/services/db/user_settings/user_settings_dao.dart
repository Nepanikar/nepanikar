import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_models.dart';
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

  static const _storeKeyName = 'user_settings';
  static const _languageKey = 'language';

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

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
