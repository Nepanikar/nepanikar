// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_models.freezed.dart';
part 'user_settings_models.g.dart';

@freezed
class UserLanguage with _$UserLanguage {
  const factory UserLanguage({
    required String languageCode,
    required String? countryCode,
  }) = _UserLanguage;

  const UserLanguage._();

  factory UserLanguage.fromJson(Map<String, Object?> json) => _$UserLanguageFromJson(json);

  static UserLanguage fromLocale(Locale locale) => UserLanguage(
        languageCode: locale.languageCode,
        countryCode: locale.countryCode,
      );

  Locale toLocale() => Locale(languageCode, countryCode);
}
