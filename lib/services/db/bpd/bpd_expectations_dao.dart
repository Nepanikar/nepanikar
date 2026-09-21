import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the user's free-text expectations and goals written on Week 1, Day 1.
/// These are re-surfaced in the final week of the programme (see GEN-02 / W1-06).
class BpdExpectationsDao {
  BpdExpectationsDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdExpectationsDao> init() async {
    registry.registerSingleton<BpdExpectationsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_expectations';
  static const _recordKey = 'week1_day1';

  Future<void> saveExpectationsAndGoals({
    required String expectations,
    required String goals,
  }) async {
    await _store.record(_recordKey).put(_db, {
      'expectations': expectations,
      'goals': goals,
      'updatedAt': DateTime.now().toIso8601String(),
    });
    debugPrint('BpdExpectationsDao: Saved expectations + goals');
  }

  Future<BpdExpectations?> getExpectationsAndGoals() async {
    final snapshot = await _store.record(_recordKey).get(_db);
    if (snapshot == null) return null;
    return BpdExpectations(
      expectations: (snapshot['expectations'] as String?) ?? '',
      goals: (snapshot['goals'] as String?) ?? '',
    );
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}

/// Simple value holder for the Day 1 expectations + goals entry.
@immutable
class BpdExpectations {
  const BpdExpectations({required this.expectations, required this.goals});

  final String expectations;
  final String goals;
}
