import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_plan_dao.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_reasons_no_dao.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SuicidalThoughtsModuleDb implements NepanikarModuleDb {
  SuicidalThoughtsModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final SuicidalThoughtsPlanDao _suicidalThoughtsPlanDao;
  late final SuicidalThoughtsReasonsNoDao _suicidalThoughtsReasonsNoDao;

  @override
  Future<SuicidalThoughtsModuleDb> initModuleDaos() async {
    _suicidalThoughtsPlanDao = await SuicidalThoughtsPlanDao(dbService: _dbService).init();
    _suicidalThoughtsReasonsNoDao =
        await SuicidalThoughtsReasonsNoDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _suicidalThoughtsPlanDao.clear();
    await _suicidalThoughtsReasonsNoDao.clear();
  }

  Future<void> doModuleOldVersionMigration(NepanikarConfig moduleConfig) async {
    //await _suicidalThoughtsPlanDao.doOldVersionMigration(); // TODO
    //await _suicidalThoughtsReasonsNoDao.doOldVersionMigration(); // TODO
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {
    await _suicidalThoughtsReasonsNoDao.preloadDefaultData(l10n.reasons_example.extractToItems());
  }
}
