import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_expectations_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';

class BpdModuleDb implements NepanikarModuleDb {
  BpdModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final BpdWeeksDao _bpdWeeksDao;
  late final BpdDaysDao _bpdDaysDao;
  late final BpdSmartGoalsDao _bpdSmartGoalsDao;
  late final BpdExpectationsDao _bpdExpectationsDao;

  BpdWeeksDao get bpdWeeksDao => _bpdWeeksDao;
  BpdDaysDao get bpdDaysDao => _bpdDaysDao;
  BpdSmartGoalsDao get bpdSmartGoalsDao => _bpdSmartGoalsDao;
  BpdExpectationsDao get bpdExpectationsDao => _bpdExpectationsDao;

  @override
  Future<BpdModuleDb> initModuleDaos() async {
    _bpdWeeksDao = await BpdWeeksDao(dbService: _dbService).init();
    _bpdDaysDao = await BpdDaysDao(dbService: _dbService).init();
    _bpdSmartGoalsDao = await BpdSmartGoalsDao(dbService: _dbService).init();
    _bpdExpectationsDao = await BpdExpectationsDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _bpdWeeksDao.clear();
    await _bpdDaysDao.clear();
    await _bpdSmartGoalsDao.clear();
    await _bpdExpectationsDao.clear();
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {
    // No default data to preload for BPD module
    // Weeks are initialized when user starts the programme
  }
}
