import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Stores the free-text answers of the programme's structured worksheets.
///
/// [BpdReflectionDao] holds one ordered list per week, which fits a reflection
/// day but not the worksheets from Week 3 on: those have named fields, are
/// filled over several sittings and sometimes several per day (Day 2 has both a
/// worksheet and five sentence stems). Answers are therefore keyed by a
/// worksheet id plus a field id, so a partially filled worksheet always comes
/// back exactly as the user left it.
///
/// Worksheet ids in use: `week3_day1_myths`, `week3_day2_model`,
/// `week3_day2_validation`, `week3_day3_facts`.
class BpdWorksheetDao {
  BpdWorksheetDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdWorksheetDao> init() async {
    registry.registerSingleton<BpdWorksheetDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_worksheets';

  /// Writes the whole worksheet at once. Blank answers are dropped so an
  /// untouched worksheet does not look started.
  Future<void> saveWorksheet({
    required String worksheetId,
    required Map<String, String> answers,
  }) async {
    final filled = <String, String>{};
    answers.forEach((field, text) {
      final trimmed = text.trim();
      if (trimmed.isNotEmpty) filled[field] = trimmed;
    });

    await _store.record(worksheetId).put(_db, {
      'answers': filled,
      'updatedAt': DateTime.now().toIso8601String(),
    });
    debugPrint('BpdWorksheetDao: Saved $worksheetId (${filled.length} filled)');
  }

  Future<Map<String, String>> getWorksheet(String worksheetId) async {
    final snapshot = await _store.record(worksheetId).get(_db);
    final answers = snapshot?['answers'];
    if (answers is! Map) return {};
    return answers.map((key, value) => MapEntry(key.toString(), value.toString()));
  }

  /// How many fields the user has filled in — used to show progress on a
  /// worksheet they can come back to.
  Future<int> filledCount(String worksheetId) async {
    final answers = await getWorksheet(worksheetId);
    return answers.length;
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
