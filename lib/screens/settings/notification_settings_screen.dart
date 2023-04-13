import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_models.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class NotificationSettingsRoute extends GoRouteData {
  const NotificationSettingsRoute();

  @override
  Widget build(BuildContext context, _) => const NotificationSettingsScreen();
}

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  NotificationsService get _notificationsService => registry.get<NotificationsService>();

  FirebaseAnalytics get _analytics => registry.get<FirebaseAnalytics>();

  Future<void> _onSwitchChanged(
    AppLocalizations l10n,
    NotificationType notificationType,
    bool value,
    TimeOfDay reminderTime,
  ) async {
    if (value) {
      await _analytics.logEvent(
        name: 'notification_settings_type_enabled',
        parameters: {'notification_type': notificationType.name},
      );
      await _userSettingsDao.updateNotificationTypeSettings(
        notificationType,
        reminderTime,
      );
    } else {
      await _analytics.logEvent(
        name: 'notification_settings_type_disabled',
        parameters: {'notification_type': notificationType.name},
      );
      await _userSettingsDao.removeNotificationTypeSettings(notificationType);
    }
    await _notificationsService.rescheduleNotifications(l10n);
  }

  Future<void> _onTimeChanged(
    BuildContext context,
    NotificationType notificationType,
    TimeOfDay reminderTime,
  ) async {
    final l10n = context.l10n;
    final newReminderTime = await showTimePicker(
      context: context,
      initialTime: reminderTime,
    );

    if (newReminderTime != null) {
      await _analytics.logEvent(
        name: 'notification_settings_time_changed',
        parameters: {
          'notification_type': notificationType.name,
          'new_reminder_time': '${newReminderTime.hour}h:${newReminderTime.minute}m',
        },
      );
      await _userSettingsDao.updateNotificationTypeSettings(
        notificationType,
        newReminderTime,
      );
      await _notificationsService.rescheduleNotifications(l10n);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationTypeSettings>>(
      stream: _userSettingsDao.notificationTypeSettingsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final notificationTypeSettings = snapshot.data ?? [];
        return NepanikarScreenWrapper(
          appBarTitle: context.l10n.notifications,
          isCardStackLayout: true,
          expandToMaxScreenHeight: true,
          children: NotificationType.values
              .mapIndexed(
                (i, notificationType) => _buildNotificationSection(
                  context,
                  i,
                  notificationType,
                  notificationTypeSettings.firstWhereOrNull(
                    (typeSettings) => typeSettings.type == notificationType,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildNotificationSection(
    BuildContext context,
    int i,
    NotificationType notificationType,
    NotificationTypeSettings? notificationTypeSettings,
  ) {
    final l10n = context.l10n;
    final isLast = i == NotificationType.values.length - 1;
    final reminderTime = notificationTypeSettings != null
        ? TimeOfDay(
            hour: notificationTypeSettings.scheduledHour,
            minute: notificationTypeSettings.scheduledMinute,
          )
        : notificationType.defaultScheduleTime;

    return Column(
      children: [
        ListTile(
          title: Text(
            notificationType.getSettingsTitle(l10n),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Switch(
            value: notificationTypeSettings != null,
            onChanged: (v) => _onSwitchChanged(l10n, notificationType, v, reminderTime),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          child: notificationTypeSettings != null
              ? ListTile(
                  title: Text(
                    l10n.notification_reminder_time,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      reminderTime.format(context),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  onTap: () async => _onTimeChanged(context, notificationType, reminderTime),
                )
              : const SizedBox.shrink(),
        ),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: NepanikarHorizontalDivider(),
          ),
      ],
    );
  }
}
