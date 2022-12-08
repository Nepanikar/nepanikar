import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/depression/depression_activity_plan_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class DepressionModuleDb implements NepanikarModuleDb {
  DepressionModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final DepressionActivityPlanDao _depressionActivityPlanDao;

  @override
  Future<DepressionModuleDb> initModuleDaos() async {
    _depressionActivityPlanDao = await DepressionActivityPlanDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _depressionActivityPlanDao.clear();
  }

  Future<void> doModuleOldVersionMigration(NepanikarConfig moduleConfig) async {
    // await _depressionActivityPlanDao.doOldVersionMigration(); // TODO
  }
}
