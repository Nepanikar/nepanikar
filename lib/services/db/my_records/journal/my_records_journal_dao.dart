import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:sembast/sembast.dart';

class MyRecordsJournalDao {
  MyRecordsJournalDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(_storeKeyName);

  Future<MyRecordsJournalDao> init() async {
    registry.registerSingleton<MyRecordsJournalDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_records_journal';

  Future<String> createRecord(JournalRecord journalRecord) async {
    final item = journalRecord.toJson();
    return _store.add(_db, item);
  }

  Future<void> _addRecords(List<JournalRecord> items) async {
    final serializedItems = items.map((item) => item.toJson()).toList();
    await _store.addAll(_db, serializedItems);
  }

  Future<void> updateRecord(
    String key, {
    required JournalRecord updatedJournalRecord,
  }) async {
    final updatedItem = updatedJournalRecord.toJson();
    await _store.record(key).put(_db, updatedItem);
  }

  Future<void> deleteRecord(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<JournalRecord?> watchRecordById(String key) => _store.record(key).onSnapshot(_db).map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return null;
        return JournalRecord.fromJson(json);
      });

  Stream<Map<String, JournalRecord>> get allRecordsStream => _store
          .query(finder: Finder(sortOrders: [SortOrder(FilterKeys.dateWithTime, false)]))
          .onSnapshots(_db)
          .map((event) {
        final entries = event
            .map((e) {
              final value = e.value;
              if (value == null) return null;
              final model = JournalRecord.fromJson(value);
              return MapEntry<String, JournalRecord>(e.key, model);
            })
            .whereType<MapEntry<String, JournalRecord>>()
            .toList();
        return Map.fromEntries(entries);
      });

  Future<void> doOldVersionMigration(MyRecordsJournalDTO journalConfig) async {
    final records = journalConfig.records;
    if (records != null) {
      final journalRecords = records
          .map(
            (r) => JournalRecord(
              dateTime: r.date,
              answers: r.answers.map((a) => JournalRecordAnswer(question: a.item1, answer: a.item2)).toList(),
            ),
          )
          .toList();
      await _addRecords(journalRecords);
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
