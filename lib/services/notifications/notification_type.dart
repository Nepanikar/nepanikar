import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_weeks_screen.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
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
  challengeReminder,

  /// Mindfulness practice reminder started by Week 2, Day 4 of the HPO
  /// programme ("Čas na všímavost…"). Like [challengeReminder] it is scheduled
  /// by the programme rather than by the settings screen, so it is hidden there;
  /// a tap opens the rescue package with the saved exercises.
  mindfulnessReminder,

  /// Fires on the morning a new programme day (or week) opens, so someone who
  /// does not open the app still learns a lesson is waiting. Scheduled by the
  /// programme from each day's `unlockDate`, so it is hidden from the settings
  /// screen; a tap opens the skill tree.
  programmeUnlock;

  /// The programme's own wording, now in the ARB under `dbt_notification_*`:
  ///
  /// - mindfulness: verbatim from docs/hpo/source/tyzden-2.md §3.
  /// - unlock: **ours** — the source never asked for this notification, so
  ///   there is nothing of the author's to quote (docs/hpo/TODO.md → GEN-07).
  ///   Kept plain on purpose: it says a lesson is waiting, it does not push,
  ///   and it promises nothing about how long it takes beyond what is true.
  ///   The body must not repeat the title — together they are two lines on a
  ///   lock screen, and "Nový den je připravený / Čeká na tebe další den" spent
  ///   both of them saying one thing. The body adds what the title cannot: that
  ///   the timing is the reader's to choose, and it says so as a whole sentence
  ///   (the earlier "Až budeš mít chvíli." trailed off mid-thought). Czech
  ///   wording approved 2026-09-20; the week variant
  ///   (`dbt_notification_week_*`) is used when the day that opens is the first
  ///   of a week — a bigger moment than an ordinary day.
  ///   TODO: týdenní variantu schválit autorem
  String getBodyMessage(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.notification_mood_reminder_title;
      case NotificationType.sleepRateReminder:
        return l10n.notification_sleep_mood_reminder_title;
      case NotificationType.challengeReminder:
        return l10n.dbt_notification_challenge_body;
      case NotificationType.mindfulnessReminder:
        return l10n.dbt_notification_mindfulness_body;
      case NotificationType.programmeUnlock:
        return l10n.dbt_notification_day_body;
    }
  }

  /// Title to show instead of the generic reminder header, where the programme
  /// source prescribes specific wording.
  String? customTitle(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
      case NotificationType.sleepRateReminder:
        return null;
      case NotificationType.challengeReminder:
        return l10n.dbt_notification_challenge_title;
      case NotificationType.mindfulnessReminder:
        return l10n.dbt_notification_mindfulness_title;
      case NotificationType.programmeUnlock:
        return l10n.dbt_notification_day_title;
    }
  }

  /// Whether the HPO programme schedules this reminder itself (rather than the
  /// notification settings screen), in which case it is hidden from that list.
  bool get isProgrammeManaged =>
      this == NotificationType.challengeReminder ||
      this == NotificationType.mindfulnessReminder ||
      this == NotificationType.programmeUnlock;

  /// Types the user can configure in notification settings.
  static List<NotificationType> get settingsVisibleValues =>
      values.where((t) => !t.isProgrammeManaged).toList();

  Future<bool> isTodayAlreadyTracked() async {
    switch (this) {
      case NotificationType.moodReminder:
        return await registry.get<MoodTrackDao>().isTodayTracked();
      case NotificationType.sleepRateReminder:
        return await registry.get<MyRecordsSleepTrackDao>().isTodayTracked();
      case NotificationType.challengeReminder:
      case NotificationType.mindfulnessReminder:
      case NotificationType.programmeUnlock:
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
      case NotificationType.mindfulnessReminder:
        return const RescuePackageRoute().location;
      case NotificationType.programmeUnlock:
        // The tree, not a specific week: it is right whichever day opened.
        return const BpdWeeksScreenRoute().location;
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
      case NotificationType.mindfulnessReminder:
        return const TimeOfDay(hour: 17, minute: 0);
      case NotificationType.programmeUnlock:
        // A day unlocks at midnight; this is when we say so.
        return const TimeOfDay(hour: 9, minute: 0);
    }
  }

  String getSettingsTitle(AppLocalizations l10n) {
    switch (this) {
      case NotificationType.moodReminder:
        return l10n.mood;
      case NotificationType.sleepRateReminder:
        return l10n.sleep_title;
      case NotificationType.challengeReminder:
        return l10n.dbt_challenges;
      case NotificationType.mindfulnessReminder:
        return l10n.dbt_notification_mindfulness_settings;
      case NotificationType.programmeUnlock:
        return l10n.dbt_notification_unlock_settings;
    }
  }
}
