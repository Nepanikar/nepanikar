import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the daily items the user picked to try — SPOKO "challenges" in Week 1
/// and mindfulness exercises in Week 2.
///
/// Used by the Week 1 SPOKO days (Day 2 – Spánek, and the reused template for
/// Days 3–6) and by the Week 2 skill days, which pass a [section] because one
/// day holds several independent pick-lists (e.g. pozorování / popisování /
/// participace). Selection is voluntary; we persist only the texts the user
/// checked, keyed per week + day (+ section), so they can be re-surfaced later.
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

  /// Days with a single pick-list omit [section] and keep the original key, so
  /// data saved by earlier app versions stays readable.
  String _recordKey(int weekNumber, int dayNumber, String? section) {
    final base = 'week_${weekNumber}_day_$dayNumber';
    return section == null ? base : '${base}_$section';
  }

  Future<void> saveSelectedChallenges({
    required int weekNumber,
    required int dayNumber,
    required List<String> items,
    String? section,
  }) async {
    await _store.record(_recordKey(weekNumber, dayNumber, section)).put(_db, {
      'items': items,
      'updatedAt': DateTime.now().toIso8601String(),
    });
    debugPrint(
      'BpdChallengesDao: Saved ${items.length} challenge(s) for '
      'week $weekNumber day $dayNumber${section == null ? '' : ' section $section'}',
    );
  }

  Future<List<String>> getSelectedChallenges({
    required int weekNumber,
    required int dayNumber,
    String? section,
  }) async {
    final snapshot = await _store.record(_recordKey(weekNumber, dayNumber, section)).get(_db);
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
