// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_contacts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryContacts {

 String get languageCode; List<PhoneContact>? get phoneContacts; List<RegionContact>? get crisisCenterContacts; List<ChatContact>? get chatContacts; List<RegionContact>? get universityRegionContacts; List<String>? get eatingDisorderContacts;
/// Create a copy of CountryContacts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryContactsCopyWith<CountryContacts> get copyWith => _$CountryContactsCopyWithImpl<CountryContacts>(this as CountryContacts, _$identity);

  /// Serializes this CountryContacts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryContacts&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other.phoneContacts, phoneContacts)&&const DeepCollectionEquality().equals(other.crisisCenterContacts, crisisCenterContacts)&&const DeepCollectionEquality().equals(other.chatContacts, chatContacts)&&const DeepCollectionEquality().equals(other.universityRegionContacts, universityRegionContacts)&&const DeepCollectionEquality().equals(other.eatingDisorderContacts, eatingDisorderContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,languageCode,const DeepCollectionEquality().hash(phoneContacts),const DeepCollectionEquality().hash(crisisCenterContacts),const DeepCollectionEquality().hash(chatContacts),const DeepCollectionEquality().hash(universityRegionContacts),const DeepCollectionEquality().hash(eatingDisorderContacts));

@override
String toString() {
  return 'CountryContacts(languageCode: $languageCode, phoneContacts: $phoneContacts, crisisCenterContacts: $crisisCenterContacts, chatContacts: $chatContacts, universityRegionContacts: $universityRegionContacts, eatingDisorderContacts: $eatingDisorderContacts)';
}


}

