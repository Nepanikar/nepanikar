import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/services/db/common/nepanikar_module_db.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/my_contacts/my_contact_crisis_message_dao.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_records_dao.dart';

class MyContactsModuleDb implements NepanikarModuleDb {
  MyContactsModuleDb(this._dbService);

  final DatabaseService _dbService;

  late final MyContactsRecordsDao _myContactsRecordsDao;
  late final MyContactsCrisisMessageDao _myContactsCrisisMessageDao;

  @override
  Future<MyContactsModuleDb> initModuleDaos() async {
    _myContactsRecordsDao = await MyContactsRecordsDao(dbService: _dbService).init();
    _myContactsCrisisMessageDao = await MyContactsCrisisMessageDao(dbService: _dbService).init();
    return this;
  }

  @override
  Future<void> clearModule() async {
    await _myContactsRecordsDao.clear();
    await _myContactsCrisisMessageDao.clear();
  }

  @override
  Future<void> preloadDefaultModuleData(AppLocalizations l10n) async {}
}
