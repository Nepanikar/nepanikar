import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the free-text answers from a week's reflection day (Week 1, Day 7 –
/// SPOKO reflection). Persisted per week so they can be re-surfaced later.
class BpdReflectionDao {
  BpdReflectionDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdReflectionDao> init() async {
    registry.registerSingleton<BpdReflectionDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_reflection';

  String _recordKey(int weekNumber) => 'week_$weekNumber';

  Future<void> saveReflection({required int weekNumber, required List<String> answers}) async {
    await _store.record(_recordKey(weekNumber)).put(_db, {
      'answers': answers,
      'updatedAt': DateTime.now().toIso8601String(),
    });
    debugPrint('BpdReflectionDao: Saved reflection for week $weekNumber');
  }

  Future<List<String>> getReflection({required int weekNumber}) async {
    final snapshot = await _store.record(_recordKey(weekNumber)).get(_db);
    if (snapshot == null) return [];
    final answers = snapshot['answers'];
    if (answers is List) {
      return answers.whereType<String>().toList();
    }
    return [];
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
