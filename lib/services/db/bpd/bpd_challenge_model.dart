import 'package:flutter/material.dart';

/// A challenge the user committed to during the DBT programme, tracked with
/// daily check-offs across weeks and an optional per-challenge reminder.
///
/// Stored via [BpdChallengeTrackerDao]. Kept as a plain immutable class (no
/// codegen) to avoid the build_runner round-trip for a simple persisted model.
@immutable
class BpdChallenge {
  const BpdChallenge({
    required this.id,
    required this.text,
    required this.weekNumber,
    required this.dayNumber,
    required this.area,
    required this.createdAt,
    required this.notificationId,
    this.reminderHour,
    this.reminderMinute,
    this.completedDates = const [],
  });

  factory BpdChallenge.fromMap(Map<String, dynamic> map) {
    final rawDates = map['completedDates'];
    return BpdChallenge(
      id: map['id'] as String,
      text: map['text'] as String,
      weekNumber: (map['weekNumber'] as num).toInt(),
      dayNumber: (map['dayNumber'] as num).toInt(),
      area: _normalizeArea(map['area'] as String? ?? ''),
      createdAt:
          DateTime.tryParse(map['createdAt'] as String? ?? '') ?? DateTime(2024),
      notificationId: (map['notificationId'] as num).toInt(),
      reminderHour: (map['reminderHour'] as num?)?.toInt(),
      reminderMinute: (map['reminderMinute'] as num?)?.toInt(),
      completedDates:
          rawDates is List ? rawDates.whereType<String>().toList() : const [],
    );
  }

  /// Stable identity derived from (week, day, text) — see
  /// [BpdChallengeTrackerDao.challengeId].
  final String id;
  final String text;
  final int weekNumber;
  final int dayNumber;

  /// SPOKO area label the challenge came from (e.g. "Spánek").
  final String area;
  final DateTime createdAt;

  /// Stable positive int used as the AwesomeNotifications schedule id, so a
  /// reminder can be (re)scheduled or cancelled for this challenge alone.
  final int notificationId;

  final int? reminderHour;
  final int? reminderMinute;

  /// Days the challenge was marked done, as `yyyy-MM-dd` keys.
  final List<String> completedDates;

  bool get hasReminder => reminderHour != null && reminderMinute != null;

  TimeOfDay? get reminderTime => hasReminder
      ? TimeOfDay(hour: reminderHour!, minute: reminderMinute!)
      : null;

  bool isCompletedOn(String dateKey) => completedDates.contains(dateKey);

  bool get isCompletedToday => isCompletedOn(dateKey(DateTime.now()));

  /// Consecutive days completed ending today (or yesterday if today is not yet
  /// done, so an in-progress streak still shows).
  int get currentStreak {
    if (completedDates.isEmpty) return 0;
    final done = completedDates.toSet();
    var day = DateTime.now();
    if (!done.contains(dateKey(day))) {
      day = day.subtract(const Duration(days: 1));
    }
    var streak = 0;
    while (done.contains(dateKey(day))) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }
    return streak;
  }

  BpdChallenge copyWith({
    List<String>? completedDates,
    int? reminderHour,
    int? reminderMinute,
    bool clearReminder = false,
  }) {
    return BpdChallenge(
      id: id,
      text: text,
      weekNumber: weekNumber,
      dayNumber: dayNumber,
      area: area,
      createdAt: createdAt,
      notificationId: notificationId,
      reminderHour: clearReminder ? null : (reminderHour ?? this.reminderHour),
      reminderMinute:
          clearReminder ? null : (reminderMinute ?? this.reminderMinute),
      completedDates: completedDates ?? this.completedDates,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'text': text,
    'weekNumber': weekNumber,
    'dayNumber': dayNumber,
    'area': area,
    'createdAt': createdAt.toIso8601String(),
    'notificationId': notificationId,
    'reminderHour': reminderHour,
    'reminderMinute': reminderMinute,
    'completedDates': completedDates,
  };

  /// Early builds stored the day's `headerTitle` (e.g. "P – potrava") as the
  /// area; map those to the uniform short labels so old records display
  /// consistently without a data migration.
  static const _legacyAreaLabels = <String, String>{
    'P – potrava': 'Potrava',
    'O – ne omamným látkám': 'Omamné látky',
    'K – kondice': 'Kondice',
    'O – léčba onemocnění': 'Léčba onemocnění',
  };

  static String _normalizeArea(String area) => _legacyAreaLabels[area] ?? area;

  /// Formats a date as a `yyyy-MM-dd` day key (local time).
  static String dateKey(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}
