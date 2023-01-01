import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:sembast/sembast.dart';

class MyContactsRecordsDao {
  MyContactsRecordsDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(_storeKeyName);

  Future<MyContactsRecordsDao> init() async {
    registry.registerSingleton<MyContactsRecordsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_contacts_records';

  Future<void> _addRecords(List<MyContactRecord> items) async {
    final serializedItems = items.map((item) => item.toJson()).toList();
    await _store.addAll(_db, serializedItems);
  }

  Stream<Map<String, MyContactRecord>> get allRecordsStream =>
      _store.query().onSnapshots(_db).map((event) {
        final entries = event
            .map((e) {
              final value = e.value;
              if (value == null) return null;
              final model = MyContactRecord.fromJson(value);
              return MapEntry<String, MyContactRecord>(e.key, model);
            })
            .whereType<MapEntry<String, MyContactRecord>>()
            .toList();
        return Map.fromEntries(entries);
      });

  Future<void> doOldVersionMigration(MyContactsRecordsDTO myContactsRecordsConfig) async {
    final recordEntries = myContactsRecordsConfig.recordEntries;
    if (recordEntries != null) {
      final records = recordEntries
          .map((entry) => MyContactRecord(name: entry.key, contactAddress: entry.value))
          .toList();
      await _addRecords(records);
    }
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
