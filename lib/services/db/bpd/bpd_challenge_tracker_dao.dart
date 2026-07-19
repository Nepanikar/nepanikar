import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_model.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

/// Tracks the DBT programme challenges the user is actively working on.
///
/// Unlike [BpdChallengesDao] (which only records which items were ticked during
/// a day's flow), this stores a durable, cross-week list of challenges the user
/// commits to — with daily check-offs and an optional per-challenge reminder.
class BpdChallengeTrackerDao {
  BpdChallengeTrackerDao({required DatabaseService dbService})
    : _dbService = dbService,
      _store = stringMapStoreFactory.store(_storeKeyName);

  Future<BpdChallengeTrackerDao> init() async {
    registry.registerSingleton<BpdChallengeTrackerDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'bpd_challenge_tracker';

  /// Stable record key for a challenge, so re-visiting a day never duplicates it.
  static String challengeId(int weekNumber, int dayNumber, String text) =>
      'w${weekNumber}_d${dayNumber}_${text.hashCode}';

  /// Stable positive int for the notification schedule id.
  static int _notificationIdFor(String id) => id.hashCode & 0x7fffffff;

  /// Reactive list of all tracked challenges, newest first.
  Stream<List<BpdChallenge>> watchAll() {
    return _store.query().onSnapshots(_db).map((snapshots) {
      final list = snapshots
          .where((s) => s.value != null)
          .map((s) => BpdChallenge.fromMap(s.value!))
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return list;
    });
  }

  Future<List<BpdChallenge>> getAll() async {
    final records = await _store.find(_db);
    return records
        .where((r) => r.value != null)
        .map((r) => BpdChallenge.fromMap(r.value!))
        .toList();
  }

  Future<BpdChallenge?> getById(String id) async {
    final value = await _store.record(id).get(_db);
    if (value == null) return null;
    return BpdChallenge.fromMap(value);
  }

  /// Reconciles the tracked challenges for one (week, day) with the user's
  /// current selection: adds newly picked items, keeps existing ones (preserving
  /// their check-offs + reminder), and returns the notification ids of items the
  /// user unpicked so the caller can cancel their reminders.
  Future<List<int>> syncDaySelection({
    required int weekNumber,
    required int dayNumber,
    required String area,
    required List<String> selectedTexts,
  }) async {
    final existing = await getAll();
    final forThisDay = existing.where(
      (c) => c.weekNumber == weekNumber && c.dayNumber == dayNumber,
    );

    final selectedIds = selectedTexts
        .map((t) => challengeId(weekNumber, dayNumber, t))
        .toSet();

    // Remove challenges the user unpicked; collect their reminder ids.
    final removedNotificationIds = <int>[];
    for (final c in forThisDay) {
      if (!selectedIds.contains(c.id)) {
        await _store.record(c.id).delete(_db);
        if (c.hasReminder) removedNotificationIds.add(c.notificationId);
      }
    }

    // Add newly picked challenges. Already-tracked ones keep their check-offs
    // and reminder; only a changed area label is refreshed.
    final existingById = {for (final c in existing) c.id: c};
    for (final text in selectedTexts) {
      final id = challengeId(weekNumber, dayNumber, text);
      final current = existingById[id];
      if (current != null) {
        if (current.area != area) {
          await _store.record(id).put(_db, current.toMap()..['area'] = area);
        }
        continue;
      }
      final challenge = BpdChallenge(
        id: id,
        text: text,
        weekNumber: weekNumber,
        dayNumber: dayNumber,
        area: area,
        createdAt: DateTime.now(),
        notificationId: _notificationIdFor(id),
      );
      await _store.record(id).put(_db, challenge.toMap());
    }

    return removedNotificationIds;
  }

  Future<void> setCompletedForDate({
    required String id,
    required DateTime date,
    required bool completed,
  }) async {
    final challenge = await getById(id);
    if (challenge == null) return;
    final key = BpdChallenge.dateKey(date);
    final dates = challenge.completedDates.toList();
    if (completed) {
      if (!dates.contains(key)) dates.add(key);
    } else {
      dates.remove(key);
    }
    await _store.record(id).put(_db, challenge.copyWith(completedDates: dates).toMap());
  }

  Future<void> toggleToday(String id) async {
    final challenge = await getById(id);
    if (challenge == null) return;
    await setCompletedForDate(
      id: id,
      date: DateTime.now(),
      completed: !challenge.isCompletedToday,
    );
  }

  Future<void> setReminder({required String id, TimeOfDay? time}) async {
    final challenge = await getById(id);
    if (challenge == null) return;
    final updated = time == null
        ? challenge.copyWith(clearReminder: true)
        : challenge.copyWith(reminderHour: time.hour, reminderMinute: time.minute);
    await _store.record(id).put(_db, updated.toMap());
  }

  Future<void> deleteChallenge(String id) async {
    await _store.record(id).delete(_db);
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
