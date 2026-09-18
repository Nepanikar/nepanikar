import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/screens/settings/notification_settings_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_tracker_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_unlock_schedule.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/notifications/app_notification_data_model.dart';
import 'package:nepanikar/services/notifications/notification_controller.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';
import 'package:nepanikar/utils/registry.dart';

class NotificationsService {
  const NotificationsService({
    required AwesomeNotifications awesomeNotifications,
    required GoRouter router,
    required UserSettingsDao userSettingsDao,
  }) : _awesomeNotifications = awesomeNotifications,
       _router = router,
       _userSettingsDao = userSettingsDao;

  final GoRouter _router;
  final AwesomeNotifications _awesomeNotifications;
  final UserSettingsDao _userSettingsDao;

  static const _basicChannelGroupKey = 'basic_channel_group';
  static const _basicChannelKey = 'basic_channel';

  static final _challengeReminderTitle = NotificationType.challengeReminder.customTitle!;

  Future<void> init() async {
    await _awesomeNotifications.initialize(
      null, // To use the default app icon.
      [
        NotificationChannel(
          channelGroupKey: _basicChannelGroupKey,
          channelKey: _basicChannelKey,
          channelName: 'Basic notifications',
          channelDescription: null,
          channelShowBadge: true,
        ),
      ],
    );
    await _awesomeNotifications.resetGlobalBadge();
    await _awesomeNotifications.setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );
  }

  /// Whether the OS currently lets the app post notifications.
  Future<bool> get isNotificationAllowed => _awesomeNotifications.isNotificationAllowed();

  Future<void> checkPermission() async {
    final hasPermission = await _awesomeNotifications.isNotificationAllowed();
    if (!hasPermission) {
      final requestRes = await _awesomeNotifications.requestPermissionToSendNotifications();
      if (!requestRes) {
        // User denied permission, system notification settings screen will be opened.
        return;
      }
    }

    // Allowed, go to next screen.
    await _router.push(const NotificationSettingsRoute().location);
  }

  /// Requests notification permission if not already granted. Returns whether
  /// notifications are allowed afterwards. Used before enabling a per-challenge
  /// reminder from the "Moje výzvy" screen or the mindfulness reminder on Day 4.
  ///
  /// When permission was denied before, awesome_notifications hands the user
  /// over to the system notification settings and answers `false` right away —
  /// see [checkPermission]. Returning that `false` would leave the caller's
  /// switch off even though the user just granted permission, so wait for the
  /// app to come back into the foreground and re-check instead.
  Future<bool> requestPermissionIfNeeded() async {
    if (await _awesomeNotifications.isNotificationAllowed()) return true;
    if (await _awesomeNotifications.requestPermissionToSendNotifications()) return true;

    final onReturn = Completer<bool>();
    late final AppLifecycleListener listener;
    listener = AppLifecycleListener(
      onResume: () async {
        if (onReturn.isCompleted) return;
        onReturn.complete(await _awesomeNotifications.isNotificationAllowed());
      },
    );
    final allowed = await onReturn.future.timeout(
      const Duration(minutes: 5),
      onTimeout: () => false,
    );
    listener.dispose();
    return allowed;
  }

  /// Schedules a daily repeating reminder for a single DBT challenge. The
  /// [notificationId] is stable per challenge, so it can be cancelled or
  /// rescheduled on its own via [cancelChallengeReminder].
  Future<void> scheduleChallengeReminder({
    required int notificationId,
    required String challengeText,
    required int hour,
    required int minute,
  }) async {
    final payload = const AppNotificationData(type: NotificationType.challengeReminder).toJson();
    await _awesomeNotifications.cancel(notificationId);
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: _basicChannelKey,
        title: _challengeReminderTitle,
        body: challengeText,
        badge: 1,
        payload: {nestedPayloadKey: jsonEncode(payload)},
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        repeats: true,
        allowWhileIdle: true,
      ),
    );
    debugPrint(
      'NOTIFICATION_SERVICE: Scheduled challenge reminder id "$notificationId" '
      'at $hour:$minute',
    );
  }

  Future<void> cancelChallengeReminder(int notificationId) async {
    debugPrint('NOTIFICATION_SERVICE: Cancelling challenge reminder id "$notificationId"');
    await _awesomeNotifications.cancel(notificationId);
  }

  /// Whether the daily mindfulness reminder is currently on.
  Future<bool> isMindfulnessReminderEnabled() async {
    final settings = await _userSettingsDao.getNotificationTypeSettings(
      NotificationType.mindfulnessReminder,
    );
    return settings != null;
  }

  Future<TimeOfDay?> getMindfulnessReminderTime() async {
    final settings = await _userSettingsDao.getNotificationTypeSettings(
      NotificationType.mindfulnessReminder,
    );
    if (settings == null) return null;
    return TimeOfDay(hour: settings.scheduledHour, minute: settings.scheduledMinute);
  }

  /// Turns on the daily "Čas na všímavost…" reminder introduced by Week 2, Day 4
  /// of the HPO programme.
  ///
  /// It rides the same settings-driven schedule as the mood/sleep reminders (see
  /// [rescheduleNotifications]), so it survives locale and settings changes
  /// without the programme having to re-arm it.
  ///
  /// The source also prescribes dropping to 2× per week once the mindfulness
  /// module ends. That is not implemented yet — no later module has shipped, so
  /// nothing can trigger the downgrade (see docs/hpo/TODO.md → W2-05).
  Future<void> enableMindfulnessReminder(AppLocalizations l10n, {TimeOfDay? time}) async {
    await _userSettingsDao.updateNotificationTypeSettings(
      NotificationType.mindfulnessReminder,
      time ?? NotificationType.mindfulnessReminder.defaultScheduleTime,
    );
    await rescheduleNotifications(l10n);
  }

  Future<void> disableMindfulnessReminder(AppLocalizations l10n) async {
    await _userSettingsDao.removeNotificationTypeSettings(NotificationType.mindfulnessReminder);
    await rescheduleNotifications(l10n);
  }

  // Cancel all scheduled notifications.
  Future<void> cancelAllScheduledNotifications() async {
    debugPrint(
      'NOTIFICATION_SERVICE: Cancelling all scheduled notifications and resetting the badge count.',
    );
    await _awesomeNotifications.resetGlobalBadge();
    await _awesomeNotifications.cancelAllSchedules();
  }

  /// Re-arms the per-challenge reminders after a blanket cancel, since those are
  /// scheduled individually and would otherwise be silently lost.
  Future<void> _restoreChallengeReminders() async {
    if (!registry.isRegistered<BpdChallengeTrackerDao>()) return;
    final challenges = await registry.get<BpdChallengeTrackerDao>().getAll();
    for (final challenge in challenges.where((c) => c.hasReminder)) {
      await scheduleChallengeReminder(
        notificationId: challenge.notificationId,
        challengeText: challenge.text,
        hour: challenge.reminderHour!,
        minute: challenge.reminderMinute!,
      );
    }
  }

  /// Days of the week the mindfulness reminder keeps after the mindfulness
  /// module is over.
  ///
  /// The source asks for "2x týdně ve zbylých modulech" without naming days
  /// (docs/hpo/source/tyzden-2.md §3), so midweek + weekend is ours: it splits
  /// the week roughly in half instead of putting both on consecutive days.
  static const _mindfulnessTaperWeekdays = <int>[DateTime.wednesday, DateTime.sunday];

  /// The mindfulness module is Week 2; completing it is what drops the reminder
  /// from daily to twice a week.
  static const _mindfulnessModuleWeek = 2;

  Future<bool> _isMindfulnessModuleOver() async {
    if (!registry.isRegistered<BpdWeeksDao>()) return false;
    final week = await registry.get<BpdWeeksDao>().getWeekProgress(_mindfulnessModuleWeek);
    return week?.isCompleted ?? false;
  }

  /// Announces each programme day that opens within the scheduling horizon.
  ///
  /// Derived from the **week** unlock dates, not from day records: those are
  /// written lazily, the first time someone opens that week's detail screen
  /// (`_loadDaysProgress`). Reading them here scheduled nothing at all — the
  /// week whose opening most needs announcing is precisely the one the user has
  /// not opened yet. Week rows, by contrast, exist for all seven weeks from the
  /// moment the programme starts.
  ///
  /// Unlocks land at midnight, which is no time to be told about anything, so
  /// the notification fires at [_unlockNotificationHour] on the unlock day. Ids
  /// derive from week and day, so re-running this never stacks duplicates.
  Future<void> _scheduleProgrammeUnlockReminders(int scheduleAheadDays) async {
    if (!registry.isRegistered<BpdWeeksDao>()) return;
    if (!(await _userSettingsDao.getBpdProgrammeStatus()).hasStarted) return;

    final now = DateTime.now();
    final horizon = now.add(Duration(days: scheduleAheadDays));
    final weeks = await registry.get<BpdWeeksDao>().getAllWeeksProgress();
    final daysDao = registry.isRegistered<BpdDaysDao>() ? registry.get<BpdDaysDao>() : null;

    for (final week in weeks) {
      if (week.isCompleted) continue;
      // Day records may not exist yet; when they do, a finished day needs no
      // announcement.
      final done = <int>{};
      if (daysDao != null) {
        for (final day in await daysDao.getWeekDaysProgress(week.weekNumber)) {
          if (day.isCompleted) done.add(day.dayNumber);
        }
      }

      for (var dayNumber = 1; dayNumber <= _daysPerWeek; dayNumber++) {
        if (done.contains(dayNumber)) continue;
        final fireAt = unlockDayAfter(
          week.unlockDate,
          dayNumber - 1,
        ).copyWith(hour: _unlockNotificationHour);
        // Already past, or too far out to be worth holding a slot for.
        if (fireAt.isBefore(now) || fireAt.isAfter(horizon)) continue;

        final isWeekOpening = dayNumber == 1;
        await _awesomeNotifications.createNotification(
          content: NotificationContent(
            id: _unlockNotificationId(week.weekNumber, dayNumber),
            channelKey: _basicChannelKey,
            title: isWeekOpening
                ? NotificationType.programmeUnlockWeekTitle
                : NotificationType.programmeUnlockDayTitle,
            body: isWeekOpening
                ? NotificationType.programmeUnlockWeekBody
                : NotificationType.programmeUnlockDayBody,
            badge: 1,
            payload: {
              nestedPayloadKey: jsonEncode(
                const AppNotificationData(type: NotificationType.programmeUnlock).toJson(),
              ),
            },
          ),
          schedule: NotificationCalendar.fromDate(date: fireAt),
        );
        debugPrint(
          'NOTIFICATION_SERVICE: Scheduled unlock reminder for week '
          '${week.weekNumber} day $dayNumber at $fireAt',
        );
      }
    }
  }

  static const _daysPerWeek = 7;

  /// Stable per day, and far from the random ids the settings-driven loop uses.
  static int _unlockNotificationId(int week, int day) => 9000000 + week * 100 + day;

  static const _unlockNotificationHour = 9;

  /// Schedule notification ahead for 7 days.
  Future<void> rescheduleNotifications(AppLocalizations l10n) async {
    // Cancel all scheduled notifications.
    await cancelAllScheduledNotifications();

    // Every `createNotification` below throws PlatformException
    // (INSUFFICIENT_PERMISSIONS) when the OS permission is missing, and that
    // exception escapes into whatever asked for the reschedule. It cost the
    // "Začít svou cestu" button its navigation: the programme was marked
    // started, the weeks were initialised, and then this threw before
    // `context.go`, so anyone who declined notifications tapped Start and
    // watched nothing happen. Cancelling above is still right — permission can
    // be revoked while notifications sit in the queue.
    if (!await isNotificationAllowed) {
      debugPrint('NOTIFICATION_SERVICE: Notifications not permitted, nothing to schedule.');
      return;
    }

    // ...then bring back the reminders that are not driven by user settings.
    await _restoreChallengeReminders();

    const scheduleAheadDays = 8;
    await _scheduleProgrammeUnlockReminders(scheduleAheadDays);
    final mindfulnessTapered = await _isMindfulnessModuleOver();

    final r = math.Random();
    final nowDate = DateTime.now().toDate();
    for (final type in NotificationType.values) {
      // Programme-managed types schedule themselves above, not from settings.
      if (type == NotificationType.challengeReminder || type == NotificationType.programmeUnlock) {
        continue;
      }
      final notificationTypeSettings = await _userSettingsDao.getNotificationTypeSettings(type);
      if (notificationTypeSettings == null) {
        // No settings for this type, skip scheduling.
        debugPrint(
          'NOTIFICATION_SERVICE: Skipping scheduling notifications for type: $type (type not enabled)',
        );
        continue;
      }

      final notificationTitleMessage = type.customTitle ?? l10n.notification_reminder_header;
      final notificationBodyMessage = type.getBodyMessage(l10n);
      final customDataPayload = AppNotificationData(type: type).toJson();

      final isTodayTypeAlreadyTracked = await type.isTodayAlreadyTracked();
      final sevenDaysAheadList = !isTodayTypeAlreadyTracked
          ? List.generate(scheduleAheadDays, (i) => nowDate.add(Duration(days: i)))
          : List.generate(scheduleAheadDays - 1, (i) => nowDate.add(Duration(days: i + 1)));

      // Schedule notifications for each day, including today if needed.
      for (final date in sevenDaysAheadList) {
        // W2-05: the mindfulness reminder is daily only while the mindfulness
        // module runs. Once Week 2 is done the source drops it to twice a week,
        // so most days simply get no notification scheduled.
        if (type == NotificationType.mindfulnessReminder &&
            mindfulnessTapered &&
            !_mindfulnessTaperWeekdays.contains(date.weekday)) {
          continue;
        }
        // TODO: There is a chance that it will generate already existing id. But since
        // we schedule it only for 7 days ahead, it should be fine.
        final randomId = r.nextInt(10000000);

        final notificationContent = NotificationContent(
          id: randomId,
          channelKey: _basicChannelKey,
          title: notificationTitleMessage,
          body: notificationBodyMessage,
          badge: 1,
          payload: {nestedPayloadKey: jsonEncode(customDataPayload)},
        );
        final scheduledDate = date.copyWith(
          hour: notificationTypeSettings.scheduledHour,
          minute: notificationTypeSettings.scheduledMinute,
        );
        debugPrint(
          'NOTIFICATION_SERVICE: Scheduling notification "$type" with id "$randomId" to date: $scheduledDate',
        );
        await _awesomeNotifications.createNotification(
          content: notificationContent,
          schedule: NotificationCalendar.fromDate(date: scheduledDate),
        );
      }
    }
  }
}
