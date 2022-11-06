import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_dao.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_timer_dao.dart';
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
    if (!_isDataMigrationFromOldAppVersionNeeded) await _initDaos(db);
  }

  Future<void> _initDaos(Database db) async {
    database = db;
    _userSettingsDao = await UserSettingsDao(dbService: this).init();
    _selfHarmTimerDao = await SelfHarmTimerDao(dbService: this).init();
    _moodTrackDao = await MoodTrackDao(dbService: this).init();
  }

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
            await _initDaos(db);
            await _doDataMigrationFromOldAppVersion();
          } else {
            debugPrint('DATABASE_SERVICE: Old app version data NOT FOUND.');
          }
        }
      },
    );
    return db;
  }

  final SaveDirectories _saveDirectories;

  late final Database database;
  late final StoreRef<String, Map<String, dynamic>> mainStore;
  late final UserSettingsDao _userSettingsDao;
  late final SelfHarmTimerDao _selfHarmTimerDao;
  late final MoodTrackDao _moodTrackDao;

  bool _isDataMigrationFromOldAppVersionNeeded = false;

  static const _dbFileName = 'app.db';

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
    // await Future.delayed(const Duration(seconds: 5));
    final nepanikarConfig = NepanikarConfigParser.parseConfigFile(configFile);

    final relaxationModuleConfig = nepanikarConfig.relaxationModuleConfig;
    if (relaxationModuleConfig != null) {
      final moodTrackMap = relaxationModuleConfig.moodTrackConfig?.values;
      if (moodTrackMap != null) {
        for (final moodTrackEntry in moodTrackMap.entries) {
          final mood = Mood.fromInteger(moodTrackEntry.value);
          if (mood != null) {
            final dateTime = moodTrackEntry.key;
            await _moodTrackDao.saveMood(mood, dateTime);
          }
        }
      }
    }

    final selfHarmModuleConfig = nepanikarConfig.selfHarmModuleConfig;
    if (selfHarmModuleConfig != null) {
      final selfHarmTimerConfig = selfHarmModuleConfig.selfHarmTimerConfig;
      if (selfHarmTimerConfig != null) {
        if (selfHarmTimerConfig.curSelfHarmTimerStartDateTime != null) {
          await _selfHarmTimerDao
              .startSelfHarmTimer(selfHarmTimerConfig.curSelfHarmTimerStartDateTime);
        }

        if (selfHarmTimerConfig.selfHarmTimerRecord != null) {
          final nowUtc = DateTime.now().toUtc();
          await _selfHarmTimerDao.saveNewBestRecord(
            DateTimeRange(
              start: nowUtc.subtract(Duration(seconds: selfHarmTimerConfig.selfHarmTimerRecord!)),
              end: nowUtc,
            ),
          );
        }
      }
    }
  }

  Future<void> clearAll() async {
    await mainStore.drop(database);
    await _userSettingsDao.clear();
    await _selfHarmTimerDao.clear();
    await _moodTrackDao.clear();
  }
}
