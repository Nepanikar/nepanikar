import 'package:flutter/material.dart';
import 'package:nepanikar/services/analytics/bpd_analytics.dart';
import 'package:nepanikar/services/db/bpd/bpd_unlock_schedule.dart';
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

  /// Writes the cohort's week schedule.
  ///
  /// Unlock dates come from [bpdWeekUnlockDate] — the same fixed calendar for
  /// everyone, not counted from whenever this ran. Existing records are
  /// rewritten rather than skipped, so a phone carrying dates from a build that
  /// counted from the first tap is corrected on the next launch; completion is
  /// preserved, because the schedule changing must never un-finish a week
  /// somebody did.
  ///
  /// Idempotent, and safe to call on every start.
  Future<void> initializeWeeks() async {
    for (int i = 1; i <= totalWeeks; i++) {
      final weekKey = _getWeekKey(i);
      final existing = await _store.record(weekKey).get(_db);
      final unlockDate = bpdWeekUnlockDate(i);

      final weekProgress = existing == null
          ? BpdWeekProgress(weekNumber: i, unlockDate: unlockDate)
          : BpdWeekProgress.fromJson(existing).copyWith(unlockDate: unlockDate);

      await _store.record(weekKey).put(_db, weekProgress.toJson());
    }
    debugPrint('BpdWeeksDao: Week schedule set from $bpdProgrammeStartDate');
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
      final updatedProgress = weekProgress.copyWith(isCompleted: true, completedAt: DateTime.now());
      await _store.record(weekKey).put(_db, updatedProgress.toJson());
      debugPrint('BpdWeeksDao: Marked week $weekNumber as completed');
      // First completion only — this is called again on every day re-walk once
      // the week is full.
      if (!weekProgress.isCompleted) {
        await BpdAnalytics.logWeekCompleted(weekNumber);
      }
    }
  }

  /// Reset a week's completion status
  Future<void> resetWeekCompletion(int weekNumber) async {
    final weekKey = _getWeekKey(weekNumber);
    final json = await _store.record(weekKey).get(_db);

    if (json != null) {
      final weekProgress = BpdWeekProgress.fromJson(json);
      final updatedProgress = weekProgress.copyWith(isCompleted: false, completedAt: null);
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
