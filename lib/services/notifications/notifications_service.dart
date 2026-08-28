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

  /// Schedule notification ahead for 7 days.
  Future<void> rescheduleNotifications(AppLocalizations l10n) async {
    // Cancel all scheduled notifications.
    await cancelAllScheduledNotifications();
    // ...then bring back the reminders that are not driven by user settings.
    await _restoreChallengeReminders();

    final r = math.Random();
    final nowDate = DateTime.now().toDate();
    for (final type in NotificationType.values) {
      // Challenge reminders are scheduled per-challenge, not via user settings.
      if (type == NotificationType.challengeReminder) continue;
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

      const scheduleAheadDays = 8;
      final isTodayTypeAlreadyTracked = await type.isTodayAlreadyTracked();
      final sevenDaysAheadList = !isTodayTypeAlreadyTracked
          ? List.generate(scheduleAheadDays, (i) => nowDate.add(Duration(days: i)))
          : List.generate(scheduleAheadDays - 1, (i) => nowDate.add(Duration(days: i + 1)));

      // Schedule notifications for each day, including today if needed.
      for (final date in sevenDaysAheadList) {
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
