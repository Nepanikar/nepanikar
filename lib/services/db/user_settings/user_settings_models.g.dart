// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) =>
    _UserLanguage(
      languageCode: json['languageCode'] as String,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$UserLanguageToJson(_UserLanguage instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
    };

_NotificationTypeSettings _$NotificationTypeSettingsFromJson(
  Map<String, dynamic> json,
) => _NotificationTypeSettings(
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  scheduledHour: (json['scheduledHour'] as num).toInt(),
  scheduledMinute: (json['scheduledMinute'] as num).toInt(),
);

Map<String, dynamic> _$NotificationTypeSettingsToJson(
  _NotificationTypeSettings instance,
) => <String, dynamic>{
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'scheduledHour': instance.scheduledHour,
  'scheduledMinute': instance.scheduledMinute,
};

const _$NotificationTypeEnumMap = {
  NotificationType.moodReminder: 'moodReminder',
  NotificationType.sleepRateReminder: 'sleepRateReminder',
};

_UserThemeMode _$UserThemeModeFromJson(Map<String, dynamic> json) =>
    _UserThemeMode(themeMode: json['themeMode'] as String? ?? 'system');

Map<String, dynamic> _$UserThemeModeToJson(_UserThemeMode instance) =>
    <String, dynamic>{'themeMode': instance.themeMode};
