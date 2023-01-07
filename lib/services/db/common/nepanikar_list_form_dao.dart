import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
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

  Future<void> _addFormTexts(List<String> texts) async {
    await _store.addAll(_db, texts);
  }

  Future<void> updateFormText(String key, {required String text}) async {
    await _store.record(key).put(_db, text);
  }

  Future<void> deleteFormItem(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<List<RecordSnapshot<String, ListFormItem>>> get allFormItemsRecordsStream => _store.query().onSnapshots(_db);

  Future<void> preloadDefaultData(List<String> texts) async {
    await _addFormTexts(texts);
  }

  Future<void> doOldVersionMigration(NepanikarListFormDTO listFormConfig) async {
    final listFormItems = listFormConfig.texts;
    if (listFormItems != null) {
      await _addFormTexts(listFormItems);
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
