// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppNotificationData _$$_AppNotificationDataFromJson(
        Map<String, dynamic> json) =>
    _$_AppNotificationData(
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_AppNotificationDataToJson(
        _$_AppNotificationData instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeEnumMap[instance.type]!,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.moodReminder: 'moodReminder',
  NotificationType.sleepRateReminder: 'sleepRateReminder',
};
