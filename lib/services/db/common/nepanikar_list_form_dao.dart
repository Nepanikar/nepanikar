import 'package:nepanikar/services/db/database_service.dart';
import 'package:sembast/sembast.dart';

typedef ListFormItem = String;

abstract class NepanikarListFormDao {
  NepanikarListFormDao({
    required DatabaseService dbService,
    required String storeKeyName,
  })  : _dbService = dbService,
        _store = StoreRef(storeKeyName);

  // TODO: use @mustBeOverridden annotation, will be available in Dart 2.19
  Future<NepanikarListFormDao> init() async => this;

  final DatabaseService _dbService;
  final StoreRef<String, ListFormItem> _store;

  Database get _db => _dbService.database;

  Future<void> createFormText() async {
    await _store.add(_db, '');
  }

  Future<void> updateFormText(String key, {required String text}) async {
    await _store.record(key).put(_db, text);
  }

  Future<void> deleteFormItem(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<List<RecordSnapshot<String, ListFormItem>>> get allFormItemsRecordsStream =>
      _store.query().onSnapshots(_db);

  Future<void> doOldVersionMigration() async {
    // TODO: implement doOldVersionMigration
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
