import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_afraid_of_dao.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_challenges_dao.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_creative_dao.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_i_like_dao.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_motivation_dao.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_like_on_myself_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class EatingDisorderModuleDb implements NepanikarModuleDb {
  EatingDisorderModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final EatingDisorderFoodCreativeDao _eatingDisorderFoodCreativeDao;
  late final EatingDisorderFoodMotivationDao _eatingDisorderFoodMotivationDao;
  late final EatingDisorderFoodChallengesDao _eatingDisorderFoodChallengesDao;
  late final EatingDisorderLikeOnMyselfDao _eatingDisorderLikeOnMyselfDao;
  late final EatingDisorderFoodILikeDao _eatingDisorderFoodILikeDao;
  late final EatingDisorderFoodAfraidOfDao _eatingDisorderFoodAfraidOfDao;

  @override
  Future<EatingDisorderModuleDb> initModuleDaos() async {
    _eatingDisorderFoodCreativeDao =
        await EatingDisorderFoodCreativeDao(dbService: _dbService).init();
    _eatingDisorderFoodMotivationDao =
        await EatingDisorderFoodMotivationDao(dbService: _dbService).init();
    _eatingDisorderFoodChallengesDao =
        await EatingDisorderFoodChallengesDao(dbService: _dbService).init();
    _eatingDisorderLikeOnMyselfDao =
        await EatingDisorderLikeOnMyselfDao(dbService: _dbService).init();
    _eatingDisorderFoodILikeDao = await EatingDisorderFoodILikeDao(dbService: _dbService).init();
    _eatingDisorderFoodAfraidOfDao =
        await EatingDisorderFoodAfraidOfDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _eatingDisorderFoodCreativeDao.clear();
    await _eatingDisorderFoodMotivationDao.clear();
    await _eatingDisorderFoodChallengesDao.clear();
    await _eatingDisorderLikeOnMyselfDao.clear();
    await _eatingDisorderFoodILikeDao.clear();
    await _eatingDisorderFoodAfraidOfDao.clear();
  }

  Future<void> doModuleOldVersionMigration(NepanikarConfig moduleConfig) async {
    //await _eatingDisorderFoodCreativeDao.doOldVersionMigration(); // TODO
    //await _eatingDisorderFoodMotivationDao.doOldVersionMigration(); // TODO
    //await _eatingDisorderFoodChallengesDao.doOldVersionMigration(); // TODO
    //await _eatingDisorderLikeOnMyselfDao.doOldVersionMigration(); // TODO
    //await _eatingDisorderFoodILikeDao.doOldVersionMigration(); // TODO
    //await _eatingDisorderFoodAfraidOfDao.doOldVersionMigration(); // TODO
  }
}
