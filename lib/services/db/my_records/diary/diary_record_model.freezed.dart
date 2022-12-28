// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diary_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryRecord _$DiaryRecordFromJson(Map<String, dynamic> json) {
  return _DiaryRecord.fromJson(json);
}

/// @nodoc
mixin _$DiaryRecord {
// ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryRecordCopyWith<DiaryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryRecordCopyWith<$Res> {
  factory $DiaryRecordCopyWith(
          DiaryRecord value, $Res Function(DiaryRecord) then) =
      _$DiaryRecordCopyWithImpl<$Res, DiaryRecord>;
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      String title,
      String text});
}

/// @nodoc
class _$DiaryRecordCopyWithImpl<$Res, $Val extends DiaryRecord>
    implements $DiaryRecordCopyWith<$Res> {
  _$DiaryRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiaryRecordCopyWith<$Res>
    implements $DiaryRecordCopyWith<$Res> {
  factory _$$_DiaryRecordCopyWith(
          _$_DiaryRecord value, $Res Function(_$_DiaryRecord) then) =
      __$$_DiaryRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      String title,
      String text});
}

/// @nodoc
class __$$_DiaryRecordCopyWithImpl<$Res>
    extends _$DiaryRecordCopyWithImpl<$Res, _$_DiaryRecord>
    implements _$$_DiaryRecordCopyWith<$Res> {
  __$$_DiaryRecordCopyWithImpl(
      _$_DiaryRecord _value, $Res Function(_$_DiaryRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? title = null,
    Object? text = null,
  }) {
    return _then(_$_DiaryRecord(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryRecord extends _DiaryRecord {
  const _$_DiaryRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime,
      required this.title,
      required this.text})
      : super._();

  factory _$_DiaryRecord.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryRecordFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: FilterKeys.dateWithTime)
  final DateTime dateTime;
  @override
  final String title;
  @override
  final String text;

  @override
  String toString() {
    return 'DiaryRecord(dateTime: $dateTime, title: $title, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryRecord &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, title, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryRecordCopyWith<_$_DiaryRecord> get copyWith =>
      __$$_DiaryRecordCopyWithImpl<_$_DiaryRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryRecordToJson(
      this,
    );
  }
}

abstract class _DiaryRecord extends DiaryRecord {
  const factory _DiaryRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required final DateTime dateTime,
      required final String title,
      required final String text}) = _$_DiaryRecord;
  const _DiaryRecord._() : super._();

  factory _DiaryRecord.fromJson(Map<String, dynamic> json) =
      _$_DiaryRecord.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime;
  @override
  String get title;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryRecordCopyWith<_$_DiaryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
