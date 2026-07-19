import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/my_records_sleep_track_dao.dart';
import 'package:nepanikar/utils/registry.dart';

enum NotificationType {
  moodReminder,
  sleepRateReminder,

  /// Per-challenge DBT reminders. Not scheduled via the settings-driven
  /// [rescheduleNotifications] loop (each challenge schedules its own reminder);
  /// this value only tags the payload so a tap routes to "Moje výzvy". It is
  /// hidden from the notification settings screen.
  challengeReminder;

  String getBodyMessage(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.notification_mood_reminder_title;
      case NotificationType.sleepRateReminder:
        return l10n.notification_sleep_mood_reminder_title;
      case NotificationType.challengeReminder:
        return 'Nezapomeň na svou výzvu';
    }
  }

  Future<bool> isTodayAlreadyTracked() async {
    switch (this) {
      case NotificationType.moodReminder:
        return await registry.get<MoodTrackDao>().isTodayTracked();
      case NotificationType.sleepRateReminder:
        return await registry.get<MyRecordsSleepTrackDao>().isTodayTracked();
      case NotificationType.challengeReminder:
        return false;
    }
  }

  String get routeDestination {
    switch (this) {
      case NotificationType.moodReminder:
        return const MoodTrackRoute().location;
      case NotificationType.sleepRateReminder:
        return const MyRecordsSleepTrackRoute().location;
      case NotificationType.challengeReminder:
        return const MyChallengesRoute().location;
    }
  }

  TimeOfDay get defaultScheduleTime {
    switch (this) {
      case NotificationType.moodReminder:
        return const TimeOfDay(hour: 19, minute: 0);
      case NotificationType.sleepRateReminder:
        return const TimeOfDay(hour: 9, minute: 0);
      case NotificationType.challengeReminder:
        return const TimeOfDay(hour: 20, minute: 0);
    }
  }

  String getSettingsTitle(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.mood;
      case NotificationType.sleepRateReminder:
        return l10n.sleep_title;
      case NotificationType.challengeReminder:
        return 'Moje výzvy';
    }
  }
}
