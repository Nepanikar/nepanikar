// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryRecord {

// ignore: invalid_annotation_target
@JsonKey(name: FilterKeys.dateWithTime) DateTime get dateTime; String get title; String get text;
/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryRecordCopyWith<DiaryRecord> get copyWith => _$DiaryRecordCopyWithImpl<DiaryRecord>(this as DiaryRecord, _$identity);

  /// Serializes this DiaryRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,title,text);

@override
String toString() {
  return 'DiaryRecord(dateTime: $dateTime, title: $title, text: $text)';
}


}

/// @nodoc
abstract mixin class $DiaryRecordCopyWith<$Res>  {
  factory $DiaryRecordCopyWith(DiaryRecord value, $Res Function(DiaryRecord) _then) = _$DiaryRecordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, String title, String text
});




}
/// @nodoc
class _$DiaryRecordCopyWithImpl<$Res>
    implements $DiaryRecordCopyWith<$Res> {
  _$DiaryRecordCopyWithImpl(this._self, this._then);

  final DiaryRecord _self;
  final $Res Function(DiaryRecord) _then;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,Object? title = null,Object? text = null,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryRecord].
extension DiaryRecordPatterns on DiaryRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryRecord value)  $default,){
final _that = this;
switch (_that) {
case _DiaryRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryRecord value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  String title,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that.dateTime,_that.title,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  String title,  String text)  $default,) {final _that = this;
switch (_that) {
case _DiaryRecord():
return $default(_that.dateTime,_that.title,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  String title,  String text)?  $default,) {final _that = this;
switch (_that) {
case _DiaryRecord() when $default != null:
return $default(_that.dateTime,_that.title,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiaryRecord extends DiaryRecord {
  const _DiaryRecord({@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime, required this.title, required this.text}): super._();
  factory _DiaryRecord.fromJson(Map<String, dynamic> json) => _$DiaryRecordFromJson(json);

// ignore: invalid_annotation_target
@override@JsonKey(name: FilterKeys.dateWithTime) final  DateTime dateTime;
@override final  String title;
@override final  String text;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryRecordCopyWith<_DiaryRecord> get copyWith => __$DiaryRecordCopyWithImpl<_DiaryRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaryRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,title,text);

@override
String toString() {
  return 'DiaryRecord(dateTime: $dateTime, title: $title, text: $text)';
}


}

/// @nodoc
abstract mixin class _$DiaryRecordCopyWith<$Res> implements $DiaryRecordCopyWith<$Res> {
  factory _$DiaryRecordCopyWith(_DiaryRecord value, $Res Function(_DiaryRecord) _then) = __$DiaryRecordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, String title, String text
});




}
/// @nodoc
class __$DiaryRecordCopyWithImpl<$Res>
    implements _$DiaryRecordCopyWith<$Res> {
  __$DiaryRecordCopyWithImpl(this._self, this._then);

  final _DiaryRecord _self;
  final $Res Function(_DiaryRecord) _then;

/// Create a copy of DiaryRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,Object? title = null,Object? text = null,}) {
  return _then(_DiaryRecord(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
