import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_day_models.dart';
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

  String _generateKey(int weekNumber, int dayNumber) =>
      'week_${weekNumber}_day_$dayNumber';

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
    return snapshots
        .map((snapshot) => BpdDayProgress.fromJson(snapshot.value))
        .toList();
  }

  Future<void> markDayCompleted(int weekNumber, int dayNumber) async {
    final dayProgress = await getDayProgress(weekNumber, dayNumber);
    if (dayProgress != null) {
      final updated = dayProgress.copyWith(
        isCompleted: true,
        completedAt: DateTime.now(),
      );
      await saveDayProgress(updated);
    }
  }

  Future<void> markDayStarted(int weekNumber, int dayNumber) async {
    final dayProgress = await getDayProgress(weekNumber, dayNumber);
    if (dayProgress != null && dayProgress.startedAt == null) {
      final updated = dayProgress.copyWith(startedAt: DateTime.now());
      await saveDayProgress(updated);
    }
  }

  /// Initialize days for a week when it's unlocked
  Future<void> initializeDaysForWeek(
    int weekNumber,
    DateTime weekUnlockDate,
  ) async {
    // Create 7 days for the week, each unlocking one day after the previous
    for (int dayNumber = 1; dayNumber <= 7; dayNumber++) {
      final dayUnlockDate = weekUnlockDate.add(Duration(days: dayNumber - 1));

      final dayProgress = BpdDayProgress(
        weekNumber: weekNumber,
        dayNumber: dayNumber,
        unlockDate: dayUnlockDate,
      );

      await saveDayProgress(dayProgress);
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }

  /// Unlock all days in a week (for development/testing purposes)
  Future<void> unlockAllDaysInWeek(int weekNumber) async {
    final days = await getWeekDaysProgress(weekNumber);
    final now = DateTime.now();

    for (final day in days) {
      // Set unlock date to now so all days are immediately accessible
      final updated = day.copyWith(unlockDate: now);
      await saveDayProgress(updated);
    }
    debugPrint('BpdDaysDao: Unlocked all days in week $weekNumber');
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
          (snapshots) => snapshots
              .map((snapshot) => BpdDayProgress.fromJson(snapshot.value))
              .toList(),
        );
  }
}
