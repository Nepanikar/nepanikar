import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class MyContactsRecordsDao {
  MyContactsRecordsDao({required this._dbService})
    : _store = stringMapStoreFactory.store(_storeKeyName);

  Future<MyContactsRecordsDao> init() async {
    registry.registerSingleton<MyContactsRecordsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_contacts_records';

  Future<void> addNewRecord() async {
    const emptyRecord = MyContactRecord(name: '', contactAddress: '');
    await _store.add(_db, emptyRecord.toJson());
  }

  Future<void> updateName(String id, MyContactRecord currRecord, String newName) async {
    final updatedRecord = currRecord.copyWith(name: newName);
    await _store.record(id).update(_db, updatedRecord.toJson());
  }

  Future<void> updateContactAddress(
    String id,
    MyContactRecord currRecord,
    String newContactAddress,
  ) async {
    final updatedRecord = currRecord.copyWith(contactAddress: newContactAddress);
    await _store.record(id).update(_db, updatedRecord.toJson());
  }

  Future<void> deleteRecord(String id) async {
    await _store.record(id).delete(_db);
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

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
