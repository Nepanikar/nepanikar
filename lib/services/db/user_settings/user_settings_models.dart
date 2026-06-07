// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';

part 'user_settings_models.freezed.dart';
part 'user_settings_models.g.dart';

@freezed
abstract class UserLanguage with _$UserLanguage {
  const factory UserLanguage({
    required String languageCode,
    required String? countryCode,
  }) = _UserLanguage;

  const UserLanguage._();

  factory UserLanguage.fromJson(Map<String, Object?> json) =>
      _$UserLanguageFromJson(json);

  static UserLanguage fromLocale(Locale locale) => UserLanguage(
    languageCode: locale.languageCode,
    countryCode: locale.countryCode,
  );

  Locale toLocale() => Locale(languageCode, countryCode);
}

@freezed
abstract class NotificationTypeSettings with _$NotificationTypeSettings {
  const factory NotificationTypeSettings({
    required NotificationType type,
    required int scheduledHour,
    required int scheduledMinute,
  }) = _NotificationTypeSettings;

  const NotificationTypeSettings._();

  factory NotificationTypeSettings.fromJson(Map<String, Object?> json) =>
      _$NotificationTypeSettingsFromJson(json);
}

@freezed
abstract class UserThemeMode with _$UserThemeMode {
  const factory UserThemeMode({@Default('system') String themeMode}) =
      _UserThemeMode;

  const UserThemeMode._();

  factory UserThemeMode.fromJson(Map<String, Object?> json) =>
      _$UserThemeModeFromJson(json);

  ThemeMode getThemeMode() {
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  static String themeModeToString(ThemeMode themeMode) {
    return themeMode.toString().split('.').last;
  }
}

@freezed
abstract class BpdProgrammeStatus with _$BpdProgrammeStatus {
  const factory BpdProgrammeStatus({
    required bool hasStarted,
    DateTime? startedAt,
  }) = _BpdProgrammeStatus;

  const BpdProgrammeStatus._();

  factory BpdProgrammeStatus.fromJson(Map<String, Object?> json) =>
      _$BpdProgrammeStatusFromJson(json);
}
