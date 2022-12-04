// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_contacts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllContacts _$AllContactsFromJson(Map<String, dynamic> json) {
  return _AllContacts.fromJson(json);
}

/// @nodoc
mixin _$AllContacts {
  List<CountryContacts> get countryContacts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllContactsCopyWith<AllContacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllContactsCopyWith<$Res> {
  factory $AllContactsCopyWith(
          AllContacts value, $Res Function(AllContacts) then) =
      _$AllContactsCopyWithImpl<$Res, AllContacts>;
  @useResult
  $Res call({List<CountryContacts> countryContacts});
}

/// @nodoc
class _$AllContactsCopyWithImpl<$Res, $Val extends AllContacts>
    implements $AllContactsCopyWith<$Res> {
  _$AllContactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryContacts = null,
  }) {
    return _then(_value.copyWith(
      countryContacts: null == countryContacts
          ? _value.countryContacts
          : countryContacts // ignore: cast_nullable_to_non_nullable
              as List<CountryContacts>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllContactsCopyWith<$Res>
    implements $AllContactsCopyWith<$Res> {
  factory _$$_AllContactsCopyWith(
          _$_AllContacts value, $Res Function(_$_AllContacts) then) =
      __$$_AllContactsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CountryContacts> countryContacts});
}

/// @nodoc
class __$$_AllContactsCopyWithImpl<$Res>
    extends _$AllContactsCopyWithImpl<$Res, _$_AllContacts>
    implements _$$_AllContactsCopyWith<$Res> {
  __$$_AllContactsCopyWithImpl(
      _$_AllContacts _value, $Res Function(_$_AllContacts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryContacts = null,
  }) {
    return _then(_$_AllContacts(
      countryContacts: null == countryContacts
          ? _value._countryContacts
          : countryContacts // ignore: cast_nullable_to_non_nullable
              as List<CountryContacts>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllContacts extends _AllContacts {
  const _$_AllContacts({required final List<CountryContacts> countryContacts})
      : _countryContacts = countryContacts,
        super._();

  factory _$_AllContacts.fromJson(Map<String, dynamic> json) =>
      _$$_AllContactsFromJson(json);

  final List<CountryContacts> _countryContacts;
  @override
  List<CountryContacts> get countryContacts {
    if (_countryContacts is EqualUnmodifiableListView) return _countryContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryContacts);
  }

  @override
  String toString() {
    return 'AllContacts(countryContacts: $countryContacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllContacts &&
            const DeepCollectionEquality()
                .equals(other._countryContacts, _countryContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_countryContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllContactsCopyWith<_$_AllContacts> get copyWith =>
      __$$_AllContactsCopyWithImpl<_$_AllContacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllContactsToJson(
      this,
    );
  }
}

abstract class _AllContacts extends AllContacts {
  const factory _AllContacts(
      {required final List<CountryContacts> countryContacts}) = _$_AllContacts;
  const _AllContacts._() : super._();

  factory _AllContacts.fromJson(Map<String, dynamic> json) =
      _$_AllContacts.fromJson;

  @override
  List<CountryContacts> get countryContacts;
  @override
  @JsonKey(ignore: true)
  _$$_AllContactsCopyWith<_$_AllContacts> get copyWith =>
      throw _privateConstructorUsedError;
}
