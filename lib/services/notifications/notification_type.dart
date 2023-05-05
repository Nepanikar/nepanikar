import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/my_records/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/my_records_sleep_track_dao.dart';
import 'package:nepanikar/utils/registry.dart';

enum NotificationType {
  moodReminder,
  sleepRateReminder;

  String getBodyMessage(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.notification_mood_reminder_title;
      case NotificationType.sleepRateReminder:
        return l10n.notification_sleep_mood_reminder_title;
    }
  }

  Future<bool> isTodayAlreadyTracked() async {
    switch (this) {
      case NotificationType.moodReminder:
        return registry.get<MoodTrackDao>().isTodayTracked();
      case NotificationType.sleepRateReminder:
        return registry.get<MyRecordsSleepTrackDao>().isTodayTracked();
    }
  }

  String get routeDestination {
    switch (this) {
      case NotificationType.moodReminder:
        return const MoodTrackRoute().location;
      case NotificationType.sleepRateReminder:
        return const MyRecordsSleepTrackRoute().location;
    }
  }

  TimeOfDay get defaultScheduleTime {
    switch (this) {
      case NotificationType.moodReminder:
        return const TimeOfDay(hour: 19, minute: 0);
      case NotificationType.sleepRateReminder:
        return const TimeOfDay(hour: 9, minute: 0);
    }
  }

  String getSettingsTitle(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.mood;
      case NotificationType.sleepRateReminder:
        return l10n.sleep_title;
    }
  }
}
