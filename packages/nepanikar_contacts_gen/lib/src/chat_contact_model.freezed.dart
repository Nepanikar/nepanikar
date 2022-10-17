// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) {
  return _ChatContact.fromJson(json);
}

/// @nodoc
mixin _$ChatContact {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatContactCopyWith<ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContactCopyWith<$Res> {
  factory $ChatContactCopyWith(
          ChatContact value, $Res Function(ChatContact) then) =
      _$ChatContactCopyWithImpl<$Res, ChatContact>;
  @useResult
  $Res call({String title, String? subtitle});
}

/// @nodoc
class _$ChatContactCopyWithImpl<$Res, $Val extends ChatContact>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatContactCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$_ChatContactCopyWith(
          _$_ChatContact value, $Res Function(_$_ChatContact) then) =
      __$$_ChatContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? subtitle});
}

/// @nodoc
class __$$_ChatContactCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$_ChatContact>
    implements _$$_ChatContactCopyWith<$Res> {
  __$$_ChatContactCopyWithImpl(
      _$_ChatContact _value, $Res Function(_$_ChatContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
  }) {
    return _then(_$_ChatContact(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatContact extends _ChatContact {
  const _$_ChatContact({required this.title, this.subtitle}) : super._();

  factory _$_ChatContact.fromJson(Map<String, dynamic> json) =>
      _$$_ChatContactFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;

  @override
  String toString() {
    return 'ChatContact(title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatContact &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatContactCopyWith<_$_ChatContact> get copyWith =>
      __$$_ChatContactCopyWithImpl<_$_ChatContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatContactToJson(
      this,
    );
  }
}

abstract class _ChatContact extends ChatContact {
  const factory _ChatContact(
      {required final String title, final String? subtitle}) = _$_ChatContact;
  const _ChatContact._() : super._();

  factory _ChatContact.fromJson(Map<String, dynamic> json) =
      _$_ChatContact.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  @override
  @JsonKey(ignore: true)
  _$$_ChatContactCopyWith<_$_ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}
