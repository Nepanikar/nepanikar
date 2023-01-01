import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_helped_dao.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_plan_dao.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_timer_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SelfHarmModuleDb implements NepanikarModuleDb {
  SelfHarmModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final SelfHarmPlanDao _selfHarmPlanDao;
  late final SelfHarmTimerDao _selfHarmTimerDao;
  late final SelfHarmHelpedDao _selfHarmHelpedDao;

  @override
  Future<SelfHarmModuleDb> initModuleDaos() async {
    _selfHarmPlanDao = await SelfHarmPlanDao(dbService: _dbService).init();
    _selfHarmTimerDao = await SelfHarmTimerDao(dbService: _dbService).init();
    _selfHarmHelpedDao = await SelfHarmHelpedDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _selfHarmPlanDao.clear();
    await _selfHarmTimerDao.clear();
    await _selfHarmHelpedDao.clear();
  }

  Future<void> doModuleOldVersionMigration(SelfHarmModuleDTO moduleConfig) async {
    // await _selfHarmPlanDao.doOldVersionMigration(); // TODO
    final selfHarmTimerConfig = moduleConfig.selfHarmTimerConfig;
    if (selfHarmTimerConfig != null) {
      await _selfHarmTimerDao.doOldVersionMigration(selfHarmTimerConfig);
    }
    // await _selfHarmHelpedDao.doOldVersionMigration(); // TODO
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {}
}