/// @nodoc
abstract mixin class $CountryContactsCopyWith<$Res>  {
  factory $CountryContactsCopyWith(CountryContacts value, $Res Function(CountryContacts) _then) = _$CountryContactsCopyWithImpl;
@useResult
$Res call({
 String languageCode, List<PhoneContact>? phoneContacts, List<RegionContact>? crisisCenterContacts, List<ChatContact>? chatContacts, List<RegionContact>? universityRegionContacts, List<String>? eatingDisorderContacts
});




}
/// @nodoc
class _$CountryContactsCopyWithImpl<$Res>
    implements $CountryContactsCopyWith<$Res> {
  _$CountryContactsCopyWithImpl(this._self, this._then);

  final CountryContacts _self;
  final $Res Function(CountryContacts) _then;

/// Create a copy of CountryContacts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? languageCode = null,Object? phoneContacts = freezed,Object? crisisCenterContacts = freezed,Object? chatContacts = freezed,Object? universityRegionContacts = freezed,Object? eatingDisorderContacts = freezed,}) {
  return _then(_self.copyWith(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,phoneContacts: freezed == phoneContacts ? _self.phoneContacts : phoneContacts // ignore: cast_nullable_to_non_nullable
as List<PhoneContact>?,crisisCenterContacts: freezed == crisisCenterContacts ? _self.crisisCenterContacts : crisisCenterContacts // ignore: cast_nullable_to_non_nullable
as List<RegionContact>?,chatContacts: freezed == chatContacts ? _self.chatContacts : chatContacts // ignore: cast_nullable_to_non_nullable
as List<ChatContact>?,universityRegionContacts: freezed == universityRegionContacts ? _self.universityRegionContacts : universityRegionContacts // ignore: cast_nullable_to_non_nullable
as List<RegionContact>?,eatingDisorderContacts: freezed == eatingDisorderContacts ? _self.eatingDisorderContacts : eatingDisorderContacts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CountryContacts].
extension CountryContactsPatterns on CountryContacts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryContacts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryContacts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryContacts value)  $default,){
final _that = this;
switch (_that) {
case _CountryContacts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryContacts value)?  $default,){
final _that = this;
switch (_that) {
case _CountryContacts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String languageCode,  List<PhoneContact>? phoneContacts,  List<RegionContact>? crisisCenterContacts,  List<ChatContact>? chatContacts,  List<RegionContact>? universityRegionContacts,  List<String>? eatingDisorderContacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryContacts() when $default != null:
return $default(_that.languageCode,_that.phoneContacts,_that.crisisCenterContacts,_that.chatContacts,_that.universityRegionContacts,_that.eatingDisorderContacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String languageCode,  List<PhoneContact>? phoneContacts,  List<RegionContact>? crisisCenterContacts,  List<ChatContact>? chatContacts,  List<RegionContact>? universityRegionContacts,  List<String>? eatingDisorderContacts)  $default,) {final _that = this;
switch (_that) {
case _CountryContacts():
return $default(_that.languageCode,_that.phoneContacts,_that.crisisCenterContacts,_that.chatContacts,_that.universityRegionContacts,_that.eatingDisorderContacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String languageCode,  List<PhoneContact>? phoneContacts,  List<RegionContact>? crisisCenterContacts,  List<ChatContact>? chatContacts,  List<RegionContact>? universityRegionContacts,  List<String>? eatingDisorderContacts)?  $default,) {final _that = this;
switch (_that) {
case _CountryContacts() when $default != null:
return $default(_that.languageCode,_that.phoneContacts,_that.crisisCenterContacts,_that.chatContacts,_that.universityRegionContacts,_that.eatingDisorderContacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountryContacts extends CountryContacts {
  const _CountryContacts({required this.languageCode, final  List<PhoneContact>? phoneContacts, final  List<RegionContact>? crisisCenterContacts, final  List<ChatContact>? chatContacts, final  List<RegionContact>? universityRegionContacts, final  List<String>? eatingDisorderContacts}): _phoneContacts = phoneContacts,_crisisCenterContacts = crisisCenterContacts,_chatContacts = chatContacts,_universityRegionContacts = universityRegionContacts,_eatingDisorderContacts = eatingDisorderContacts,super._();
  factory _CountryContacts.fromJson(Map<String, dynamic> json) => _$CountryContactsFromJson(json);

@override final  String languageCode;
 final  List<PhoneContact>? _phoneContacts;
@override List<PhoneContact>? get phoneContacts {
  final value = _phoneContacts;
  if (value == null) return null;
  if (_phoneContacts is EqualUnmodifiableListView) return _phoneContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RegionContact>? _crisisCenterContacts;
@override List<RegionContact>? get crisisCenterContacts {
  final value = _crisisCenterContacts;
  if (value == null) return null;
  if (_crisisCenterContacts is EqualUnmodifiableListView) return _crisisCenterContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ChatContact>? _chatContacts;
@override List<ChatContact>? get chatContacts {
  final value = _chatContacts;
  if (value == null) return null;
  if (_chatContacts is EqualUnmodifiableListView) return _chatContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RegionContact>? _universityRegionContacts;
@override List<RegionContact>? get universityRegionContacts {
  final value = _universityRegionContacts;
  if (value == null) return null;
  if (_universityRegionContacts is EqualUnmodifiableListView) return _universityRegionContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _eatingDisorderContacts;
@override List<String>? get eatingDisorderContacts {
  final value = _eatingDisorderContacts;
  if (value == null) return null;
  if (_eatingDisorderContacts is EqualUnmodifiableListView) return _eatingDisorderContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CountryContacts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryContactsCopyWith<_CountryContacts> get copyWith => __$CountryContactsCopyWithImpl<_CountryContacts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryContactsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryContacts&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other._phoneContacts, _phoneContacts)&&const DeepCollectionEquality().equals(other._crisisCenterContacts, _crisisCenterContacts)&&const DeepCollectionEquality().equals(other._chatContacts, _chatContacts)&&const DeepCollectionEquality().equals(other._universityRegionContacts, _universityRegionContacts)&&const DeepCollectionEquality().equals(other._eatingDisorderContacts, _eatingDisorderContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,languageCode,const DeepCollectionEquality().hash(_phoneContacts),const DeepCollectionEquality().hash(_crisisCenterContacts),const DeepCollectionEquality().hash(_chatContacts),const DeepCollectionEquality().hash(_universityRegionContacts),const DeepCollectionEquality().hash(_eatingDisorderContacts));

@override
String toString() {
  return 'CountryContacts(languageCode: $languageCode, phoneContacts: $phoneContacts, crisisCenterContacts: $crisisCenterContacts, chatContacts: $chatContacts, universityRegionContacts: $universityRegionContacts, eatingDisorderContacts: $eatingDisorderContacts)';
}


}

/// @nodoc
abstract mixin class _$CountryContactsCopyWith<$Res> implements $CountryContactsCopyWith<$Res> {
  factory _$CountryContactsCopyWith(_CountryContacts value, $Res Function(_CountryContacts) _then) = __$CountryContactsCopyWithImpl;
@override @useResult
$Res call({
 String languageCode, List<PhoneContact>? phoneContacts, List<RegionContact>? crisisCenterContacts, List<ChatContact>? chatContacts, List<RegionContact>? universityRegionContacts, List<String>? eatingDisorderContacts
});




}
/// @nodoc
class __$CountryContactsCopyWithImpl<$Res>
    implements _$CountryContactsCopyWith<$Res> {
  __$CountryContactsCopyWithImpl(this._self, this._then);

  final _CountryContacts _self;
  final $Res Function(_CountryContacts) _then;

/// Create a copy of CountryContacts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? languageCode = null,Object? phoneContacts = freezed,Object? crisisCenterContacts = freezed,Object? chatContacts = freezed,Object? universityRegionContacts = freezed,Object? eatingDisorderContacts = freezed,}) {
  return _then(_CountryContacts(
languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,phoneContacts: freezed == phoneContacts ? _self._phoneContacts : phoneContacts // ignore: cast_nullable_to_non_nullable
as List<PhoneContact>?,crisisCenterContacts: freezed == crisisCenterContacts ? _self._crisisCenterContacts : crisisCenterContacts // ignore: cast_nullable_to_non_nullable
as List<RegionContact>?,chatContacts: freezed == chatContacts ? _self._chatContacts : chatContacts // ignore: cast_nullable_to_non_nullable
as List<ChatContact>?,universityRegionContacts: freezed == universityRegionContacts ? _self._universityRegionContacts : universityRegionContacts // ignore: cast_nullable_to_non_nullable
as List<RegionContact>?,eatingDisorderContacts: freezed == eatingDisorderContacts ? _self._eatingDisorderContacts : eatingDisorderContacts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
