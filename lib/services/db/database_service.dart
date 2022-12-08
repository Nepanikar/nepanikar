import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/depression/depression_module_db.dart';
import 'package:nepanikar/services/db/my_records/my_records_module_db.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_module_db.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_module_db.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/save_directories.dart';
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
    final db = await _checkPreloadDataFromOldAppVersion();
    if (!_isDataMigrationFromOldAppVersionNeeded) await _initModuleDaos(db);
  }

  Future<void> _initModuleDaos(Database db) async {
    database = db;
    _userSettingsDao = await UserSettingsDao(dbService: this).init();
    _depressionModuleDb = await DepressionModuleDb(this).initModuleDaos();
    _selfHarmModuleDb = await SelfHarmModuleDb(this).initModuleDaos();
    _suicidalThoughtsModuleDb = await SuicidalThoughtsModuleDb(this).initModuleDaos();
    _myRecordsModuleDb = await MyRecordsModuleDb(this).initModuleDaos();
  }

  final SaveDirectories _saveDirectories;

  late final Database database;

  late final StoreRef<String, Map<String, dynamic>> mainStore;

  late final UserSettingsDao _userSettingsDao;
  late final DepressionModuleDb _depressionModuleDb;
  late final SelfHarmModuleDb _selfHarmModuleDb;
  late final SuicidalThoughtsModuleDb _suicidalThoughtsModuleDb;
  late final MyRecordsModuleDb _myRecordsModuleDb;

  bool _isDataMigrationFromOldAppVersionNeeded = false;

  static const _dbFileName = 'app.db';

  /// https://github.com/tekartik/sembast.dart/blob/master/sembast/doc/open.md#preloading-data
  Future<Database> _checkPreloadDataFromOldAppVersion() async {
    final db = databaseFactoryIo.openDatabase(
      join(_saveDirectories.dbDirPath, _dbFileName),
      version: 1,
      onVersionChanged: (db, oldVersion, newVersion) async {
        // If oldVersion is 0, we are creating the database for the first time.
        if (oldVersion == 0) {
          debugPrint('DATABASE_SERVICE: Creating database for the first time - first app install.');
          final oldVersionAppDataExists = await _oldAppVersionDataExists();
          // ignore: dead_code
          if (oldVersionAppDataExists) {
            debugPrint('DATABASE_SERVICE: Old app version data FOUND.');
            _isDataMigrationFromOldAppVersionNeeded = true;
            await _initModuleDaos(db);
            await _doDataMigrationFromOldAppVersion();
          } else {
            debugPrint('DATABASE_SERVICE: Old app version data NOT FOUND.');
          }
        }
      },
    );
    return db;
  }

  Future<bool> _oldAppVersionDataExists() async {
    final configPath = _saveDirectories.oldAppDataConfigFilePath;
    if (await File(configPath).exists()) {
      return true;
    }
    return false;
  }

  Future<File?> getOldAppConfigFile() async {
    final configPath = _saveDirectories.oldAppDataConfigFilePath;
    if (await File(configPath).exists()) {
      return File(configPath);
    }
    return null;
  }

  Future<void> _doDataMigrationFromOldAppVersion() async {
    final configFile = await getOldAppConfigFile();
    if (configFile == null) return;

    final nepanikarConfig = NepanikarConfigParser.parseConfigFile(configFile);

    final myRecordsModuleConfig = nepanikarConfig.myRecordsModuleConfig;
    if (myRecordsModuleConfig != null) {
      await _myRecordsModuleDb.doModuleOldVersionMigration(myRecordsModuleConfig);
    }

    final selfHarmModuleConfig = nepanikarConfig.selfHarmModuleConfig;
    if (selfHarmModuleConfig != null) {
      await _selfHarmModuleDb.doModuleOldVersionMigration(selfHarmModuleConfig);
    }
  }

  Future<void> clearAll() async {
    await mainStore.drop(database);
    await _userSettingsDao.clear();
    await _depressionModuleDb.clearModule();
    await _selfHarmModuleDb.clearModule();
    await _suicidalThoughtsModuleDb.clearModule();
    await _myRecordsModuleDb.clearModule();
  }
}
