// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PhoneContact _$PhoneContactFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'default':
          return PhoneContactSingle.fromJson(
            json
          );
                case 'subList':
          return PhoneContactSubList.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'PhoneContact',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$PhoneContact {

 String get title; String? get subtitle;
/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneContactCopyWith<PhoneContact> get copyWith => _$PhoneContactCopyWithImpl<PhoneContact>(this as PhoneContact, _$identity);

  /// Serializes this PhoneContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneContact&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle);

@override
String toString() {
  return 'PhoneContact(title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $PhoneContactCopyWith<$Res>  {
  factory $PhoneContactCopyWith(PhoneContact value, $Res Function(PhoneContact) _then) = _$PhoneContactCopyWithImpl;
@useResult
$Res call({
 String title, String? subtitle
});




}
/// @nodoc
class _$PhoneContactCopyWithImpl<$Res>
    implements $PhoneContactCopyWith<$Res> {
  _$PhoneContactCopyWithImpl(this._self, this._then);

  final PhoneContact _self;
  final $Res Function(PhoneContact) _then;

/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneContact].
extension PhoneContactPatterns on PhoneContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( PhoneContactSingle value)?  $default,{TResult Function( PhoneContactSubList value)?  subList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PhoneContactSingle() when $default != null:
return $default(_that);case PhoneContactSubList() when subList != null:
return subList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( PhoneContactSingle value)  $default,{required TResult Function( PhoneContactSubList value)  subList,}){
final _that = this;
switch (_that) {
case PhoneContactSingle():
return $default(_that);case PhoneContactSubList():
return subList(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( PhoneContactSingle value)?  $default,{TResult? Function( PhoneContactSubList value)?  subList,}){
final _that = this;
switch (_that) {
case PhoneContactSingle() when $default != null:
return $default(_that);case PhoneContactSubList() when subList != null:
return subList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool pinned,  String title,  String tel,  String? subtitle)?  $default,{TResult Function( String title,  String? subtitle,  List<SubPhoneContact> subPhoneContacts)?  subList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PhoneContactSingle() when $default != null:
return $default(_that.pinned,_that.title,_that.tel,_that.subtitle);case PhoneContactSubList() when subList != null:
return subList(_that.title,_that.subtitle,_that.subPhoneContacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool pinned,  String title,  String tel,  String? subtitle)  $default,{required TResult Function( String title,  String? subtitle,  List<SubPhoneContact> subPhoneContacts)  subList,}) {final _that = this;
switch (_that) {
case PhoneContactSingle():
return $default(_that.pinned,_that.title,_that.tel,_that.subtitle);case PhoneContactSubList():
return subList(_that.title,_that.subtitle,_that.subPhoneContacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool pinned,  String title,  String tel,  String? subtitle)?  $default,{TResult? Function( String title,  String? subtitle,  List<SubPhoneContact> subPhoneContacts)?  subList,}) {final _that = this;
switch (_that) {
case PhoneContactSingle() when $default != null:
return $default(_that.pinned,_that.title,_that.tel,_that.subtitle);case PhoneContactSubList() when subList != null:
return subList(_that.title,_that.subtitle,_that.subPhoneContacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PhoneContactSingle extends PhoneContact {
  const PhoneContactSingle({this.pinned = false, required this.title, required this.tel, this.subtitle, final  String? $type}): $type = $type ?? 'default',super._();
  factory PhoneContactSingle.fromJson(Map<String, dynamic> json) => _$PhoneContactSingleFromJson(json);

@JsonKey() final  bool pinned;
@override final  String title;
 final  String tel;
@override final  String? subtitle;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneContactSingleCopyWith<PhoneContactSingle> get copyWith => _$PhoneContactSingleCopyWithImpl<PhoneContactSingle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneContactSingleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneContactSingle&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.title, title) || other.title == title)&&(identical(other.tel, tel) || other.tel == tel)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pinned,title,tel,subtitle);

@override
String toString() {
  return 'PhoneContact(pinned: $pinned, title: $title, tel: $tel, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $PhoneContactSingleCopyWith<$Res> implements $PhoneContactCopyWith<$Res> {
  factory $PhoneContactSingleCopyWith(PhoneContactSingle value, $Res Function(PhoneContactSingle) _then) = _$PhoneContactSingleCopyWithImpl;
@override @useResult
$Res call({
 bool pinned, String title, String tel, String? subtitle
});




}
/// @nodoc
class _$PhoneContactSingleCopyWithImpl<$Res>
    implements $PhoneContactSingleCopyWith<$Res> {
  _$PhoneContactSingleCopyWithImpl(this._self, this._then);

  final PhoneContactSingle _self;
  final $Res Function(PhoneContactSingle) _then;

/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pinned = null,Object? title = null,Object? tel = null,Object? subtitle = freezed,}) {
  return _then(PhoneContactSingle(
pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tel: null == tel ? _self.tel : tel // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PhoneContactSubList extends PhoneContact {
  const PhoneContactSubList({required this.title, this.subtitle, required final  List<SubPhoneContact> subPhoneContacts, final  String? $type}): _subPhoneContacts = subPhoneContacts,$type = $type ?? 'subList',super._();
  factory PhoneContactSubList.fromJson(Map<String, dynamic> json) => _$PhoneContactSubListFromJson(json);

@override final  String title;
@override final  String? subtitle;
 final  List<SubPhoneContact> _subPhoneContacts;
 List<SubPhoneContact> get subPhoneContacts {
  if (_subPhoneContacts is EqualUnmodifiableListView) return _subPhoneContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subPhoneContacts);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneContactSubListCopyWith<PhoneContactSubList> get copyWith => _$PhoneContactSubListCopyWithImpl<PhoneContactSubList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneContactSubListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneContactSubList&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._subPhoneContacts, _subPhoneContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(_subPhoneContacts));

@override
String toString() {
  return 'PhoneContact.subList(title: $title, subtitle: $subtitle, subPhoneContacts: $subPhoneContacts)';
}


}

/// @nodoc
abstract mixin class $PhoneContactSubListCopyWith<$Res> implements $PhoneContactCopyWith<$Res> {
  factory $PhoneContactSubListCopyWith(PhoneContactSubList value, $Res Function(PhoneContactSubList) _then) = _$PhoneContactSubListCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, List<SubPhoneContact> subPhoneContacts
});




}
/// @nodoc
class _$PhoneContactSubListCopyWithImpl<$Res>
    implements $PhoneContactSubListCopyWith<$Res> {
  _$PhoneContactSubListCopyWithImpl(this._self, this._then);

  final PhoneContactSubList _self;
  final $Res Function(PhoneContactSubList) _then;

/// Create a copy of PhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? subPhoneContacts = null,}) {
  return _then(PhoneContactSubList(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,subPhoneContacts: null == subPhoneContacts ? _self._subPhoneContacts : subPhoneContacts // ignore: cast_nullable_to_non_nullable
as List<SubPhoneContact>,
  ));
}


}


/// @nodoc
mixin _$SubPhoneContact {

 String get title; String get tel;
/// Create a copy of SubPhoneContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubPhoneContactCopyWith<SubPhoneContact> get copyWith => _$SubPhoneContactCopyWithImpl<SubPhoneContact>(this as SubPhoneContact, _$identity);

  /// Serializes this SubPhoneContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubPhoneContact&&(identical(other.title, title) || other.title == title)&&(identical(other.tel, tel) || other.tel == tel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tel);

@override
String toString() {
  return 'SubPhoneContact(title: $title, tel: $tel)';
}


}

/// @nodoc
abstract mixin class $SubPhoneContactCopyWith<$Res>  {
  factory $SubPhoneContactCopyWith(SubPhoneContact value, $Res Function(SubPhoneContact) _then) = _$SubPhoneContactCopyWithImpl;
@useResult
$Res call({
 String title, String tel
});




}
/// @nodoc
class _$SubPhoneContactCopyWithImpl<$Res>
    implements $SubPhoneContactCopyWith<$Res> {
  _$SubPhoneContactCopyWithImpl(this._self, this._then);

  final SubPhoneContact _self;
  final $Res Function(SubPhoneContact) _then;

/// Create a copy of SubPhoneContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? tel = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tel: null == tel ? _self.tel : tel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubPhoneContact].
extension SubPhoneContactPatterns on SubPhoneContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubPhoneContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubPhoneContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubPhoneContact value)  $default,){
final _that = this;
switch (_that) {
case _SubPhoneContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubPhoneContact value)?  $default,){
final _that = this;
switch (_that) {
case _SubPhoneContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String tel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubPhoneContact() when $default != null:
return $default(_that.title,_that.tel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String tel)  $default,) {final _that = this;
switch (_that) {
case _SubPhoneContact():
return $default(_that.title,_that.tel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String tel)?  $default,) {final _that = this;
switch (_that) {
case _SubPhoneContact() when $default != null:
return $default(_that.title,_that.tel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubPhoneContact extends SubPhoneContact {
  const _SubPhoneContact({required this.title, required this.tel}): super._();
  factory _SubPhoneContact.fromJson(Map<String, dynamic> json) => _$SubPhoneContactFromJson(json);

@override final  String title;
@override final  String tel;

/// Create a copy of SubPhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubPhoneContactCopyWith<_SubPhoneContact> get copyWith => __$SubPhoneContactCopyWithImpl<_SubPhoneContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubPhoneContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubPhoneContact&&(identical(other.title, title) || other.title == title)&&(identical(other.tel, tel) || other.tel == tel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,tel);

@override
String toString() {
  return 'SubPhoneContact(title: $title, tel: $tel)';
}


}

/// @nodoc
abstract mixin class _$SubPhoneContactCopyWith<$Res> implements $SubPhoneContactCopyWith<$Res> {
  factory _$SubPhoneContactCopyWith(_SubPhoneContact value, $Res Function(_SubPhoneContact) _then) = __$SubPhoneContactCopyWithImpl;
@override @useResult
$Res call({
 String title, String tel
});




}
/// @nodoc
class __$SubPhoneContactCopyWithImpl<$Res>
    implements _$SubPhoneContactCopyWith<$Res> {
  __$SubPhoneContactCopyWithImpl(this._self, this._then);

  final _SubPhoneContact _self;
  final $Res Function(_SubPhoneContact) _then;

/// Create a copy of SubPhoneContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? tel = null,}) {
  return _then(_SubPhoneContact(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tel: null == tel ? _self.tel : tel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
