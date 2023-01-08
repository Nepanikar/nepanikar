import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';
import 'package:nepanikar/services/db/depression/depression_module_db.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_module_db.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_module_db.dart';
import 'package:nepanikar/services/db/my_records/my_records_module_db.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_module_db.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_module_db.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/crashlytics_utils.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseService {
  DatabaseService({
    required SaveDirectories saveDirectories,
  }) : _saveDirectories = saveDirectories;

  Future<void> init() async {
    mainStore = StoreRef.main();
    final db = await _initDb();
    if (!_areDaosInitialized) {
      await _initModuleDaos(db);
    }
  }

  Future<void> _initModuleDaos(Database db) async {
    database = db;
    _userSettingsDao = await UserSettingsDao(dbService: this).init();
    _depressionModuleDb = await DepressionModuleDb(this).initModuleDaos();
    _selfHarmModuleDb = await SelfHarmModuleDb(this).initModuleDaos();
    _suicidalThoughtsModuleDb = await SuicidalThoughtsModuleDb(this).initModuleDaos();
    _eatingDisorderModuleDb = await EatingDisorderModuleDb(this).initModuleDaos();
    _myRecordsModuleDb = await MyRecordsModuleDb(this).initModuleDaos();
    _myContactsModuleDb = await MyContactsModuleDb(this).initModuleDaos();
    _areDaosInitialized = true;
  }

  final SaveDirectories _saveDirectories;

  late final Database database;

  late final StoreRef<String, dynamic> mainStore;

  late final UserSettingsDao _userSettingsDao;
  late final DepressionModuleDb _depressionModuleDb;
  late final SelfHarmModuleDb _selfHarmModuleDb;
  late final SuicidalThoughtsModuleDb _suicidalThoughtsModuleDb;
  late final EatingDisorderModuleDb _eatingDisorderModuleDb;
  late final MyRecordsModuleDb _myRecordsModuleDb;
  late final MyContactsModuleDb _myContactsModuleDb;

  bool _areDaosInitialized = false;

  static const _dbFileName = 'app.db';

  static const _dataPreloadedKey = 'data_preloaded';

  late final databasePath = join(_saveDirectories.dbDirPath, _dbFileName);

  /// https://github.com/tekartik/sembast.dart/blob/master/sembast/doc/open.md#preloading-data
  Future<Database> _initDb() async {
    final db = databaseFactoryIo.openDatabase(
      databasePath,
      version: 1,
      onVersionChanged: (db, oldVersion, newVersion) async {
        // If oldVersion is 0, we are creating the database for the first time.
        if (oldVersion == 0) {
          debugPrint('DATABASE_SERVICE: Creating database for the first time - first app install.');
          final oldVersionAppDataExists = await _oldAppVersionDataExists();
          if (oldVersionAppDataExists) {
            debugPrint('DATABASE_SERVICE: Old app version data FOUND.');
            await _initModuleDaos(db);
            await _setDataPreloaded(); // Do not preload data if old app version data exists.
            await _doDataMigrationFromOldAppVersion();
          } else {
            debugPrint('DATABASE_SERVICE: Old app version data NOT FOUND.');
          }
        }
      },
    );
    return db;
  }

  Future<void> checkDataPreloaded(AppLocalizations l10n) async {
    final areDataPreloaded = await mainStore.record(_dataPreloadedKey).get(database) as bool?;
    if (areDataPreloaded == null || !areDataPreloaded) {
      debugPrint('DATABASE_SERVICE: Preloading default data.');
      await preloadDefaultData(l10n);
      await _setDataPreloaded();
    } else {
      debugPrint('DATABASE_SERVICE: Default data preload not needed.');
    }
  }

  Future<void> _setDataPreloaded() async {
    await mainStore.record(_dataPreloadedKey).put(database, true);
  }

  Future<void> preloadDefaultData(AppLocalizations l10n) async {
    await _depressionModuleDb.preloadDefaultModuleData(l10n);
    await _selfHarmModuleDb.preloadDefaultModuleData(l10n);
    await _suicidalThoughtsModuleDb.preloadDefaultModuleData(l10n);
    await _eatingDisorderModuleDb.preloadDefaultModuleData(l10n);
    await _myRecordsModuleDb.preloadDefaultModuleData(l10n);
    await _myContactsModuleDb.preloadDefaultModuleData(l10n);
  }

  Future<bool> _oldAppVersionDataExists() async {
    if (Platform.isAndroid) {
      final configPath = _saveDirectories.oldAppDataConfigFilePath;
      if (await File(configPath).exists()) {
        return true;
      }
      return false;
    } else if (Platform.isIOS) {
      try {
        final map = await NativeSharedPreferences.getSharedPreferencesMap();
        return map.containsKey('selfHarmExist') || map.containsKey('selfHarmPlan.size');
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage: 'DATABASE_SERVICE: Error while checking if old app version IOS data exists',
        );
      }
    }
    return false;
  }

  Future<File?> getOldAndroidAppConfigFile() async {
    final configPath = _saveDirectories.oldAppDataConfigFilePath;
    if (await File(configPath).exists()) {
      return File(configPath);
    }
    return null;
  }

  Future<void> _doDataMigrationFromOldAppVersion() async {
    final configFile = await getOldAndroidAppConfigFile();
    if (configFile == null) return;

    final nepanikarConfig = NepanikarConfigParser.parseConfigFile(configFile);

    final depressionModuleConfig = nepanikarConfig.depressionModuleConfig;
    if (depressionModuleConfig != null) {
      try {
        await _depressionModuleDb.doModuleOldVersionMigration(depressionModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating depression module data from old app version',
        );
      }
    }

    final selfHarmModuleConfig = nepanikarConfig.selfHarmModuleConfig;
    if (selfHarmModuleConfig != null) {
      try {
        await _selfHarmModuleDb.doModuleOldVersionMigration(selfHarmModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating self harm module data from old app version',
        );
      }
    }

    final suicidalThoughtsModuleConfig = nepanikarConfig.suicidalThoughtsModuleConfig;
    if (suicidalThoughtsModuleConfig != null) {
      try {
        await _suicidalThoughtsModuleDb.doModuleOldVersionMigration(suicidalThoughtsModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating suicidal thoughts module data from old app version',
        );
      }
    }

    final eatingDisorderModuleConfig = nepanikarConfig.eatingDisorderModuleConfig;
    if (eatingDisorderModuleConfig != null) {
      try {
        await _eatingDisorderModuleDb.doModuleOldVersionMigration(eatingDisorderModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating eating disorder module data from old app version',
        );
      }
    }

    final myRecordsModuleConfig = nepanikarConfig.myRecordsModuleConfig;
    if (myRecordsModuleConfig != null) {
      try {
        await _myRecordsModuleDb.doModuleOldVersionMigration(myRecordsModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating my records module data from old app version',
        );
      }
    }

    final myContactsModuleConfig = nepanikarConfig.myContactsModuleConfig;
    if (myContactsModuleConfig != null) {
      try {
        await _myContactsModuleDb.doModuleOldVersionMigration(myContactsModuleConfig);
      } catch (e, s) {
        await logExceptionToCrashlytics(
          e,
          s,
          logMessage:
              'DATABASE_SERVICE: Error while migrating my contacts module data from old app version',
        );
      }
    }
  }

  Future<void> clearAll() async {
    await mainStore.delete(database);
    await _userSettingsDao.clear();
    await _depressionModuleDb.clearModule();
    await _selfHarmModuleDb.clearModule();
    await _suicidalThoughtsModuleDb.clearModule();
    await _eatingDisorderModuleDb.clearModule();
    await _myRecordsModuleDb.clearModule();
    await _myContactsModuleDb.clearModule();
  }
}
