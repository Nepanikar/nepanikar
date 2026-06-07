// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotificationData {

 NotificationType get type;
/// Create a copy of AppNotificationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationDataCopyWith<AppNotificationData> get copyWith => _$AppNotificationDataCopyWithImpl<AppNotificationData>(this as AppNotificationData, _$identity);

  /// Serializes this AppNotificationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationData&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'AppNotificationData(type: $type)';
}


}

/// @nodoc
abstract mixin class $AppNotificationDataCopyWith<$Res>  {
  factory $AppNotificationDataCopyWith(AppNotificationData value, $Res Function(AppNotificationData) _then) = _$AppNotificationDataCopyWithImpl;
@useResult
$Res call({
 NotificationType type
});




}
/// @nodoc
class _$AppNotificationDataCopyWithImpl<$Res>
    implements $AppNotificationDataCopyWith<$Res> {
  _$AppNotificationDataCopyWithImpl(this._self, this._then);

  final AppNotificationData _self;
  final $Res Function(AppNotificationData) _then;

/// Create a copy of AppNotificationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotificationData].
extension AppNotificationDataPatterns on AppNotificationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationData value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationData value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationData() when $default != null:
return $default(_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationType type)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationData():
return $default(_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationType type)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationData() when $default != null:
return $default(_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotificationData extends AppNotificationData {
  const _AppNotificationData({required this.type}): super._();
  factory _AppNotificationData.fromJson(Map<String, dynamic> json) => _$AppNotificationDataFromJson(json);

@override final  NotificationType type;

/// Create a copy of AppNotificationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationDataCopyWith<_AppNotificationData> get copyWith => __$AppNotificationDataCopyWithImpl<_AppNotificationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationData&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'AppNotificationData(type: $type)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationDataCopyWith<$Res> implements $AppNotificationDataCopyWith<$Res> {
  factory _$AppNotificationDataCopyWith(_AppNotificationData value, $Res Function(_AppNotificationData) _then) = __$AppNotificationDataCopyWithImpl;
@override @useResult
$Res call({
 NotificationType type
});




}
/// @nodoc
class __$AppNotificationDataCopyWithImpl<$Res>
    implements _$AppNotificationDataCopyWith<$Res> {
  __$AppNotificationDataCopyWithImpl(this._self, this._then);

  final _AppNotificationData _self;
  final $Res Function(_AppNotificationData) _then;

/// Create a copy of AppNotificationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_AppNotificationData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,
  ));
}


}

// dart format on
