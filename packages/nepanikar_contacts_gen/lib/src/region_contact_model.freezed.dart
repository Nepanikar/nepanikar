// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegionContact _$RegionContactFromJson(Map<String, dynamic> json) {
  return _RegionContact.fromJson(json);
}

/// @nodoc
mixin _$RegionContact {
  String get region => throw _privateConstructorUsedError;
  List<RegionItemContact> get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionContactCopyWith<RegionContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionContactCopyWith<$Res> {
  factory $RegionContactCopyWith(
          RegionContact value, $Res Function(RegionContact) then) =
      _$RegionContactCopyWithImpl<$Res, RegionContact>;
  @useResult
  $Res call({String region, List<RegionItemContact> contacts});
}

/// @nodoc
class _$RegionContactCopyWithImpl<$Res, $Val extends RegionContact>
    implements $RegionContactCopyWith<$Res> {
  _$RegionContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<RegionItemContact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionContactCopyWith<$Res>
    implements $RegionContactCopyWith<$Res> {
  factory _$$_RegionContactCopyWith(
          _$_RegionContact value, $Res Function(_$_RegionContact) then) =
      __$$_RegionContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String region, List<RegionItemContact> contacts});
}

/// @nodoc
class __$$_RegionContactCopyWithImpl<$Res>
    extends _$RegionContactCopyWithImpl<$Res, _$_RegionContact>
    implements _$$_RegionContactCopyWith<$Res> {
  __$$_RegionContactCopyWithImpl(
      _$_RegionContact _value, $Res Function(_$_RegionContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? contacts = null,
  }) {
    return _then(_$_RegionContact(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<RegionItemContact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegionContact implements _RegionContact {
  const _$_RegionContact(
      {required this.region, required final List<RegionItemContact> contacts})
      : _contacts = contacts;

  factory _$_RegionContact.fromJson(Map<String, dynamic> json) =>
      _$$_RegionContactFromJson(json);

  @override
  final String region;
  final List<RegionItemContact> _contacts;
  @override
  List<RegionItemContact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'RegionContact(region: $region, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionContact &&
            (identical(other.region, region) || other.region == region) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, region, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionContactCopyWith<_$_RegionContact> get copyWith =>
      __$$_RegionContactCopyWithImpl<_$_RegionContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionContactToJson(
      this,
    );
  }
}

abstract class _RegionContact implements RegionContact {
  const factory _RegionContact(
      {required final String region,
      required final List<RegionItemContact> contacts}) = _$_RegionContact;

  factory _RegionContact.fromJson(Map<String, dynamic> json) =
      _$_RegionContact.fromJson;

  @override
  String get region;
  @override
  List<RegionItemContact> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_RegionContactCopyWith<_$_RegionContact> get copyWith =>
      throw _privateConstructorUsedError;
}

RegionItemContact _$RegionItemContactFromJson(Map<String, dynamic> json) {
  return _RegionItemContact.fromJson(json);
}

/// @nodoc
mixin _$RegionItemContact {
  String get name => throw _privateConstructorUsedError;
  List<String> get contactAddresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionItemContactCopyWith<RegionItemContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionItemContactCopyWith<$Res> {
  factory $RegionItemContactCopyWith(
          RegionItemContact value, $Res Function(RegionItemContact) then) =
      _$RegionItemContactCopyWithImpl<$Res, RegionItemContact>;
  @useResult
  $Res call({String name, List<String> contactAddresses});
}

/// @nodoc
class _$RegionItemContactCopyWithImpl<$Res, $Val extends RegionItemContact>
    implements $RegionItemContactCopyWith<$Res> {
  _$RegionItemContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactAddresses = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactAddresses: null == contactAddresses
          ? _value.contactAddresses
          : contactAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionItemContactCopyWith<$Res>
    implements $RegionItemContactCopyWith<$Res> {
  factory _$$_RegionItemContactCopyWith(_$_RegionItemContact value,
          $Res Function(_$_RegionItemContact) then) =
      __$$_RegionItemContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> contactAddresses});
}

/// @nodoc
class __$$_RegionItemContactCopyWithImpl<$Res>
    extends _$RegionItemContactCopyWithImpl<$Res, _$_RegionItemContact>
    implements _$$_RegionItemContactCopyWith<$Res> {
  __$$_RegionItemContactCopyWithImpl(
      _$_RegionItemContact _value, $Res Function(_$_RegionItemContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? contactAddresses = null,
  }) {
    return _then(_$_RegionItemContact(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contactAddresses: null == contactAddresses
          ? _value._contactAddresses
          : contactAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegionItemContact implements _RegionItemContact {
  const _$_RegionItemContact(
      {required this.name, required final List<String> contactAddresses})
      : _contactAddresses = contactAddresses;

  factory _$_RegionItemContact.fromJson(Map<String, dynamic> json) =>
      _$$_RegionItemContactFromJson(json);

  @override
  final String name;
  final List<String> _contactAddresses;
  @override
  List<String> get contactAddresses {
    if (_contactAddresses is EqualUnmodifiableListView)
      return _contactAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contactAddresses);
  }

  @override
  String toString() {
    return 'RegionItemContact(name: $name, contactAddresses: $contactAddresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionItemContact &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._contactAddresses, _contactAddresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_contactAddresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionItemContactCopyWith<_$_RegionItemContact> get copyWith =>
      __$$_RegionItemContactCopyWithImpl<_$_RegionItemContact>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionItemContactToJson(
      this,
    );
  }
}

abstract class _RegionItemContact implements RegionItemContact {
  const factory _RegionItemContact(
      {required final String name,
      required final List<String> contactAddresses}) = _$_RegionItemContact;

  factory _RegionItemContact.fromJson(Map<String, dynamic> json) =
      _$_RegionItemContact.fromJson;

  @override
  String get name;
  @override
  List<String> get contactAddresses;
  @override
  @JsonKey(ignore: true)
  _$$_RegionItemContactCopyWith<_$_RegionItemContact> get copyWith =>
      throw _privateConstructorUsedError;
}
