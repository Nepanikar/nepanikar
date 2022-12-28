import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar/services/db/my_records/diary/diary_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class MyRecordsDiaryDao {
  MyRecordsDiaryDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(_storeKeyName);

  Future<MyRecordsDiaryDao> init() async {
    registry.registerSingleton<MyRecordsDiaryDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_records_diary';

  Future<String> createRecord(DiaryRecord diaryRecord) async {
    final item = diaryRecord.toJson();
    return _store.add(_db, item);
  }

  Future<void> updateRecord(
    String key, {
    required DiaryRecord updatedDiaryRecord,
  }) async {
    final updatedItem = updatedDiaryRecord.toJson();
    await _store.record(key).put(_db, updatedItem);
  }

  Future<void> deleteRecord(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<DiaryRecord?> watchRecordById(String key) =>
      _store.record(key).onSnapshot(_db).map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return null;
        return DiaryRecord.fromJson(json);
      });

  Stream<Map<String, DiaryRecord>> get allRecordsStream => _store
          .query(finder: Finder(sortOrders: [SortOrder(FilterKeys.dateWithTime, false)]))
          .onSnapshots(_db)
          .map((event) {
        final entries = event
            .map((e) {
              final value = e.value;
              if (value == null) return null;
              final model = DiaryRecord.fromJson(value);
              return MapEntry<String, DiaryRecord>(e.key, model);
            })
            .whereType<MapEntry<String, DiaryRecord>>()
            .toList();
        return Map.fromEntries(entries);
      });

  Future<void> doOldVersionMigration() async {
    // TODO: implement doOldVersionMigration
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
