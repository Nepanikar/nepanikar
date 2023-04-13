import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';

part 'app_notification_data_model.freezed.dart';
part 'app_notification_data_model.g.dart';

/// We use this class to pass data to the scheduled notification.
///
/// Based on the [type] we can decide what to do when the notification is tapped
/// (e.g. open a specific screen).
@freezed
class AppNotificationData with _$AppNotificationData {
  const factory AppNotificationData({
    required NotificationType type,
  }) = _AppNotificationData;

  const AppNotificationData._();

  factory AppNotificationData.fromJson(Map<String, Object?> json) =>
      _$AppNotificationDataFromJson(json);
}

const nestedPayloadKey = 'nepanikar_custom_data';

extension ReceivedNotificationExt on ReceivedNotification {
  AppNotificationData? toAppNotificationData() {
    if (payload == null) return null;
    final customDataPayload = payload![nestedPayloadKey];
    if (customDataPayload == null) return null;
    return AppNotificationData.fromJson(jsonDecode(customDataPayload) as Map<String, Object?>);
  }
}
