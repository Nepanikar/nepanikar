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

  late final MoodTrackDao moodTrackDao;
  late final MyRecordsSleepTrackDao myRecordsSleepTrackDao;
  late final MyRecordsDiaryDao myRecordsDiaryDao;
  late final MyRecordsJournalDao myRecordsJournalDao;
  late final MyRecordsFoodRecordDao myRecordsFoodRecordDao;

  @override
  Future<MyRecordsModuleDb> initModuleDaos() async {
    moodTrackDao = await MoodTrackDao(dbService: _dbService).init();
    myRecordsSleepTrackDao = await MyRecordsSleepTrackDao(dbService: _dbService).init();
    myRecordsDiaryDao = await MyRecordsDiaryDao(dbService: _dbService).init();
    myRecordsJournalDao = await MyRecordsJournalDao(dbService: _dbService).init();
    myRecordsFoodRecordDao = await MyRecordsFoodRecordDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await moodTrackDao.clear();
    await myRecordsSleepTrackDao.clear();
    await myRecordsDiaryDao.clear();
    await myRecordsJournalDao.clear();
    await myRecordsFoodRecordDao.clear();
  }

  Future<void> doModuleOldVersionMigration(MyRecordsModuleDTO moduleConfig) async {
    final moodTrackConfig = moduleConfig.moodTrackConfig;
    if (moodTrackConfig != null) {
      await moodTrackDao.doOldVersionMigration(moodTrackConfig);
    }

    final sleepTrackConfig = moduleConfig.sleepTrackConfig;
    if (sleepTrackConfig != null) {
      final sleepTrackValues = sleepTrackConfig.values;
      if (sleepTrackValues != null) {
        await myRecordsSleepTrackDao
            .doOldVersionMigration(MyRecordsMoodTrackDTO.fromValues(sleepTrackValues));
      }
    }

    final diaryConfig = moduleConfig.diaryConfig;
    if (diaryConfig != null) {
      await myRecordsDiaryDao.doOldVersionMigration(diaryConfig);
    }

    final journalConfig = moduleConfig.journalConfig;
    if (journalConfig != null) {
      await myRecordsJournalDao.doOldVersionMigration(journalConfig);
    }

    final foodRecordConfig = moduleConfig.foodRecordConfig;
    if (foodRecordConfig != null) {
      await myRecordsFoodRecordDao.doOldVersionMigration(foodRecordConfig);
    }
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {}
}
