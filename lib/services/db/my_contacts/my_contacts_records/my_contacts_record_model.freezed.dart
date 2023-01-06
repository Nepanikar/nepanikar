// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_contacts_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyContactRecord _$MyContactRecordFromJson(Map<String, dynamic> json) {
  return _MyContactRecord.fromJson(json);
}

/// @nodoc
mixin _$MyContactRecord {
  String get name => throw _privateConstructorUsedError;
  String get contactAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyContactRecordCopyWith<MyContactRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyContactRecordCopyWith<$Res> {
  factory $MyContactRecordCopyWith(
          MyContactRecord value, $Res Function(MyContactRecord) then) =
      _$MyContactRecordCopyWithImpl<$Res, MyContactRecord>;
  @useResult
  $Res call({String name, String contactAddress});
}

/// @nodoc
class _$MyContactRecordCopyWithImpl<$Res, $Val extends MyContactRecord>
    implements $MyContactRecordCopyWith<$Res> {
  _$MyContactRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactAddress = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactAddress: null == contactAddress
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyContactRecordCopyWith<$Res>
    implements $MyContactRecordCopyWith<$Res> {
  factory _$$_MyContactRecordCopyWith(
          _$_MyContactRecord value, $Res Function(_$_MyContactRecord) then) =
      __$$_MyContactRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String contactAddress});
}

/// @nodoc
class __$$_MyContactRecordCopyWithImpl<$Res>
    extends _$MyContactRecordCopyWithImpl<$Res, _$_MyContactRecord>
    implements _$$_MyContactRecordCopyWith<$Res> {
  __$$_MyContactRecordCopyWithImpl(
      _$_MyContactRecord _value, $Res Function(_$_MyContactRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactAddress = null,
  }) {
    return _then(_$_MyContactRecord(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactAddress: null == contactAddress
          ? _value.contactAddress
          : contactAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyContactRecord extends _MyContactRecord {
  const _$_MyContactRecord({required this.name, required this.contactAddress})
      : super._();

  factory _$_MyContactRecord.fromJson(Map<String, dynamic> json) =>
      _$$_MyContactRecordFromJson(json);

  @override
  final String name;
  @override
  final String contactAddress;

  @override
  String toString() {
    return 'MyContactRecord(name: $name, contactAddress: $contactAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyContactRecord &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contactAddress, contactAddress) ||
                other.contactAddress == contactAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, contactAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyContactRecordCopyWith<_$_MyContactRecord> get copyWith =>
      __$$_MyContactRecordCopyWithImpl<_$_MyContactRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyContactRecordToJson(
      this,
    );
  }
}

abstract class _MyContactRecord extends MyContactRecord {
  const factory _MyContactRecord(
      {required final String name,
      required final String contactAddress}) = _$_MyContactRecord;
  const _MyContactRecord._() : super._();

  factory _MyContactRecord.fromJson(Map<String, dynamic> json) =
      _$_MyContactRecord.fromJson;

  @override
  String get name;
  @override
  String get contactAddress;
  @override
  @JsonKey(ignore: true)
  _$$_MyContactRecordCopyWith<_$_MyContactRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
