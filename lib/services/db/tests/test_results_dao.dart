import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/tests/test_results_models.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class TestResultsDao {
  TestResultsDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = StoreRef(_storeKeyName);

  Future<TestResultsDao> init() async {
    registry.registerSingleton<TestResultsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'test_results';

  String _generateKey(String testId, DateTime completedAt) =>
      '${testId}_${completedAt.millisecondsSinceEpoch}';

  Future<void> saveTestResult(TestResult testResult) async {
    final key = _generateKey(testResult.testId, testResult.completedAt);
    debugPrint('TestResultsDao: Saving test result: $key');
    await _store.record(key).put(_db, testResult.toJson());
  }

  Future<List<TestResult>> getTestResults(String testId) async {
    final finder = Finder(
      filter: Filter.matches('testId', testId),
      sortOrders: [SortOrder('completedAt', false)], // newest first
    );

    final snapshots = await _store.find(_db, finder: finder);
    return snapshots
        .map((snapshot) => TestResult.fromJson(snapshot.value))
        .toList();
  }

  Future<TestResult?> getLatestTestResult(String testId) async {
    final results = await getTestResults(testId);
    return results.isEmpty ? null : results.first;
  }

  Future<List<TestResult>> getAllTestResults() async {
    final finder = Finder(sortOrders: [SortOrder('completedAt', false)]);

    final snapshots = await _store.find(_db, finder: finder);
    return snapshots
        .map((snapshot) => TestResult.fromJson(snapshot.value))
        .toList();
  }

  Stream<List<TestResult>> watchTestResults(String testId) {
    final finder = Finder(
      filter: Filter.matches('testId', testId),
      sortOrders: [SortOrder('completedAt', false)],
    );

    return _store
        .query(finder: finder)
        .onSnapshots(_db)
        .map(
          (snapshots) => snapshots
              .map((snapshot) => TestResult.fromJson(snapshot.value))
              .toList(),
        );
  }

  Future<void> deleteTestResult(String testId, DateTime completedAt) async {
    final key = _generateKey(testId, completedAt);
    debugPrint('TestResultsDao: Deleting test result: $key');
    await _store.record(key).delete(_db);
  }

  Future<void> deleteAllTestResults(String testId) async {
    final finder = Finder(filter: Filter.matches('testId', testId));
    debugPrint('TestResultsDao: Deleting all results for: $testId');
    await _store.delete(_db, finder: finder);
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
