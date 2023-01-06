import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';
import 'package:tuple/tuple.dart';

class MyContactsCrisisMessageDao {
  MyContactsCrisisMessageDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = StoreRef(_storeKeyName);

  Future<MyContactsCrisisMessageDao> init() async {
    registry.registerSingleton<MyContactsCrisisMessageDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, String?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_contacts_crisis_message';

  static const _contactAddressKey = 'contact_address';
  static const _bodyMessageKey = 'body_message';

  Future<void> saveContactAddress(String contactAddress) async {
    await _store.record(_contactAddressKey).put(_db, contactAddress);
  }

  Future<void> saveBodyMessage(String bodyMessage) async {
    await _store.record(_bodyMessageKey).put(_db, bodyMessage);
  }

  /// Returns a tuple of the contact address and the body message.
  Stream<Tuple2<String, String>> get contactAddressAndMessageStream => Rx.combineLatest2(
        _store.record(_contactAddressKey).onSnapshot(_db).map((snapshot) => snapshot?.value ?? ''),
        _store.record(_bodyMessageKey).onSnapshot(_db).map((snapshot) => snapshot?.value ?? ''),
        Tuple2.new,
      );

  Future<void> doOldVersionMigration(MyContactsCrisisMessageDTO crisisMessageConfig) async {
    final contactAddress = crisisMessageConfig.contactMessageAddress;
    if (contactAddress != null) {
      await saveContactAddress(contactAddress);
    }

    final bodyMessage = crisisMessageConfig.contactMessageBody;
    if (bodyMessage != null) {
      await saveBodyMessage(bodyMessage);
    }
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
