import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the SPOKO daily "challenge" items the user picked to try.
///
/// Used by the Week 1 SPOKO days (Day 2 – Spánek, and the reused template for
/// Days 3–6). Selection is voluntary; we persist only the texts the user
/// checked, keyed per week + day, so they can be re-surfaced later.
class BpdChallengesDao {
  BpdChallengesDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdChallengesDao> init() async {
    registry.registerSingleton<BpdChallengesDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_challenges';

  String _recordKey(int weekNumber, int dayNumber) => 'week_${weekNumber}_day_$dayNumber';

  Future<void> saveSelectedChallenges({
    required int weekNumber,
    required int dayNumber,
    required List<String> items,
  }) async {
    await _store.record(_recordKey(weekNumber, dayNumber)).put(_db, {
      'items': items,
      'updatedAt': DateTime.now().toIso8601String(),
    });
    debugPrint(
      'BpdChallengesDao: Saved ${items.length} challenge(s) for '
      'week $weekNumber day $dayNumber',
    );
  }

  Future<List<String>> getSelectedChallenges({
    required int weekNumber,
    required int dayNumber,
  }) async {
    final snapshot = await _store.record(_recordKey(weekNumber, dayNumber)).get(_db);
    if (snapshot == null) return [];
    final items = snapshot['items'];
    if (items is List) {
      return items.whereType<String>().toList();
    }
    return [];
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
