// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) {
  return _UserLanguage.fromJson(json);
}

/// @nodoc
mixin _$UserLanguage {
  String get languageCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLanguageCopyWith<UserLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLanguageCopyWith<$Res> {
  factory $UserLanguageCopyWith(
          UserLanguage value, $Res Function(UserLanguage) then) =
      _$UserLanguageCopyWithImpl<$Res, UserLanguage>;
  @useResult
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class _$UserLanguageCopyWithImpl<$Res, $Val extends UserLanguage>
    implements $UserLanguageCopyWith<$Res> {
  _$UserLanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLanguageCopyWith<$Res>
    implements $UserLanguageCopyWith<$Res> {
  factory _$$_UserLanguageCopyWith(
          _$_UserLanguage value, $Res Function(_$_UserLanguage) then) =
      __$$_UserLanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class __$$_UserLanguageCopyWithImpl<$Res>
    extends _$UserLanguageCopyWithImpl<$Res, _$_UserLanguage>
    implements _$$_UserLanguageCopyWith<$Res> {
  __$$_UserLanguageCopyWithImpl(
      _$_UserLanguage _value, $Res Function(_$_UserLanguage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = freezed,
  }) {
    return _then(_$_UserLanguage(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLanguage extends _UserLanguage {
  const _$_UserLanguage({required this.languageCode, required this.countryCode})
      : super._();

  factory _$_UserLanguage.fromJson(Map<String, dynamic> json) =>
      _$$_UserLanguageFromJson(json);

  @override
  final String languageCode;
  @override
  final String? countryCode;

  @override
  String toString() {
    return 'UserLanguage(languageCode: $languageCode, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLanguage &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode, countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLanguageCopyWith<_$_UserLanguage> get copyWith =>
      __$$_UserLanguageCopyWithImpl<_$_UserLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLanguageToJson(
      this,
    );
  }
}

abstract class _UserLanguage extends UserLanguage {
  const factory _UserLanguage(
      {required final String languageCode,
      required final String? countryCode}) = _$_UserLanguage;
  const _UserLanguage._() : super._();

  factory _UserLanguage.fromJson(Map<String, dynamic> json) =
      _$_UserLanguage.fromJson;

  @override
  String get languageCode;
  @override
  String? get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$_UserLanguageCopyWith<_$_UserLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationTypeSettings _$NotificationTypeSettingsFromJson(
    Map<String, dynamic> json) {
  return _NotificationTypeSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationTypeSettings {
  NotificationType get type => throw _privateConstructorUsedError;
  int get scheduledHour => throw _privateConstructorUsedError;
  int get scheduledMinute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTypeSettingsCopyWith<NotificationTypeSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTypeSettingsCopyWith<$Res> {
  factory $NotificationTypeSettingsCopyWith(NotificationTypeSettings value,
          $Res Function(NotificationTypeSettings) then) =
      _$NotificationTypeSettingsCopyWithImpl<$Res, NotificationTypeSettings>;
  @useResult
  $Res call({NotificationType type, int scheduledHour, int scheduledMinute});
}

/// @nodoc
class _$NotificationTypeSettingsCopyWithImpl<$Res,
        $Val extends NotificationTypeSettings>
    implements $NotificationTypeSettingsCopyWith<$Res> {
  _$NotificationTypeSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? scheduledHour = null,
    Object? scheduledMinute = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      scheduledHour: null == scheduledHour
          ? _value.scheduledHour
          : scheduledHour // ignore: cast_nullable_to_non_nullable
              as int,
      scheduledMinute: null == scheduledMinute
          ? _value.scheduledMinute
          : scheduledMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationTypeSettingsCopyWith<$Res>
    implements $NotificationTypeSettingsCopyWith<$Res> {
  factory _$$_NotificationTypeSettingsCopyWith(
          _$_NotificationTypeSettings value,
          $Res Function(_$_NotificationTypeSettings) then) =
      __$$_NotificationTypeSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationType type, int scheduledHour, int scheduledMinute});
}

/// @nodoc
class __$$_NotificationTypeSettingsCopyWithImpl<$Res>
    extends _$NotificationTypeSettingsCopyWithImpl<$Res,
        _$_NotificationTypeSettings>
    implements _$$_NotificationTypeSettingsCopyWith<$Res> {
  __$$_NotificationTypeSettingsCopyWithImpl(_$_NotificationTypeSettings _value,
      $Res Function(_$_NotificationTypeSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? scheduledHour = null,
    Object? scheduledMinute = null,
  }) {
    return _then(_$_NotificationTypeSettings(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      scheduledHour: null == scheduledHour
          ? _value.scheduledHour
          : scheduledHour // ignore: cast_nullable_to_non_nullable
              as int,
      scheduledMinute: null == scheduledMinute
          ? _value.scheduledMinute
          : scheduledMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationTypeSettings extends _NotificationTypeSettings {
  const _$_NotificationTypeSettings(
      {required this.type,
      required this.scheduledHour,
      required this.scheduledMinute})
      : super._();

  factory _$_NotificationTypeSettings.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationTypeSettingsFromJson(json);

  @override
  final NotificationType type;
  @override
  final int scheduledHour;
  @override
  final int scheduledMinute;

  @override
  String toString() {
    return 'NotificationTypeSettings(type: $type, scheduledHour: $scheduledHour, scheduledMinute: $scheduledMinute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationTypeSettings &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduledHour, scheduledHour) ||
                other.scheduledHour == scheduledHour) &&
            (identical(other.scheduledMinute, scheduledMinute) ||
                other.scheduledMinute == scheduledMinute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, scheduledHour, scheduledMinute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationTypeSettingsCopyWith<_$_NotificationTypeSettings>
      get copyWith => __$$_NotificationTypeSettingsCopyWithImpl<
          _$_NotificationTypeSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationTypeSettingsToJson(
      this,
    );
  }
}

abstract class _NotificationTypeSettings extends NotificationTypeSettings {
  const factory _NotificationTypeSettings(
      {required final NotificationType type,
      required final int scheduledHour,
      required final int scheduledMinute}) = _$_NotificationTypeSettings;
  const _NotificationTypeSettings._() : super._();

  factory _NotificationTypeSettings.fromJson(Map<String, dynamic> json) =
      _$_NotificationTypeSettings.fromJson;

  @override
  NotificationType get type;
  @override
  int get scheduledHour;
  @override
  int get scheduledMinute;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationTypeSettingsCopyWith<_$_NotificationTypeSettings>
      get copyWith => throw _privateConstructorUsedError;
}

UserThemeMode _$UserThemeModeFromJson(Map<String, dynamic> json) {
  return _UserThemeMode.fromJson(json);
}

/// @nodoc
mixin _$UserThemeMode {
  String get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserThemeModeCopyWith<UserThemeMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserThemeModeCopyWith<$Res> {
  factory $UserThemeModeCopyWith(
          UserThemeMode value, $Res Function(UserThemeMode) then) =
      _$UserThemeModeCopyWithImpl<$Res, UserThemeMode>;
  @useResult
  $Res call({String themeMode});
}

/// @nodoc
class _$UserThemeModeCopyWithImpl<$Res, $Val extends UserThemeMode>
    implements $UserThemeModeCopyWith<$Res> {
  _$UserThemeModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserThemeModeCopyWith<$Res>
    implements $UserThemeModeCopyWith<$Res> {
  factory _$$_UserThemeModeCopyWith(
          _$_UserThemeMode value, $Res Function(_$_UserThemeMode) then) =
      __$$_UserThemeModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String themeMode});
}

/// @nodoc
class __$$_UserThemeModeCopyWithImpl<$Res>
    extends _$UserThemeModeCopyWithImpl<$Res, _$_UserThemeMode>
    implements _$$_UserThemeModeCopyWith<$Res> {
  __$$_UserThemeModeCopyWithImpl(
      _$_UserThemeMode _value, $Res Function(_$_UserThemeMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$_UserThemeMode(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserThemeMode extends _UserThemeMode {
  const _$_UserThemeMode({this.themeMode = 'system'}) : super._();

  factory _$_UserThemeMode.fromJson(Map<String, dynamic> json) =>
      _$$_UserThemeModeFromJson(json);

  @override
  @JsonKey()
  final String themeMode;

  @override
  String toString() {
    return 'UserThemeMode(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserThemeMode &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserThemeModeCopyWith<_$_UserThemeMode> get copyWith =>
      __$$_UserThemeModeCopyWithImpl<_$_UserThemeMode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserThemeModeToJson(
      this,
    );
  }
}

abstract class _UserThemeMode extends UserThemeMode {
  const factory _UserThemeMode({final String themeMode}) = _$_UserThemeMode;
  const _UserThemeMode._() : super._();

  factory _UserThemeMode.fromJson(Map<String, dynamic> json) =
      _$_UserThemeMode.fromJson;

  @override
  String get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_UserThemeModeCopyWith<_$_UserThemeMode> get copyWith =>
      throw _privateConstructorUsedError;
}
