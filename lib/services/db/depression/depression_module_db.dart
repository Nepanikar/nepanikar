import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/depression/depression_activity_plan_dao.dart';
import 'package:nepanikar/services/db/depression/depression_nice_made_happy_dao.dart';
import 'package:nepanikar/services/db/depression/depression_praise_my_achievements_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class DepressionModuleDb implements NepanikarModuleDb {
  DepressionModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final DepressionActivityPlanDao _depressionActivityPlanDao;
  late final DepressionNiceMadeHappyDao _depressionNiceMadeHappyDao;
  late final DepressionPraiseMyAchievementsDao _depressionPraiseMyAchievementsDao;

  @override
  Future<DepressionModuleDb> initModuleDaos() async {
    _depressionActivityPlanDao = await DepressionActivityPlanDao(dbService: _dbService).init();
    _depressionNiceMadeHappyDao = await DepressionNiceMadeHappyDao(dbService: _dbService).init();
    _depressionPraiseMyAchievementsDao =
        await DepressionPraiseMyAchievementsDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _depressionActivityPlanDao.clear();
    await _depressionNiceMadeHappyDao.clear();
    await _depressionPraiseMyAchievementsDao.clear();
  }

  Future<void> doModuleOldVersionMigration(DepressionModuleDTO moduleConfig) async {
    final activityPlanConfig = moduleConfig.depressionActivityPlanConfig;
    if (activityPlanConfig != null) {
      await _depressionActivityPlanDao.doOldVersionMigration(activityPlanConfig);
    }

    final niceMadeHappyConfig = moduleConfig.depressionNiceMadeHappyConfig;
    if (niceMadeHappyConfig != null) {
      await _depressionNiceMadeHappyDao.doOldVersionMigration(niceMadeHappyConfig);
    }

    final praiseMyAchievementsConfig = moduleConfig.depressionPraiseMyAchievementsConfig;
    if (praiseMyAchievementsConfig != null) {
      await _depressionPraiseMyAchievementsDao.doOldVersionMigration(praiseMyAchievementsConfig);
    }
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {
    await _depressionActivityPlanDao.preloadDefaultData(l10n.plan_example.extractToItems());
    await _depressionNiceMadeHappyDao.preloadDefaultData(l10n.nice_example.extractToItems());
    await _depressionPraiseMyAchievementsDao
        .preloadDefaultData(l10n.praise_example.extractToItems());
  }
}
