import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_tracker_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenges_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_expectations_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_reflection_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';

class BpdModuleDb implements NepanikarModuleDb {
  BpdModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final BpdWeeksDao _bpdWeeksDao;
  late final BpdDaysDao _bpdDaysDao;
  late final BpdSmartGoalsDao _bpdSmartGoalsDao;
  late final BpdExpectationsDao _bpdExpectationsDao;
  late final BpdChallengesDao _bpdChallengesDao;
  late final BpdChallengeTrackerDao _bpdChallengeTrackerDao;
  late final BpdReflectionDao _bpdReflectionDao;
  late final BpdRescuePackageDao _bpdRescuePackageDao;
  late final BpdWorksheetDao _bpdWorksheetDao;

  BpdWeeksDao get bpdWeeksDao => _bpdWeeksDao;
  BpdDaysDao get bpdDaysDao => _bpdDaysDao;
  BpdSmartGoalsDao get bpdSmartGoalsDao => _bpdSmartGoalsDao;
  BpdExpectationsDao get bpdExpectationsDao => _bpdExpectationsDao;
  BpdChallengesDao get bpdChallengesDao => _bpdChallengesDao;
  BpdChallengeTrackerDao get bpdChallengeTrackerDao => _bpdChallengeTrackerDao;
  BpdReflectionDao get bpdReflectionDao => _bpdReflectionDao;
  BpdRescuePackageDao get bpdRescuePackageDao => _bpdRescuePackageDao;
  BpdWorksheetDao get bpdWorksheetDao => _bpdWorksheetDao;

  @override
  Future<BpdModuleDb> initModuleDaos() async {
    _bpdWeeksDao = await BpdWeeksDao(dbService: _dbService).init();
    _bpdDaysDao = await BpdDaysDao(dbService: _dbService).init();
    _bpdSmartGoalsDao = await BpdSmartGoalsDao(dbService: _dbService).init();
    _bpdExpectationsDao = await BpdExpectationsDao(dbService: _dbService).init();
    _bpdChallengesDao = await BpdChallengesDao(dbService: _dbService).init();
    _bpdChallengeTrackerDao = await BpdChallengeTrackerDao(dbService: _dbService).init();
    _bpdReflectionDao = await BpdReflectionDao(dbService: _dbService).init();
    _bpdRescuePackageDao = await BpdRescuePackageDao(dbService: _dbService).init();
    _bpdWorksheetDao = await BpdWorksheetDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _bpdWeeksDao.clear();
    await _bpdDaysDao.clear();
    await _bpdSmartGoalsDao.clear();
    await _bpdExpectationsDao.clear();
    await _bpdChallengesDao.clear();
    await _bpdChallengeTrackerDao.clear();
    await _bpdReflectionDao.clear();
    await _bpdRescuePackageDao.clear();
    await _bpdWorksheetDao.clear();
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {
    // No default data to preload for BPD module
    // Weeks are initialized when user starts the programme
  }
}
