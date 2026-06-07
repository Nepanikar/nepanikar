// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_contacts_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyContactRecord {

 String get name; String get contactAddress;
/// Create a copy of MyContactRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyContactRecordCopyWith<MyContactRecord> get copyWith => _$MyContactRecordCopyWithImpl<MyContactRecord>(this as MyContactRecord, _$identity);

  /// Serializes this MyContactRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyContactRecord&&(identical(other.name, name) || other.name == name)&&(identical(other.contactAddress, contactAddress) || other.contactAddress == contactAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,contactAddress);

@override
String toString() {
  return 'MyContactRecord(name: $name, contactAddress: $contactAddress)';
}


}

/// @nodoc
abstract mixin class $MyContactRecordCopyWith<$Res>  {
  factory $MyContactRecordCopyWith(MyContactRecord value, $Res Function(MyContactRecord) _then) = _$MyContactRecordCopyWithImpl;
@useResult
$Res call({
 String name, String contactAddress
});




}
/// @nodoc
class _$MyContactRecordCopyWithImpl<$Res>
    implements $MyContactRecordCopyWith<$Res> {
  _$MyContactRecordCopyWithImpl(this._self, this._then);

  final MyContactRecord _self;
  final $Res Function(MyContactRecord) _then;

/// Create a copy of MyContactRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? contactAddress = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactAddress: null == contactAddress ? _self.contactAddress : contactAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyContactRecord].
extension MyContactRecordPatterns on MyContactRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyContactRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyContactRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyContactRecord value)  $default,){
final _that = this;
switch (_that) {
case _MyContactRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyContactRecord value)?  $default,){
final _that = this;
switch (_that) {
case _MyContactRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String contactAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyContactRecord() when $default != null:
return $default(_that.name,_that.contactAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String contactAddress)  $default,) {final _that = this;
switch (_that) {
case _MyContactRecord():
return $default(_that.name,_that.contactAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String contactAddress)?  $default,) {final _that = this;
switch (_that) {
case _MyContactRecord() when $default != null:
return $default(_that.name,_that.contactAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyContactRecord extends MyContactRecord {
  const _MyContactRecord({required this.name, required this.contactAddress}): super._();
  factory _MyContactRecord.fromJson(Map<String, dynamic> json) => _$MyContactRecordFromJson(json);

@override final  String name;
@override final  String contactAddress;

/// Create a copy of MyContactRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyContactRecordCopyWith<_MyContactRecord> get copyWith => __$MyContactRecordCopyWithImpl<_MyContactRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyContactRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyContactRecord&&(identical(other.name, name) || other.name == name)&&(identical(other.contactAddress, contactAddress) || other.contactAddress == contactAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,contactAddress);

@override
String toString() {
  return 'MyContactRecord(name: $name, contactAddress: $contactAddress)';
}


}

/// @nodoc
abstract mixin class _$MyContactRecordCopyWith<$Res> implements $MyContactRecordCopyWith<$Res> {
  factory _$MyContactRecordCopyWith(_MyContactRecord value, $Res Function(_MyContactRecord) _then) = __$MyContactRecordCopyWithImpl;
@override @useResult
$Res call({
 String name, String contactAddress
});




}
/// @nodoc
class __$MyContactRecordCopyWithImpl<$Res>
    implements _$MyContactRecordCopyWith<$Res> {
  __$MyContactRecordCopyWithImpl(this._self, this._then);

  final _MyContactRecord _self;
  final $Res Function(_MyContactRecord) _then;

/// Create a copy of MyContactRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? contactAddress = null,}) {
  return _then(_MyContactRecord(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contactAddress: null == contactAddress ? _self.contactAddress : contactAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
