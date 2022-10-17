// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'university_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UniversityContact _$UniversityContactFromJson(Map<String, dynamic> json) {
  return _UniversityContact.fromJson(json);
}

/// @nodoc
mixin _$UniversityContact {
  String get title => throw _privateConstructorUsedError;

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
  $Res call({String title});
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
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String title});
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
    Object? title = null,
  }) {
    return _then(_$_UniversityContact(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UniversityContact implements _UniversityContact {
  const _$_UniversityContact({required this.title});

  factory _$_UniversityContact.fromJson(Map<String, dynamic> json) =>
      _$$_UniversityContactFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'UniversityContact(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UniversityContact &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

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
  const factory _UniversityContact({required final String title}) =
      _$_UniversityContact;

  factory _UniversityContact.fromJson(Map<String, dynamic> json) =
      _$_UniversityContact.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_UniversityContactCopyWith<_$_UniversityContact> get copyWith =>
      throw _privateConstructorUsedError;
}
