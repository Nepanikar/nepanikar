import 'package:flutter/material.dart';
import 'package:nepanikar/services/analytics/bpd_analytics.dart';
import 'package:nepanikar/services/db/bpd/bpd_day_models.dart';
import 'package:nepanikar/services/db/bpd/bpd_unlock_schedule.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class BpdDaysDao {
  BpdDaysDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = StoreRef(_storeKeyName);

  Future<BpdDaysDao> init() async {
    registry.registerSingleton<BpdDaysDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_days_progress';
  static const _daysPerWeek = 7;

  String _generateKey(int weekNumber, int dayNumber) => 'week_${weekNumber}_day_$dayNumber';

  Future<void> saveDayProgress(BpdDayProgress dayProgress) async {
    final key = _generateKey(dayProgress.weekNumber, dayProgress.dayNumber);
    debugPrint('BpdDaysDao: Saving day progress: $key');
    await _store.record(key).put(_db, dayProgress.toJson());
  }

  Future<BpdDayProgress?> getDayProgress(int weekNumber, int dayNumber) async {
    final key = _generateKey(weekNumber, dayNumber);
    final snapshot = await _store.record(key).get(_db);
    return snapshot != null ? BpdDayProgress.fromJson(snapshot) : null;
  }

  Future<List<BpdDayProgress>> getWeekDaysProgress(int weekNumber) async {
    final finder = Finder(
      filter: Filter.equals('weekNumber', weekNumber),
      sortOrders: [SortOrder('dayNumber')],
    );

    final snapshots = await _store.find(_db, finder: finder);
    return snapshots.map((snapshot) => BpdDayProgress.fromJson(snapshot.value)).toList();
  }

  Future<void> markDayCompleted(int weekNumber, int dayNumber) async {
    final dayProgress = await getDayProgress(weekNumber, dayNumber);
    if (dayProgress != null) {
      // `lastPage` goes back to the start: the day is done, and someone
      // re-reading it wants the lesson from the top, not its closing page.
      final updated = dayProgress.copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
        lastPage: 0,
      );
      await saveDayProgress(updated);
      // Only the first completion counts. Days can be re-walked freely, and
      // counting a re-read as progress would bend the pilot's drop-off curve.
      if (!dayProgress.isCompleted) {
        await BpdAnalytics.logDayCompleted(weekNumber, dayNumber);
      }
    }
    await _markWeekCompletedIfAllDaysDone(weekNumber);
  }

  /// Rolls day progress up to the week level. Without this the skill tree can
  /// never advance: `BpdWeeksDao.markWeekCompleted` has no other caller, so the
  /// week stays open, the "N ze 7 týdnů hotovo" counter stays at zero and the
  /// next week never unlocks.
  Future<void> _markWeekCompletedIfAllDaysDone(int weekNumber) async {
    final days = await getWeekDaysProgress(weekNumber);
    if (days.length < _daysPerWeek) return;
    if (days.any((day) => !day.isCompleted)) return;
    await registry.get<BpdWeeksDao>().markWeekCompleted(weekNumber);
  }

  /// Remembers which page of the day's flow the user is on.
  ///
  /// Silently does nothing when the day has no record yet: days are written a
  /// week at a time when the week is opened, so that only happens if a screen
  /// is reached by a route typed by hand.
  Future<void> saveDayPage(int weekNumber, int dayNumber, int page) async {
    final dayProgress = await getDayProgress(weekNumber, dayNumber);
    if (dayProgress == null || dayProgress.lastPage == page) return;
    await saveDayProgress(dayProgress.copyWith(lastPage: page));
  }

  Future<int> getDayPage(int weekNumber, int dayNumber) async =>
      (await getDayProgress(weekNumber, dayNumber))?.lastPage ?? 0;

  Future<void> markDayStarted(int weekNumber, int dayNumber) async {
    final dayProgress = await getDayProgress(weekNumber, dayNumber);
    if (dayProgress != null && dayProgress.startedAt == null) {
      final updated = dayProgress.copyWith(startedAt: DateTime.now());
      await saveDayProgress(updated);
    }
  }

  /// Writes the seven day records of a week onto the cohort calendar.
  ///
  /// One lesson per calendar day, straight through from
  /// [bpdProgrammeStartDate]. Rewrites existing records' unlock dates —
  /// a phone that stored dates counted from its own first tap is corrected —
  /// but keeps whatever progress is already on them.
  ///
  /// Idempotent, and safe to call whenever a week is opened.
  Future<void> initializeDaysForWeek(int weekNumber) async {
    for (int dayNumber = 1; dayNumber <= _daysPerWeek; dayNumber++) {
      final unlockDate = bpdDayUnlockDate(weekNumber, dayNumber);
      final existing = await getDayProgress(weekNumber, dayNumber);

      await saveDayProgress(
        existing?.copyWith(unlockDate: unlockDate) ??
            BpdDayProgress(weekNumber: weekNumber, dayNumber: dayNumber, unlockDate: unlockDate),
      );
    }
  }

  /// The earliest lesson before (week, day) that is not finished yet, or null
  /// when everything before it is done.
  ///
  /// This is the sequence rule: lessons open by the calendar, but they are
  /// taken in order, so nobody runs ahead of the one they are on. Somebody who
  /// falls behind catches up on the lighter days — the calendar is a ceiling,
  /// not a timetable.
  ///
  /// A day with no record counts as unfinished. Days are written a week at a
  /// time, so a week the user never opened has no records at all, and treating
  /// that as "nothing to do here" would let them skip the week entirely.
  Future<(int week, int day)?> firstUnfinishedDayBefore(int weekNumber, int dayNumber) async {
    final target = bpdDayIndex(weekNumber, dayNumber);
    for (var week = 1; week <= weekNumber; week++) {
      for (var day = 1; day <= _daysPerWeek; day++) {
        if (bpdDayIndex(week, day) >= target) break;
        final progress = await getDayProgress(week, day);
        if (progress?.isCompleted != true) return (week, day);
      }
    }
    return null;
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }

  Stream<List<BpdDayProgress>> watchWeekDaysProgress(int weekNumber) {
    final finder = Finder(
      filter: Filter.equals('weekNumber', weekNumber),
      sortOrders: [SortOrder('dayNumber')],
    );

    return _store
        .query(finder: finder)
        .onSnapshots(_db)
        .map(
          (snapshots) =>
              snapshots.map((snapshot) => BpdDayProgress.fromJson(snapshot.value)).toList(),
        );
  }
}
