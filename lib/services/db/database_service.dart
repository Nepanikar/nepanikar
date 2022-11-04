import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_dao.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_timer_dao.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/save_directories.dart';
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
          // TODO: Check if if the app's data contains some data from the old app version, if yes - do migration.
          const oldVersionAppDataExists = false;
          // ignore: dead_code
          if (oldVersionAppDataExists) {
            _isDataMigrationFromOldAppVersionNeeded = true;
            await _initDaos(db);
            await _doDataMigrationFromOldAppVersion();
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

  // ignore: unused_field
  late final SelfHarmTimerDao _selfHarmTimerDao;

  // ignore: unused_field
  late final MoodTrackDao _moodTrackDao;

  bool _isDataMigrationFromOldAppVersionNeeded = false;

  static const _dbFileName = 'app.db';

  Future<void> _doDataMigrationFromOldAppVersion() async {
    // Example migration code.
    await _userSettingsDao.saveLocale(const Locale('pl'));
  }

  Future<void> clearAll() async {
    await mainStore.drop(database);
    await _userSettingsDao.clear();
  }
}
