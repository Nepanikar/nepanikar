// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegionContact {

 String get region; List<RegionItemContact> get contacts;
/// Create a copy of RegionContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionContactCopyWith<RegionContact> get copyWith => _$RegionContactCopyWithImpl<RegionContact>(this as RegionContact, _$identity);

  /// Serializes this RegionContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionContact&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other.contacts, contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,const DeepCollectionEquality().hash(contacts));

@override
String toString() {
  return 'RegionContact(region: $region, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class $RegionContactCopyWith<$Res>  {
  factory $RegionContactCopyWith(RegionContact value, $Res Function(RegionContact) _then) = _$RegionContactCopyWithImpl;
@useResult
$Res call({
 String region, List<RegionItemContact> contacts
});




}
/// @nodoc
class _$RegionContactCopyWithImpl<$Res>
    implements $RegionContactCopyWith<$Res> {
  _$RegionContactCopyWithImpl(this._self, this._then);

  final RegionContact _self;
  final $Res Function(RegionContact) _then;

/// Create a copy of RegionContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? contacts = null,}) {
  return _then(_self.copyWith(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<RegionItemContact>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegionContact].
extension RegionContactPatterns on RegionContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegionContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegionContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegionContact value)  $default,){
final _that = this;
switch (_that) {
case _RegionContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegionContact value)?  $default,){
final _that = this;
switch (_that) {
case _RegionContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  List<RegionItemContact> contacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegionContact() when $default != null:
return $default(_that.region,_that.contacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  List<RegionItemContact> contacts)  $default,) {final _that = this;
switch (_that) {
case _RegionContact():
return $default(_that.region,_that.contacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  List<RegionItemContact> contacts)?  $default,) {final _that = this;
switch (_that) {
case _RegionContact() when $default != null:
return $default(_that.region,_that.contacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegionContact implements RegionContact {
  const _RegionContact({required this.region, required final  List<RegionItemContact> contacts}): _contacts = contacts;
  factory _RegionContact.fromJson(Map<String, dynamic> json) => _$RegionContactFromJson(json);

@override final  String region;
 final  List<RegionItemContact> _contacts;
@override List<RegionItemContact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}


/// Create a copy of RegionContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionContactCopyWith<_RegionContact> get copyWith => __$RegionContactCopyWithImpl<_RegionContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegionContact&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other._contacts, _contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,region,const DeepCollectionEquality().hash(_contacts));

@override
String toString() {
  return 'RegionContact(region: $region, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$RegionContactCopyWith<$Res> implements $RegionContactCopyWith<$Res> {
  factory _$RegionContactCopyWith(_RegionContact value, $Res Function(_RegionContact) _then) = __$RegionContactCopyWithImpl;
@override @useResult
$Res call({
 String region, List<RegionItemContact> contacts
});




}
/// @nodoc
class __$RegionContactCopyWithImpl<$Res>
    implements _$RegionContactCopyWith<$Res> {
  __$RegionContactCopyWithImpl(this._self, this._then);

  final _RegionContact _self;
  final $Res Function(_RegionContact) _then;

/// Create a copy of RegionContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? contacts = null,}) {
  return _then(_RegionContact(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<RegionItemContact>,
  ));
}


}


/// @nodoc
mixin _$RegionItemContact {

 String get name; List<String> get contactAddresses;
/// Create a copy of RegionItemContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionItemContactCopyWith<RegionItemContact> get copyWith => _$RegionItemContactCopyWithImpl<RegionItemContact>(this as RegionItemContact, _$identity);

  /// Serializes this RegionItemContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionItemContact&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.contactAddresses, contactAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(contactAddresses));

@override
String toString() {
  return 'RegionItemContact(name: $name, contactAddresses: $contactAddresses)';
}


}

/// @nodoc
abstract mixin class $RegionItemContactCopyWith<$Res>  {
  factory $RegionItemContactCopyWith(RegionItemContact value, $Res Function(RegionItemContact) _then) = _$RegionItemContactCopyWithImpl;
@useResult
$Res call({
 String name, List<String> contactAddresses
});




}
/// @nodoc
class _$RegionItemContactCopyWithImpl<$Res>
    implements $RegionItemContactCopyWith<$Res> {
  _$RegionItemContactCopyWithImpl(this._self, this._then);

  final RegionItemContact _self;
  final $Res Function(RegionItemContact) _then;

/// Create a copy of RegionItemContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? contactAddresses = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactAddresses: null == contactAddresses ? _self.contactAddresses : contactAddresses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegionItemContact].
extension RegionItemContactPatterns on RegionItemContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegionItemContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegionItemContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegionItemContact value)  $default,){
final _that = this;
switch (_that) {
case _RegionItemContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegionItemContact value)?  $default,){
final _that = this;
switch (_that) {
case _RegionItemContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> contactAddresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegionItemContact() when $default != null:
return $default(_that.name,_that.contactAddresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> contactAddresses)  $default,) {final _that = this;
switch (_that) {
case _RegionItemContact():
return $default(_that.name,_that.contactAddresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> contactAddresses)?  $default,) {final _that = this;
switch (_that) {
case _RegionItemContact() when $default != null:
return $default(_that.name,_that.contactAddresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegionItemContact implements RegionItemContact {
  const _RegionItemContact({required this.name, required final  List<String> contactAddresses}): _contactAddresses = contactAddresses;
  factory _RegionItemContact.fromJson(Map<String, dynamic> json) => _$RegionItemContactFromJson(json);

@override final  String name;
 final  List<String> _contactAddresses;
@override List<String> get contactAddresses {
  if (_contactAddresses is EqualUnmodifiableListView) return _contactAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contactAddresses);
}


/// Create a copy of RegionItemContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionItemContactCopyWith<_RegionItemContact> get copyWith => __$RegionItemContactCopyWithImpl<_RegionItemContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionItemContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegionItemContact&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._contactAddresses, _contactAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_contactAddresses));

@override
String toString() {
  return 'RegionItemContact(name: $name, contactAddresses: $contactAddresses)';
}


}

/// @nodoc
abstract mixin class _$RegionItemContactCopyWith<$Res> implements $RegionItemContactCopyWith<$Res> {
  factory _$RegionItemContactCopyWith(_RegionItemContact value, $Res Function(_RegionItemContact) _then) = __$RegionItemContactCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> contactAddresses
});




}
/// @nodoc
class __$RegionItemContactCopyWithImpl<$Res>
    implements _$RegionItemContactCopyWith<$Res> {
  __$RegionItemContactCopyWithImpl(this._self, this._then);

  final _RegionItemContact _self;
  final $Res Function(_RegionItemContact) _then;

/// Create a copy of RegionItemContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? contactAddresses = null,}) {
  return _then(_RegionItemContact(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactAddresses: null == contactAddresses ? _self._contactAddresses : contactAddresses // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
