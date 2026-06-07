import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goal_model.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class BpdSmartGoalsDao {
  BpdSmartGoalsDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdSmartGoalsDao> init() async {
    registry.registerSingleton<BpdSmartGoalsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_smart_goals';

  Future<String> createGoal({
    required String specific,
    required String measurable,
    required String achievable,
    required String relevant,
    required String timeBound,
  }) async {
    final goal = BpdSmartGoal(
      id: '', // Will be set after insertion
      specific: specific,
      measurable: measurable,
      achievable: achievable,
      relevant: relevant,
      timeBound: timeBound,
      createdAt: DateTime.now(),
    );

    final id = await _store.add(_db, goal.toJson());
    // Update the record with the actual ID
    final updatedGoal = goal.copyWith(id: id);
    await _store.record(id).put(_db, updatedGoal.toJson());
    debugPrint('BpdSmartGoalsDao: Created SMART goal: $id');
    return id;
  }

  Future<void> updateGoal(String key, BpdSmartGoal goal) async {
    final updated = goal.copyWith(updatedAt: DateTime.now());
    await _store.record(key).put(_db, updated.toJson());
    debugPrint('BpdSmartGoalsDao: Updated SMART goal: $key');
  }

  Future<BpdSmartGoal?> getGoal(String key) async {
    final snapshot = await _store.record(key).get(_db);
    return snapshot != null ? BpdSmartGoal.fromJson(snapshot) : null;
  }

  Future<Map<String, BpdSmartGoal>> getAllGoals({
    bool includeArchived = false,
  }) async {
    final finder = includeArchived
        ? Finder(sortOrders: [SortOrder('createdAt', false)])
        : Finder(
            filter: Filter.equals('isArchived', false),
            sortOrders: [SortOrder('createdAt', false)],
          );

    final snapshots = await _store.find(_db, finder: finder);
    final entries = snapshots
        .map((e) {
          final value = e.value;
          if (value == null) return null;
          return MapEntry(e.key, BpdSmartGoal.fromJson(value));
        })
        .whereType<MapEntry<String, BpdSmartGoal>>()
        .toList();
    return Map.fromEntries(entries);
  }

  Future<void> archiveGoal(String key) async {
    final goal = await getGoal(key);
    if (goal != null) {
      final archived = goal.copyWith(
        isArchived: true,
        updatedAt: DateTime.now(),
      );
      await _store.record(key).put(_db, archived.toJson());
      debugPrint('BpdSmartGoalsDao: Archived SMART goal: $key');
    }
  }

  Future<void> deleteGoal(String key) async {
    await _store.record(key).delete(_db);
    debugPrint('BpdSmartGoalsDao: Deleted SMART goal: $key');
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }

  Stream<Map<String, BpdSmartGoal>> watchAllGoals({
    bool includeArchived = false,
  }) {
    final finder = includeArchived
        ? Finder(sortOrders: [SortOrder('createdAt', false)])
        : Finder(
            filter: Filter.equals('isArchived', false),
            sortOrders: [SortOrder('createdAt', false)],
          );

    return _store.query(finder: finder).onSnapshots(_db).map((snapshots) {
      final entries = snapshots
          .map((e) {
            final value = e.value;
            if (value == null) return null;
            return MapEntry(e.key, BpdSmartGoal.fromJson(value));
          })
          .whereType<MapEntry<String, BpdSmartGoal>>()
          .toList();
      return Map.fromEntries(entries);
    });
  }
}
