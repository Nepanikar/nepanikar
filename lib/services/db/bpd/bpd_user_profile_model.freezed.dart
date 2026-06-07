// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpd_user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BpdUserProfile {

 String get name; BpdPronoun get pronoun; DateTime? get createdAt;
/// Create a copy of BpdUserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpdUserProfileCopyWith<BpdUserProfile> get copyWith => _$BpdUserProfileCopyWithImpl<BpdUserProfile>(this as BpdUserProfile, _$identity);

  /// Serializes this BpdUserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpdUserProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.pronoun, pronoun) || other.pronoun == pronoun)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pronoun,createdAt);

@override
String toString() {
  return 'BpdUserProfile(name: $name, pronoun: $pronoun, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BpdUserProfileCopyWith<$Res>  {
  factory $BpdUserProfileCopyWith(BpdUserProfile value, $Res Function(BpdUserProfile) _then) = _$BpdUserProfileCopyWithImpl;
@useResult
$Res call({
 String name, BpdPronoun pronoun, DateTime? createdAt
});




}
/// @nodoc
class _$BpdUserProfileCopyWithImpl<$Res>
    implements $BpdUserProfileCopyWith<$Res> {
  _$BpdUserProfileCopyWithImpl(this._self, this._then);

  final BpdUserProfile _self;
  final $Res Function(BpdUserProfile) _then;

/// Create a copy of BpdUserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pronoun = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pronoun: null == pronoun ? _self.pronoun : pronoun // ignore: cast_nullable_to_non_nullable
as BpdPronoun,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BpdUserProfile].
extension BpdUserProfilePatterns on BpdUserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpdUserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpdUserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpdUserProfile value)  $default,){
final _that = this;
switch (_that) {
case _BpdUserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpdUserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _BpdUserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  BpdPronoun pronoun,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpdUserProfile() when $default != null:
return $default(_that.name,_that.pronoun,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  BpdPronoun pronoun,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BpdUserProfile():
return $default(_that.name,_that.pronoun,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  BpdPronoun pronoun,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BpdUserProfile() when $default != null:
return $default(_that.name,_that.pronoun,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpdUserProfile extends BpdUserProfile {
  const _BpdUserProfile({required this.name, required this.pronoun, this.createdAt}): super._();
  factory _BpdUserProfile.fromJson(Map<String, dynamic> json) => _$BpdUserProfileFromJson(json);

@override final  String name;
@override final  BpdPronoun pronoun;
@override final  DateTime? createdAt;

/// Create a copy of BpdUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpdUserProfileCopyWith<_BpdUserProfile> get copyWith => __$BpdUserProfileCopyWithImpl<_BpdUserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpdUserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpdUserProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.pronoun, pronoun) || other.pronoun == pronoun)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pronoun,createdAt);

@override
String toString() {
  return 'BpdUserProfile(name: $name, pronoun: $pronoun, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BpdUserProfileCopyWith<$Res> implements $BpdUserProfileCopyWith<$Res> {
  factory _$BpdUserProfileCopyWith(_BpdUserProfile value, $Res Function(_BpdUserProfile) _then) = __$BpdUserProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, BpdPronoun pronoun, DateTime? createdAt
});




}
/// @nodoc
class __$BpdUserProfileCopyWithImpl<$Res>
    implements _$BpdUserProfileCopyWith<$Res> {
  __$BpdUserProfileCopyWithImpl(this._self, this._then);

  final _BpdUserProfile _self;
  final $Res Function(_BpdUserProfile) _then;

/// Create a copy of BpdUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pronoun = null,Object? createdAt = freezed,}) {
  return _then(_BpdUserProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pronoun: null == pronoun ? _self.pronoun : pronoun // ignore: cast_nullable_to_non_nullable
as BpdPronoun,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
