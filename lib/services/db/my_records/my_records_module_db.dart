import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsModuleDb implements NepanikarModuleDb {
  MyRecordsModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final MoodTrackDao _moodTrackDao;

  @override
  Future<MyRecordsModuleDb> initModuleDaos() async {
    _moodTrackDao = await MoodTrackDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _moodTrackDao.clear();
  }

  Future<void> doModuleOldVersionMigration(MyRecordsModuleDTO moduleConfig) async {
    final moodTrackConfig = moduleConfig.moodTrackConfig;
    if (moodTrackConfig != null) {
      await _moodTrackDao.doOldVersionMigration(moodTrackConfig);
    }
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {}
}
