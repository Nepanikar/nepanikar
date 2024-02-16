// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLanguage _$$_UserLanguageFromJson(Map<String, dynamic> json) =>
    _$_UserLanguage(
      languageCode: json['languageCode'] as String,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$$_UserLanguageToJson(_$_UserLanguage instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
    };

_$_NotificationTypeSettings _$$_NotificationTypeSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationTypeSettings(
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      scheduledHour: json['scheduledHour'] as int,
      scheduledMinute: json['scheduledMinute'] as int,
    );

Map<String, dynamic> _$$_NotificationTypeSettingsToJson(
        _$_NotificationTypeSettings instance) =>
    <String, dynamic>{
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'scheduledHour': instance.scheduledHour,
      'scheduledMinute': instance.scheduledMinute,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.moodReminder: 'moodReminder',
  NotificationType.sleepRateReminder: 'sleepRateReminder',
};

_$_UserThemeMode _$$_UserThemeModeFromJson(Map<String, dynamic> json) =>
    _$_UserThemeMode(
      themeMode: json['themeMode'] as String? ?? 'system',
    );

Map<String, dynamic> _$$_UserThemeModeToJson(_$_UserThemeMode instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
    };
