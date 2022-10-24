// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) {
  return _UserLanguage.fromJson(json);
}

/// @nodoc
mixin _$UserLanguage {
  String get languageCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLanguageCopyWith<UserLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLanguageCopyWith<$Res> {
  factory $UserLanguageCopyWith(
          UserLanguage value, $Res Function(UserLanguage) then) =
      _$UserLanguageCopyWithImpl<$Res>;
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class _$UserLanguageCopyWithImpl<$Res> implements $UserLanguageCopyWith<$Res> {
  _$UserLanguageCopyWithImpl(this._value, this._then);

  final UserLanguage _value;
  // ignore: unused_field
  final $Res Function(UserLanguage) _then;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserLanguageCopyWith<$Res>
    implements $UserLanguageCopyWith<$Res> {
  factory _$$_UserLanguageCopyWith(
          _$_UserLanguage value, $Res Function(_$_UserLanguage) then) =
      __$$_UserLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class __$$_UserLanguageCopyWithImpl<$Res>
    extends _$UserLanguageCopyWithImpl<$Res>
    implements _$$_UserLanguageCopyWith<$Res> {
  __$$_UserLanguageCopyWithImpl(
      _$_UserLanguage _value, $Res Function(_$_UserLanguage) _then)
      : super(_value, (v) => _then(v as _$_UserLanguage));

  @override
  _$_UserLanguage get _value => super._value as _$_UserLanguage;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_$_UserLanguage(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLanguage extends _UserLanguage {
  const _$_UserLanguage({required this.languageCode, required this.countryCode})
      : super._();

  factory _$_UserLanguage.fromJson(Map<String, dynamic> json) =>
      _$$_UserLanguageFromJson(json);

  @override
  final String languageCode;
  @override
  final String? countryCode;

  @override
  String toString() {
    return 'UserLanguage(languageCode: $languageCode, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLanguage &&
            const DeepCollectionEquality()
                .equals(other.languageCode, languageCode) &&
            const DeepCollectionEquality()
                .equals(other.countryCode, countryCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(languageCode),
      const DeepCollectionEquality().hash(countryCode));

  @JsonKey(ignore: true)
  @override
  _$$_UserLanguageCopyWith<_$_UserLanguage> get copyWith =>
      __$$_UserLanguageCopyWithImpl<_$_UserLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLanguageToJson(
      this,
    );
  }
}

abstract class _UserLanguage extends UserLanguage {
  const factory _UserLanguage(
      {required final String languageCode,
      required final String? countryCode}) = _$_UserLanguage;
  const _UserLanguage._() : super._();

  factory _UserLanguage.fromJson(Map<String, dynamic> json) =
      _$_UserLanguage.fromJson;

  @override
  String get languageCode;
  @override
  String? get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$_UserLanguageCopyWith<_$_UserLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
