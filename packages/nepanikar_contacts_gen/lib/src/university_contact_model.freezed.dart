// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'university_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UniversityRegionContact _$UniversityRegionContactFromJson(
    Map<String, dynamic> json) {
  return _UniversityRegionContact.fromJson(json);
}

/// @nodoc
mixin _$UniversityRegionContact {
  String get region => throw _privateConstructorUsedError;
  List<UniversityContact> get universities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniversityRegionContactCopyWith<UniversityRegionContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityRegionContactCopyWith<$Res> {
  factory $UniversityRegionContactCopyWith(UniversityRegionContact value,
          $Res Function(UniversityRegionContact) then) =
      _$UniversityRegionContactCopyWithImpl<$Res, UniversityRegionContact>;
  @useResult
  $Res call({String region, List<UniversityContact> universities});
}

/// @nodoc
class _$UniversityRegionContactCopyWithImpl<$Res,
        $Val extends UniversityRegionContact>
    implements $UniversityRegionContactCopyWith<$Res> {
  _$UniversityRegionContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? universities = null,
  }) {
    return _then(_value.copyWith(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      universities: null == universities
          ? _value.universities
          : universities // ignore: cast_nullable_to_non_nullable
              as List<UniversityContact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UniversityRegionContactCopyWith<$Res>
    implements $UniversityRegionContactCopyWith<$Res> {
  factory _$$_UniversityRegionContactCopyWith(_$_UniversityRegionContact value,
          $Res Function(_$_UniversityRegionContact) then) =
      __$$_UniversityRegionContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String region, List<UniversityContact> universities});
}

/// @nodoc
class __$$_UniversityRegionContactCopyWithImpl<$Res>
    extends _$UniversityRegionContactCopyWithImpl<$Res,
        _$_UniversityRegionContact>
    implements _$$_UniversityRegionContactCopyWith<$Res> {
  __$$_UniversityRegionContactCopyWithImpl(_$_UniversityRegionContact _value,
      $Res Function(_$_UniversityRegionContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? universities = null,
  }) {
    return _then(_$_UniversityRegionContact(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      universities: null == universities
          ? _value._universities
          : universities // ignore: cast_nullable_to_non_nullable
              as List<UniversityContact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UniversityRegionContact implements _UniversityRegionContact {
  const _$_UniversityRegionContact(
      {required this.region,
      required final List<UniversityContact> universities})
      : _universities = universities;

  factory _$_UniversityRegionContact.fromJson(Map<String, dynamic> json) =>
      _$$_UniversityRegionContactFromJson(json);

  @override
  final String region;
  final List<UniversityContact> _universities;
  @override
  List<UniversityContact> get universities {
    if (_universities is EqualUnmodifiableListView) return _universities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_universities);
  }

  @override
  String toString() {
    return 'UniversityRegionContact(region: $region, universities: $universities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversityRegionContact &&
            (identical(other.region, region) || other.region == region) &&
            const DeepCollectionEquality()
                .equals(other._universities, _universities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, region, const DeepCollectionEquality().hash(_universities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UniversityRegionContactCopyWith<_$_UniversityRegionContact>
      get copyWith =>
          __$$_UniversityRegionContactCopyWithImpl<_$_UniversityRegionContact>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UniversityRegionContactToJson(
      this,
    );
  }
}

abstract class _UniversityRegionContact implements UniversityRegionContact {
  const factory _UniversityRegionContact(
          {required final String region,
          required final List<UniversityContact> universities}) =
      _$_UniversityRegionContact;

  factory _UniversityRegionContact.fromJson(Map<String, dynamic> json) =
      _$_UniversityRegionContact.fromJson;

  @override
  String get region;
  @override
  List<UniversityContact> get universities;
  @override
  @JsonKey(ignore: true)
  _$$_UniversityRegionContactCopyWith<_$_UniversityRegionContact>
      get copyWith => throw _privateConstructorUsedError;
}

UniversityContact _$UniversityContactFromJson(Map<String, dynamic> json) {
  return _UniversityContact.fromJson(json);
}

/// @nodoc
mixin _$UniversityContact {
  String get name => throw _privateConstructorUsedError;
  List<String> get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniversityContactCopyWith<UniversityContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityContactCopyWith<$Res> {
  factory $UniversityContactCopyWith(
          UniversityContact value, $Res Function(UniversityContact) then) =
      _$UniversityContactCopyWithImpl<$Res, UniversityContact>;
  @useResult
  $Res call({String name, List<String> contacts});
}

/// @nodoc
class _$UniversityContactCopyWithImpl<$Res, $Val extends UniversityContact>
    implements $UniversityContactCopyWith<$Res> {
  _$UniversityContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UniversityContactCopyWith<$Res>
    implements $UniversityContactCopyWith<$Res> {
  factory _$$_UniversityContactCopyWith(_$_UniversityContact value,
          $Res Function(_$_UniversityContact) then) =
      __$$_UniversityContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> contacts});
}

/// @nodoc
class __$$_UniversityContactCopyWithImpl<$Res>
    extends _$UniversityContactCopyWithImpl<$Res, _$_UniversityContact>
    implements _$$_UniversityContactCopyWith<$Res> {
  __$$_UniversityContactCopyWithImpl(
      _$_UniversityContact _value, $Res Function(_$_UniversityContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contacts = null,
  }) {
    return _then(_$_UniversityContact(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UniversityContact implements _UniversityContact {
  const _$_UniversityContact(
      {required this.name, required final List<String> contacts})
      : _contacts = contacts;

  factory _$_UniversityContact.fromJson(Map<String, dynamic> json) =>
      _$$_UniversityContactFromJson(json);

  @override
  final String name;
  final List<String> _contacts;
  @override
  List<String> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'UniversityContact(name: $name, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversityContact &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UniversityContactCopyWith<_$_UniversityContact> get copyWith =>
      __$$_UniversityContactCopyWithImpl<_$_UniversityContact>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UniversityContactToJson(
      this,
    );
  }
}

abstract class _UniversityContact implements UniversityContact {
  const factory _UniversityContact(
      {required final String name,
      required final List<String> contacts}) = _$_UniversityContact;

  factory _UniversityContact.fromJson(Map<String, dynamic> json) =
      _$_UniversityContact.fromJson;

  @override
  String get name;
  @override
  List<String> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_UniversityContactCopyWith<_$_UniversityContact> get copyWith =>
      throw _privateConstructorUsedError;
}
