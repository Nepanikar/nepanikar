// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_contacts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllContacts {

 List<CountryContacts> get countryContacts;
/// Create a copy of AllContacts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllContactsCopyWith<AllContacts> get copyWith => _$AllContactsCopyWithImpl<AllContacts>(this as AllContacts, _$identity);

  /// Serializes this AllContacts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllContacts&&const DeepCollectionEquality().equals(other.countryContacts, countryContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(countryContacts));

@override
String toString() {
  return 'AllContacts(countryContacts: $countryContacts)';
}


}

/// @nodoc
abstract mixin class $AllContactsCopyWith<$Res>  {
  factory $AllContactsCopyWith(AllContacts value, $Res Function(AllContacts) _then) = _$AllContactsCopyWithImpl;
@useResult
$Res call({
 List<CountryContacts> countryContacts
});




}
/// @nodoc
class _$AllContactsCopyWithImpl<$Res>
    implements $AllContactsCopyWith<$Res> {
  _$AllContactsCopyWithImpl(this._self, this._then);

  final AllContacts _self;
  final $Res Function(AllContacts) _then;

/// Create a copy of AllContacts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countryContacts = null,}) {
  return _then(_self.copyWith(
countryContacts: null == countryContacts ? _self.countryContacts : countryContacts // ignore: cast_nullable_to_non_nullable
as List<CountryContacts>,
  ));
}

}


/// Adds pattern-matching-related methods to [AllContacts].
extension AllContactsPatterns on AllContacts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllContacts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllContacts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllContacts value)  $default,){
final _that = this;
switch (_that) {
case _AllContacts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllContacts value)?  $default,){
final _that = this;
switch (_that) {
case _AllContacts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CountryContacts> countryContacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllContacts() when $default != null:
return $default(_that.countryContacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CountryContacts> countryContacts)  $default,) {final _that = this;
switch (_that) {
case _AllContacts():
return $default(_that.countryContacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CountryContacts> countryContacts)?  $default,) {final _that = this;
switch (_that) {
case _AllContacts() when $default != null:
return $default(_that.countryContacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllContacts extends AllContacts {
  const _AllContacts({required final  List<CountryContacts> countryContacts}): _countryContacts = countryContacts,super._();
  factory _AllContacts.fromJson(Map<String, dynamic> json) => _$AllContactsFromJson(json);

 final  List<CountryContacts> _countryContacts;
@override List<CountryContacts> get countryContacts {
  if (_countryContacts is EqualUnmodifiableListView) return _countryContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countryContacts);
}


/// Create a copy of AllContacts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllContactsCopyWith<_AllContacts> get copyWith => __$AllContactsCopyWithImpl<_AllContacts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllContactsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllContacts&&const DeepCollectionEquality().equals(other._countryContacts, _countryContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_countryContacts));

@override
String toString() {
  return 'AllContacts(countryContacts: $countryContacts)';
}


}

/// @nodoc
abstract mixin class _$AllContactsCopyWith<$Res> implements $AllContactsCopyWith<$Res> {
  factory _$AllContactsCopyWith(_AllContacts value, $Res Function(_AllContacts) _then) = __$AllContactsCopyWithImpl;
@override @useResult
$Res call({
 List<CountryContacts> countryContacts
});




}
/// @nodoc
class __$AllContactsCopyWithImpl<$Res>
    implements _$AllContactsCopyWith<$Res> {
  __$AllContactsCopyWithImpl(this._self, this._then);

  final _AllContacts _self;
  final $Res Function(_AllContacts) _then;

/// Create a copy of AllContacts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countryContacts = null,}) {
  return _then(_AllContacts(
countryContacts: null == countryContacts ? _self._countryContacts : countryContacts // ignore: cast_nullable_to_non_nullable
as List<CountryContacts>,
  ));
}


}

// dart format on
