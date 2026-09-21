import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the user's "záchranný balíček" (rescue package) — exercises saved from
/// the HPO programme to come back to later ("Ke zbylým cvičením se můžeš kdykoliv
/// vrátit nebo si je uložit do záchranného balíčku").
class BpdRescuePackageDao {
  BpdRescuePackageDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdRescuePackageDao> init() async {
    registry.registerSingleton<BpdRescuePackageDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_rescue_package';

  /// Reactive list of saved exercises, newest first.
  Stream<List<BpdRescueItem>> watchAll() {
    return _store.query().onSnapshots(_db).map((snapshots) {
      return snapshots
          .where((s) => s.value != null)
          .map((s) => BpdRescueItem.fromMap(s.value!))
          .toList()
        ..sort((a, b) => b.savedAt.compareTo(a.savedAt));
    });
  }

  Future<bool> contains(String id) async {
    return (await _store.record(id).get(_db)) != null;
  }

  Future<void> save(BpdRescueItem item) async {
    await _store.record(item.id).put(_db, item.toMap());
    debugPrint('BpdRescuePackageDao: Saved "${item.title}"');
  }

  Future<void> remove(String id) async {
    await _store.record(id).delete(_db);
    debugPrint('BpdRescuePackageDao: Removed "$id"');
  }

  /// Saves the item if it is not in the package yet, removes it otherwise.
  /// Returns whether the item is in the package after the call.
  Future<bool> toggle(BpdRescueItem item) async {
    if (await contains(item.id)) {
      await remove(item.id);
      return false;
    }
    await save(item);
    return true;
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
