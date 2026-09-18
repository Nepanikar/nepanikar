import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:nepanikar/utils/registry.dart';

/// Adherence events for the DBT pilot: how far people get, and where they stop.
///
/// This is the one question neither questionnaire can answer. The entry form is
/// filled in before the programme and the exit form after it, so someone who
/// gives up in week three simply never returns a second form — and a silent
/// drop-out looks exactly like a busy one. These events draw the curve.
///
/// **Nothing here identifies anyone.** Only a week number, a day number and a
/// count: no name, no free text, no answers, nothing about anyone's diagnosis.
/// That limit is not a style choice — Google's terms forbid sending personal or
/// health data to Analytics, and this programme's audience makes almost any
/// user-level detail health data. What the researcher gets is the shape of the
/// cohort, not its members.
///
/// Firebase aggregates and reports on a delay of up to 24 hours, so this is a
/// picture of the pilot, never a live view of one participant.
class BpdAnalytics {
  const BpdAnalytics._();

  static const _programmeStarted = 'bpd_programme_started';
  static const _dayCompleted = 'bpd_day_completed';
  static const _weekCompleted = 'bpd_week_completed';
  static const _programmeCompleted = 'bpd_programme_completed';

  /// Weeks in the programme; used to spot the final week's completion.
  static const totalWeeks = 7;

  /// Analytics is absent in tests and in any build that never ran `setup()`,
  /// and a missing registration must never take a DAO write down with it.
  static FirebaseAnalytics? get _analytics =>
      registry.isRegistered<FirebaseAnalytics>() ? registry.get<FirebaseAnalytics>() : null;

  static Future<void> _log(String name, [Map<String, Object>? parameters]) async {
    final analytics = _analytics;
    if (analytics == null) return;
    try {
      await analytics.logEvent(name: name, parameters: parameters);
    } catch (e) {
      // Telemetry is never worth an exception in front of the user.
      debugPrint('BPD_ANALYTICS: Could not log $name: $e');
    }
  }

  static Future<void> logProgrammeStarted() => _log(_programmeStarted);

  /// The drop-off curve itself: one event per day anyone finishes.
  static Future<void> logDayCompleted(int weekNumber, int dayNumber) =>
      _log(_dayCompleted, {'week': weekNumber, 'day': dayNumber});

  static Future<void> logWeekCompleted(int weekNumber) async {
    await _log(_weekCompleted, {'week': weekNumber});
    if (weekNumber == totalWeeks) await _log(_programmeCompleted);
  }
}
