import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_week_models.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class BpdWeeksDao {
  BpdWeeksDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = StoreRef(_storeKeyName);

  Future<BpdWeeksDao> init() async {
    registry.registerSingleton<BpdWeeksDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_weeks';
  static const int totalWeeks = 7;

  String _getWeekKey(int weekNumber) => 'week_$weekNumber';

  /// Initialize week progress based on programme start date
  /// Each week unlocks 7 days after the previous week
  Future<void> initializeWeeks(DateTime startedAt) async {
    for (int i = 1; i <= totalWeeks; i++) {
      final weekKey = _getWeekKey(i);
      final existingWeek = await _store.record(weekKey).get(_db);

      if (existingWeek == null) {
        // Week unlocks 7 days after previous week (week 1 unlocks immediately)
        final unlockDate = startedAt.add(Duration(days: (i - 1) * 7));
        final weekProgress = BpdWeekProgress(
          weekNumber: i,
          unlockDate: unlockDate,
          isCompleted: false,
        );
        await _store.record(weekKey).put(_db, weekProgress.toJson());
        debugPrint('BpdWeeksDao: Initialized week $i, unlocks at $unlockDate');
      }
    }
  }

  /// Get progress for a specific week
  Future<BpdWeekProgress?> getWeekProgress(int weekNumber) async {
    final json = await _store.record(_getWeekKey(weekNumber)).get(_db);
    if (json == null) return null;
    return BpdWeekProgress.fromJson(json);
  }

  /// Get all weeks progress
  Future<List<BpdWeekProgress>> getAllWeeksProgress() async {
    final List<BpdWeekProgress> weeks = [];
    for (int i = 1; i <= totalWeeks; i++) {
      final progress = await getWeekProgress(i);
      if (progress != null) {
        weeks.add(progress);
      }
    }
    return weeks;
  }

  /// Mark a week as completed
  Future<void> markWeekCompleted(int weekNumber) async {
    final weekKey = _getWeekKey(weekNumber);
    final json = await _store.record(weekKey).get(_db);

    if (json != null) {
      final weekProgress = BpdWeekProgress.fromJson(json);
      final updatedProgress = weekProgress.copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
      );
      await _store.record(weekKey).put(_db, updatedProgress.toJson());
      debugPrint('BpdWeeksDao: Marked week $weekNumber as completed');
    }
  }

  /// Reset a week's completion status
  Future<void> resetWeekCompletion(int weekNumber) async {
    final weekKey = _getWeekKey(weekNumber);
    final json = await _store.record(weekKey).get(_db);

    if (json != null) {
      final weekProgress = BpdWeekProgress.fromJson(json);
      final updatedProgress = weekProgress.copyWith(
        isCompleted: false,
        completedAt: null,
      );
      await _store.record(weekKey).put(_db, updatedProgress.toJson());
      debugPrint('BpdWeeksDao: Reset week $weekNumber completion');
    }
  }

  /// Clear all weeks data
  Future<void> clear() async {
    await _store.delete(_db);
    debugPrint('BpdWeeksDao: Cleared all weeks data');
  }
}
