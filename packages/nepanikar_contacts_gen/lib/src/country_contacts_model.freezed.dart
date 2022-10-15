// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_contacts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryContacts _$CountryContactsFromJson(Map<String, dynamic> json) {
  return _CountryContacts.fromJson(json);
}

/// @nodoc
mixin _$CountryContacts {
  String get languageTag => throw _privateConstructorUsedError;
  List<PhoneContact>? get phoneContacts => throw _privateConstructorUsedError;
  List<CrisisCenterContact>? get crisisCenterContacts =>
      throw _privateConstructorUsedError;
  List<ChatContact>? get chatContacts => throw _privateConstructorUsedError;
  List<UniversityContact>? get universityContacts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryContactsCopyWith<CountryContacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryContactsCopyWith<$Res> {
  factory $CountryContactsCopyWith(
          CountryContacts value, $Res Function(CountryContacts) then) =
      _$CountryContactsCopyWithImpl<$Res, CountryContacts>;
  @useResult
  $Res call(
      {String languageTag,
      List<PhoneContact>? phoneContacts,
      List<CrisisCenterContact>? crisisCenterContacts,
      List<ChatContact>? chatContacts,
      List<UniversityContact>? universityContacts});
}

/// @nodoc
class _$CountryContactsCopyWithImpl<$Res, $Val extends CountryContacts>
    implements $CountryContactsCopyWith<$Res> {
  _$CountryContactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageTag = null,
    Object? phoneContacts = freezed,
    Object? crisisCenterContacts = freezed,
    Object? chatContacts = freezed,
    Object? universityContacts = freezed,
  }) {
    return _then(_value.copyWith(
      languageTag: null == languageTag
          ? _value.languageTag
          : languageTag // ignore: cast_nullable_to_non_nullable
              as String,
      phoneContacts: freezed == phoneContacts
          ? _value.phoneContacts
          : phoneContacts // ignore: cast_nullable_to_non_nullable
              as List<PhoneContact>?,
      crisisCenterContacts: freezed == crisisCenterContacts
          ? _value.crisisCenterContacts
          : crisisCenterContacts // ignore: cast_nullable_to_non_nullable
              as List<CrisisCenterContact>?,
      chatContacts: freezed == chatContacts
          ? _value.chatContacts
          : chatContacts // ignore: cast_nullable_to_non_nullable
              as List<ChatContact>?,
      universityContacts: freezed == universityContacts
          ? _value.universityContacts
          : universityContacts // ignore: cast_nullable_to_non_nullable
              as List<UniversityContact>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryContactsCopyWith<$Res>
    implements $CountryContactsCopyWith<$Res> {
  factory _$$_CountryContactsCopyWith(
          _$_CountryContacts value, $Res Function(_$_CountryContacts) then) =
      __$$_CountryContactsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String languageTag,
      List<PhoneContact>? phoneContacts,
      List<CrisisCenterContact>? crisisCenterContacts,
      List<ChatContact>? chatContacts,
      List<UniversityContact>? universityContacts});
}

/// @nodoc
class __$$_CountryContactsCopyWithImpl<$Res>
    extends _$CountryContactsCopyWithImpl<$Res, _$_CountryContacts>
    implements _$$_CountryContactsCopyWith<$Res> {
  __$$_CountryContactsCopyWithImpl(
      _$_CountryContacts _value, $Res Function(_$_CountryContacts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageTag = null,
    Object? phoneContacts = freezed,
    Object? crisisCenterContacts = freezed,
    Object? chatContacts = freezed,
    Object? universityContacts = freezed,
  }) {
    return _then(_$_CountryContacts(
      languageTag: null == languageTag
          ? _value.languageTag
          : languageTag // ignore: cast_nullable_to_non_nullable
              as String,
      phoneContacts: freezed == phoneContacts
          ? _value._phoneContacts
          : phoneContacts // ignore: cast_nullable_to_non_nullable
              as List<PhoneContact>?,
      crisisCenterContacts: freezed == crisisCenterContacts
          ? _value._crisisCenterContacts
          : crisisCenterContacts // ignore: cast_nullable_to_non_nullable
              as List<CrisisCenterContact>?,
      chatContacts: freezed == chatContacts
          ? _value._chatContacts
          : chatContacts // ignore: cast_nullable_to_non_nullable
              as List<ChatContact>?,
      universityContacts: freezed == universityContacts
          ? _value._universityContacts
          : universityContacts // ignore: cast_nullable_to_non_nullable
              as List<UniversityContact>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryContacts extends _CountryContacts {
  const _$_CountryContacts(
      {required this.languageTag,
      final List<PhoneContact>? phoneContacts,
      final List<CrisisCenterContact>? crisisCenterContacts,
      final List<ChatContact>? chatContacts,
      final List<UniversityContact>? universityContacts})
      : _phoneContacts = phoneContacts,
        _crisisCenterContacts = crisisCenterContacts,
        _chatContacts = chatContacts,
        _universityContacts = universityContacts,
        super._();

  factory _$_CountryContacts.fromJson(Map<String, dynamic> json) =>
      _$$_CountryContactsFromJson(json);

  @override
  final String languageTag;
  final List<PhoneContact>? _phoneContacts;
  @override
  List<PhoneContact>? get phoneContacts {
    final value = _phoneContacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CrisisCenterContact>? _crisisCenterContacts;
  @override
  List<CrisisCenterContact>? get crisisCenterContacts {
    final value = _crisisCenterContacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ChatContact>? _chatContacts;
  @override
  List<ChatContact>? get chatContacts {
    final value = _chatContacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UniversityContact>? _universityContacts;
  @override
  List<UniversityContact>? get universityContacts {
    final value = _universityContacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountryContacts(languageTag: $languageTag, phoneContacts: $phoneContacts, crisisCenterContacts: $crisisCenterContacts, chatContacts: $chatContacts, universityContacts: $universityContacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryContacts &&
            (identical(other.languageTag, languageTag) ||
                other.languageTag == languageTag) &&
            const DeepCollectionEquality()
                .equals(other._phoneContacts, _phoneContacts) &&
            const DeepCollectionEquality()
                .equals(other._crisisCenterContacts, _crisisCenterContacts) &&
            const DeepCollectionEquality()
                .equals(other._chatContacts, _chatContacts) &&
            const DeepCollectionEquality()
                .equals(other._universityContacts, _universityContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      languageTag,
      const DeepCollectionEquality().hash(_phoneContacts),
      const DeepCollectionEquality().hash(_crisisCenterContacts),
      const DeepCollectionEquality().hash(_chatContacts),
      const DeepCollectionEquality().hash(_universityContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryContactsCopyWith<_$_CountryContacts> get copyWith =>
      __$$_CountryContactsCopyWithImpl<_$_CountryContacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryContactsToJson(
      this,
    );
  }
}

abstract class _CountryContacts extends CountryContacts {
  const factory _CountryContacts(
      {required final String languageTag,
      final List<PhoneContact>? phoneContacts,
      final List<CrisisCenterContact>? crisisCenterContacts,
      final List<ChatContact>? chatContacts,
      final List<UniversityContact>? universityContacts}) = _$_CountryContacts;
  const _CountryContacts._() : super._();

  factory _CountryContacts.fromJson(Map<String, dynamic> json) =
      _$_CountryContacts.fromJson;

  @override
  String get languageTag;
  @override
  List<PhoneContact>? get phoneContacts;
  @override
  List<CrisisCenterContact>? get crisisCenterContacts;
  @override
  List<ChatContact>? get chatContacts;
  @override
  List<UniversityContact>? get universityContacts;
  @override
  @JsonKey(ignore: true)
  _$$_CountryContactsCopyWith<_$_CountryContacts> get copyWith =>
      throw _privateConstructorUsedError;
}
