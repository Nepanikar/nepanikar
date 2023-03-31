import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/services/notifications/app_notification_data_model.dart';
import 'package:nepanikar/utils/registry.dart';

abstract class NotificationController {
  const NotificationController._();

  /// Use this method to detect every time that a new notification is displayed.
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    final notificationData = receivedNotification.toAppNotificationData();
    debugPrint('NOTIFICATION_CONTROLLER: Notification received: ${notificationData?.type.name}');
    // Commented out cuz this does not work on iOS
    // (https://github.com/rafaelsetragni/awesome_notifications/issues/743).
    // await FirebaseAnalytics.instance.logEvent(
    //   name: 'notification_received',
    //   parameters: {
    //     'notification_type': notificationData?.type.name,
    //   },
    // );
  }

  /// Use this method to detect if the user dismissed a notification.
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    final notificationData = receivedAction.toAppNotificationData();
    debugPrint('NOTIFICATION_CONTROLLER: Notification dismissed: ${notificationData?.type.name}');
    await FirebaseAnalytics.instance.logEvent(
      name: 'notification_dismissed',
      parameters: {
        'notification_type': notificationData?.type.name,
      },
    );
  }

  /// Use this method to detect when the user taps on a notification or action button.
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    final notificationData = receivedAction.toAppNotificationData();
    debugPrint('NOTIFICATION_CONTROLLER: Notification tapped: ${notificationData?.type.name}');
    await FirebaseAnalytics.instance.logEvent(
      name: 'notification_tapped',
      parameters: {
        'notification_type': notificationData?.type.name,
      },
    );

    final routeDestination = notificationData?.type.routeDestination;
    if (routeDestination != null) {
      debugPrint('NOTIFICATION_CONTROLLER: Navigating to $routeDestination from notification');
      final goRouter = registry.get<GoRouter>();
      // Check if the current route is the same as the destination route.
      if (goRouter.location != routeDestination) {
        goRouter.go(routeDestination);
      }
    }
  }
}
