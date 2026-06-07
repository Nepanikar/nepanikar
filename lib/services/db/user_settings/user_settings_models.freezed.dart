// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLanguage {

 String get languageCode; String? get countryCode;
/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLanguageCopyWith<UserLanguage> get copyWith => _$UserLanguageCopyWithImpl<UserLanguage>(this as UserLanguage, _$identity);

  /// Serializes this UserLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLanguage&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,languageCode,countryCode);

@override
String toString() {
  return 'UserLanguage(languageCode: $languageCode, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class $UserLanguageCopyWith<$Res>  {
  factory $UserLanguageCopyWith(UserLanguage value, $Res Function(UserLanguage) _then) = _$UserLanguageCopyWithImpl;
@useResult
$Res call({
 String languageCode, String? countryCode
});




}
/// @nodoc
class _$UserLanguageCopyWithImpl<$Res>
    implements $UserLanguageCopyWith<$Res> {
  _$UserLanguageCopyWithImpl(this._self, this._then);

  final UserLanguage _self;
  final $Res Function(UserLanguage) _then;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? languageCode = null,Object? countryCode = freezed,}) {
  return _then(_self.copyWith(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLanguage].
extension UserLanguagePatterns on UserLanguage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLanguage value)  $default,){
final _that = this;
switch (_that) {
case _UserLanguage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String languageCode,  String? countryCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that.languageCode,_that.countryCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String languageCode,  String? countryCode)  $default,) {final _that = this;
switch (_that) {
case _UserLanguage():
return $default(_that.languageCode,_that.countryCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String languageCode,  String? countryCode)?  $default,) {final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that.languageCode,_that.countryCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLanguage extends UserLanguage {
  const _UserLanguage({required this.languageCode, required this.countryCode}): super._();
  factory _UserLanguage.fromJson(Map<String, dynamic> json) => _$UserLanguageFromJson(json);

@override final  String languageCode;
@override final  String? countryCode;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLanguageCopyWith<_UserLanguage> get copyWith => __$UserLanguageCopyWithImpl<_UserLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLanguage&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,languageCode,countryCode);

@override
String toString() {
  return 'UserLanguage(languageCode: $languageCode, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class _$UserLanguageCopyWith<$Res> implements $UserLanguageCopyWith<$Res> {
  factory _$UserLanguageCopyWith(_UserLanguage value, $Res Function(_UserLanguage) _then) = __$UserLanguageCopyWithImpl;
@override @useResult
$Res call({
 String languageCode, String? countryCode
});




}
/// @nodoc
class __$UserLanguageCopyWithImpl<$Res>
    implements _$UserLanguageCopyWith<$Res> {
  __$UserLanguageCopyWithImpl(this._self, this._then);

  final _UserLanguage _self;
  final $Res Function(_UserLanguage) _then;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? languageCode = null,Object? countryCode = freezed,}) {
  return _then(_UserLanguage(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationTypeSettings {

 NotificationType get type; int get scheduledHour; int get scheduledMinute;
/// Create a copy of NotificationTypeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTypeSettingsCopyWith<NotificationTypeSettings> get copyWith => _$NotificationTypeSettingsCopyWithImpl<NotificationTypeSettings>(this as NotificationTypeSettings, _$identity);

  /// Serializes this NotificationTypeSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTypeSettings&&(identical(other.type, type) || other.type == type)&&(identical(other.scheduledHour, scheduledHour) || other.scheduledHour == scheduledHour)&&(identical(other.scheduledMinute, scheduledMinute) || other.scheduledMinute == scheduledMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,scheduledHour,scheduledMinute);

@override
String toString() {
  return 'NotificationTypeSettings(type: $type, scheduledHour: $scheduledHour, scheduledMinute: $scheduledMinute)';
}


}

/// @nodoc
abstract mixin class $NotificationTypeSettingsCopyWith<$Res>  {
  factory $NotificationTypeSettingsCopyWith(NotificationTypeSettings value, $Res Function(NotificationTypeSettings) _then) = _$NotificationTypeSettingsCopyWithImpl;
@useResult
$Res call({
 NotificationType type, int scheduledHour, int scheduledMinute
});




}
/// @nodoc
class _$NotificationTypeSettingsCopyWithImpl<$Res>
    implements $NotificationTypeSettingsCopyWith<$Res> {
  _$NotificationTypeSettingsCopyWithImpl(this._self, this._then);

  final NotificationTypeSettings _self;
  final $Res Function(NotificationTypeSettings) _then;

/// Create a copy of NotificationTypeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? scheduledHour = null,Object? scheduledMinute = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,scheduledHour: null == scheduledHour ? _self.scheduledHour : scheduledHour // ignore: cast_nullable_to_non_nullable
as int,scheduledMinute: null == scheduledMinute ? _self.scheduledMinute : scheduledMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationTypeSettings].
extension NotificationTypeSettingsPatterns on NotificationTypeSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTypeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTypeSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTypeSettings value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTypeSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTypeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTypeSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationType type,  int scheduledHour,  int scheduledMinute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationTypeSettings() when $default != null:
return $default(_that.type,_that.scheduledHour,_that.scheduledMinute);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationType type,  int scheduledHour,  int scheduledMinute)  $default,) {final _that = this;
switch (_that) {
case _NotificationTypeSettings():
return $default(_that.type,_that.scheduledHour,_that.scheduledMinute);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationType type,  int scheduledHour,  int scheduledMinute)?  $default,) {final _that = this;
switch (_that) {
case _NotificationTypeSettings() when $default != null:
return $default(_that.type,_that.scheduledHour,_that.scheduledMinute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationTypeSettings extends NotificationTypeSettings {
  const _NotificationTypeSettings({required this.type, required this.scheduledHour, required this.scheduledMinute}): super._();
  factory _NotificationTypeSettings.fromJson(Map<String, dynamic> json) => _$NotificationTypeSettingsFromJson(json);

@override final  NotificationType type;
@override final  int scheduledHour;
@override final  int scheduledMinute;

/// Create a copy of NotificationTypeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTypeSettingsCopyWith<_NotificationTypeSettings> get copyWith => __$NotificationTypeSettingsCopyWithImpl<_NotificationTypeSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTypeSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTypeSettings&&(identical(other.type, type) || other.type == type)&&(identical(other.scheduledHour, scheduledHour) || other.scheduledHour == scheduledHour)&&(identical(other.scheduledMinute, scheduledMinute) || other.scheduledMinute == scheduledMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,scheduledHour,scheduledMinute);

@override
String toString() {
  return 'NotificationTypeSettings(type: $type, scheduledHour: $scheduledHour, scheduledMinute: $scheduledMinute)';
}


}

/// @nodoc
abstract mixin class _$NotificationTypeSettingsCopyWith<$Res> implements $NotificationTypeSettingsCopyWith<$Res> {
  factory _$NotificationTypeSettingsCopyWith(_NotificationTypeSettings value, $Res Function(_NotificationTypeSettings) _then) = __$NotificationTypeSettingsCopyWithImpl;
@override @useResult
$Res call({
 NotificationType type, int scheduledHour, int scheduledMinute
});




}
/// @nodoc
class __$NotificationTypeSettingsCopyWithImpl<$Res>
    implements _$NotificationTypeSettingsCopyWith<$Res> {
  __$NotificationTypeSettingsCopyWithImpl(this._self, this._then);

  final _NotificationTypeSettings _self;
  final $Res Function(_NotificationTypeSettings) _then;

/// Create a copy of NotificationTypeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? scheduledHour = null,Object? scheduledMinute = null,}) {
  return _then(_NotificationTypeSettings(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,scheduledHour: null == scheduledHour ? _self.scheduledHour : scheduledHour // ignore: cast_nullable_to_non_nullable
as int,scheduledMinute: null == scheduledMinute ? _self.scheduledMinute : scheduledMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UserThemeMode {

 String get themeMode;
/// Create a copy of UserThemeMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserThemeModeCopyWith<UserThemeMode> get copyWith => _$UserThemeModeCopyWithImpl<UserThemeMode>(this as UserThemeMode, _$identity);

  /// Serializes this UserThemeMode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserThemeMode&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'UserThemeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $UserThemeModeCopyWith<$Res>  {
  factory $UserThemeModeCopyWith(UserThemeMode value, $Res Function(UserThemeMode) _then) = _$UserThemeModeCopyWithImpl;
@useResult
$Res call({
 String themeMode
});




}
/// @nodoc
class _$UserThemeModeCopyWithImpl<$Res>
    implements $UserThemeModeCopyWith<$Res> {
  _$UserThemeModeCopyWithImpl(this._self, this._then);

  final UserThemeMode _self;
  final $Res Function(UserThemeMode) _then;

/// Create a copy of UserThemeMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserThemeMode].
extension UserThemeModePatterns on UserThemeMode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserThemeMode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserThemeMode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserThemeMode value)  $default,){
final _that = this;
switch (_that) {
case _UserThemeMode():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserThemeMode value)?  $default,){
final _that = this;
switch (_that) {
case _UserThemeMode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserThemeMode() when $default != null:
return $default(_that.themeMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String themeMode)  $default,) {final _that = this;
switch (_that) {
case _UserThemeMode():
return $default(_that.themeMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String themeMode)?  $default,) {final _that = this;
switch (_that) {
case _UserThemeMode() when $default != null:
return $default(_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserThemeMode extends UserThemeMode {
  const _UserThemeMode({this.themeMode = 'system'}): super._();
  factory _UserThemeMode.fromJson(Map<String, dynamic> json) => _$UserThemeModeFromJson(json);

@override@JsonKey() final  String themeMode;

/// Create a copy of UserThemeMode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserThemeModeCopyWith<_UserThemeMode> get copyWith => __$UserThemeModeCopyWithImpl<_UserThemeMode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserThemeModeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserThemeMode&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'UserThemeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$UserThemeModeCopyWith<$Res> implements $UserThemeModeCopyWith<$Res> {
  factory _$UserThemeModeCopyWith(_UserThemeMode value, $Res Function(_UserThemeMode) _then) = __$UserThemeModeCopyWithImpl;
@override @useResult
$Res call({
 String themeMode
});




}
/// @nodoc
class __$UserThemeModeCopyWithImpl<$Res>
    implements _$UserThemeModeCopyWith<$Res> {
  __$UserThemeModeCopyWithImpl(this._self, this._then);

  final _UserThemeMode _self;
  final $Res Function(_UserThemeMode) _then;

/// Create a copy of UserThemeMode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_UserThemeMode(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BpdProgrammeStatus {

 bool get hasStarted; DateTime? get startedAt;
/// Create a copy of BpdProgrammeStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdProgrammeStatusCopyWith<BpdProgrammeStatus> get copyWith => _$BpdProgrammeStatusCopyWithImpl<BpdProgrammeStatus>(this as BpdProgrammeStatus, _$identity);

  /// Serializes this BpdProgrammeStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdProgrammeStatus&&(identical(other.hasStarted, hasStarted) || other.hasStarted == hasStarted)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasStarted,startedAt);

@override
String toString() {
  return 'BpdProgrammeStatus(hasStarted: $hasStarted, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $BpdProgrammeStatusCopyWith<$Res>  {
  factory $BpdProgrammeStatusCopyWith(BpdProgrammeStatus value, $Res Function(BpdProgrammeStatus) _then) = _$BpdProgrammeStatusCopyWithImpl;
@useResult
$Res call({
 bool hasStarted, DateTime? startedAt
});




}
/// @nodoc
class _$BpdProgrammeStatusCopyWithImpl<$Res>
    implements $BpdProgrammeStatusCopyWith<$Res> {
  _$BpdProgrammeStatusCopyWithImpl(this._self, this._then);

  final BpdProgrammeStatus _self;
  final $Res Function(BpdProgrammeStatus) _then;

/// Create a copy of BpdProgrammeStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasStarted = null,Object? startedAt = freezed,}) {
  return _then(_self.copyWith(
hasStarted: null == hasStarted ? _self.hasStarted : hasStarted // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdProgrammeStatus].
extension BpdProgrammeStatusPatterns on BpdProgrammeStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdProgrammeStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdProgrammeStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdProgrammeStatus value)  $default,){
final _that = this;
switch (_that) {
case _BpdProgrammeStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdProgrammeStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BpdProgrammeStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasStarted,  DateTime? startedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdProgrammeStatus() when $default != null:
return $default(_that.hasStarted,_that.startedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasStarted,  DateTime? startedAt)  $default,) {final _that = this;
switch (_that) {
case _BpdProgrammeStatus():
return $default(_that.hasStarted,_that.startedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasStarted,  DateTime? startedAt)?  $default,) {final _that = this;
switch (_that) {
case _BpdProgrammeStatus() when $default != null:
return $default(_that.hasStarted,_that.startedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdProgrammeStatus extends BpdProgrammeStatus {
  const _BpdProgrammeStatus({required this.hasStarted, this.startedAt}): super._();
  factory _BpdProgrammeStatus.fromJson(Map<String, dynamic> json) => _$BpdProgrammeStatusFromJson(json);

@override final  bool hasStarted;
@override final  DateTime? startedAt;

/// Create a copy of BpdProgrammeStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdProgrammeStatusCopyWith<_BpdProgrammeStatus> get copyWith => __$BpdProgrammeStatusCopyWithImpl<_BpdProgrammeStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdProgrammeStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdProgrammeStatus&&(identical(other.hasStarted, hasStarted) || other.hasStarted == hasStarted)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasStarted,startedAt);

@override
String toString() {
  return 'BpdProgrammeStatus(hasStarted: $hasStarted, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class _$BpdProgrammeStatusCopyWith<$Res> implements $BpdProgrammeStatusCopyWith<$Res> {
  factory _$BpdProgrammeStatusCopyWith(_BpdProgrammeStatus value, $Res Function(_BpdProgrammeStatus) _then) = __$BpdProgrammeStatusCopyWithImpl;
@override @useResult
$Res call({
 bool hasStarted, DateTime? startedAt
});




}
/// @nodoc
class __$BpdProgrammeStatusCopyWithImpl<$Res>
    implements _$BpdProgrammeStatusCopyWith<$Res> {
  __$BpdProgrammeStatusCopyWithImpl(this._self, this._then);

  final _BpdProgrammeStatus _self;
  final $Res Function(_BpdProgrammeStatus) _then;

/// Create a copy of BpdProgrammeStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasStarted = null,Object? startedAt = freezed,}) {
  return _then(_BpdProgrammeStatus(
hasStarted: null == hasStarted ? _self.hasStarted : hasStarted // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
