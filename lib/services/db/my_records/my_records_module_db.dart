import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/my_records/diary/my_records_diary_dao.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_dao.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/my_records_sleep_track_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsModuleDb implements NepanikarModuleDb {
  MyRecordsModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final MoodTrackDao _moodTrackDao;
  late final MyRecordsSleepTrackDao _myRecordsSleepTrackDao;
  late final MyRecordsDiaryDao _myRecordsDiaryDao;
  late final MyRecordsJournalDao _myRecordsJournalDao;
  late final MyRecordsFoodRecordDao _myRecordsFoodRecordDao;

  @override
  Future<MyRecordsModuleDb> initModuleDaos() async {
    _moodTrackDao = await MoodTrackDao(dbService: _dbService).init();
    _myRecordsSleepTrackDao = await MyRecordsSleepTrackDao(dbService: _dbService).init();
    _myRecordsDiaryDao = await MyRecordsDiaryDao(dbService: _dbService).init();
    _myRecordsJournalDao = await MyRecordsJournalDao(dbService: _dbService).init();
    _myRecordsFoodRecordDao = await MyRecordsFoodRecordDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _moodTrackDao.clear();
    await _myRecordsSleepTrackDao.clear();
    await _myRecordsDiaryDao.clear();
    await _myRecordsJournalDao.clear();
    await _myRecordsFoodRecordDao.clear();
  }

  Future<void> doModuleOldVersionMigration(MyRecordsModuleDTO moduleConfig) async {
    final moodTrackConfig = moduleConfig.moodTrackConfig;
    if (moodTrackConfig != null) {
      await _moodTrackDao.doOldVersionMigration(moodTrackConfig);
    }

    final sleepTrackConfig = moduleConfig.sleepTrackConfig;
    if (sleepTrackConfig != null) {
      final sleepTrackValues = sleepTrackConfig.values;
      if (sleepTrackValues != null) {
        await _myRecordsSleepTrackDao
            .doOldVersionMigration(MyRecordsMoodTrackDTO.fromValues(sleepTrackValues));
      }
    }

    final diaryConfig = moduleConfig.diaryConfig;
    if (diaryConfig != null) {
      await _myRecordsDiaryDao.doOldVersionMigration(diaryConfig);
    }

    final journalConfig = moduleConfig.journalConfig;
    if (journalConfig != null) {
      await _myRecordsJournalDao.doOldVersionMigration(journalConfig);
    }

    final foodRecordConfig = moduleConfig.foodRecordConfig;
    if (foodRecordConfig != null) {
      await _myRecordsFoodRecordDao.doOldVersionMigration(foodRecordConfig);
    }
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {}
}
