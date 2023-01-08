import 'package:nepanikar/services/db/common/checklist_item_model.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:sembast/sembast.dart';

abstract class NepanikarCheckListFormDao {
  NepanikarCheckListFormDao({
    required DatabaseService dbService,
    required String storeKeyName,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(storeKeyName);

  // TODO: use @mustBeOverridden annotation, will be available in Dart 2.19
  Future<NepanikarCheckListFormDao> init() async => this;

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  Future<void> createFormText() async {
    final emptyItem = const ChecklistItem(text: '').toJson();
    await _store.add(_db, emptyItem);
  }

  Future<void> _addFormItems(List<ChecklistItem> items) async {
    final serializedItems = items.map((item) => item.toJson()).toList();
    await _store.addAll(_db, serializedItems);
  }

  Future<void> updateFormText(
    String key, {
    required ChecklistItem item,
    required String newText,
  }) async {
    final updatedItem = item.copyWith(text: newText).toJson();
    await _store.record(key).put(_db, updatedItem);
  }

  Future<void> updateFormState(String key, {required ChecklistItem item}) async {
    final updatedItem = item.copyWith(isChecked: !item.isChecked).toJson();
    await _store.record(key).put(_db, updatedItem);
  }

  Future<void> deleteFormItem(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<Map<String, ChecklistItem>> get allFormItemsRecordsStream =>
      _store.query().onSnapshots(_db).map((event) {
        final entries = event
            .map((e) {
              final value = e.value;
              if (value == null) return null;
              final model = ChecklistItem.fromJson(value);
              return MapEntry<String, ChecklistItem>(e.key, model);
            })
            .whereType<MapEntry<String, ChecklistItem>>()
            .toList();
        return Map.fromEntries(entries);
      });

  Future<void> preloadDefaultData(List<String> texts) async {
    await _addFormItems(texts.map((e) => ChecklistItem(text: e)).toList());
  }

  Future<void> doOldVersionMigration(NepanikarChecklistFormDTO checklistConfig) async {
    final checklistItems = checklistConfig.records;
    if (checklistItems != null) {
      await _addFormItems(
        checklistItems.map((e) => ChecklistItem(text: e.key, isChecked: e.value)).toList(),
      );
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
