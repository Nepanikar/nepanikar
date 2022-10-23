// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneContact _$PhoneContactFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return PhoneContactSingle.fromJson(json);
    case 'subList':
      return PhoneContactSubList.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PhoneContact',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PhoneContact {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)
        subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneContactSingle value) $default, {
    required TResult Function(PhoneContactSubList value) subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneContactSingle value)? $default, {
    TResult? Function(PhoneContactSubList value)? subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneContactSingle value)? $default, {
    TResult Function(PhoneContactSubList value)? subList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneContactCopyWith<PhoneContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneContactCopyWith<$Res> {
  factory $PhoneContactCopyWith(
          PhoneContact value, $Res Function(PhoneContact) then) =
      _$PhoneContactCopyWithImpl<$Res, PhoneContact>;
  @useResult
  $Res call({String title, String? subtitle});
}

/// @nodoc
class _$PhoneContactCopyWithImpl<$Res, $Val extends PhoneContact>
    implements $PhoneContactCopyWith<$Res> {
  _$PhoneContactCopyWithImpl(this._value, this._then);

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
abstract class _$$PhoneContactSingleCopyWith<$Res>
    implements $PhoneContactCopyWith<$Res> {
  factory _$$PhoneContactSingleCopyWith(_$PhoneContactSingle value,
          $Res Function(_$PhoneContactSingle) then) =
      __$$PhoneContactSingleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool pinned, String title, String tel, String? subtitle});
}

/// @nodoc
class __$$PhoneContactSingleCopyWithImpl<$Res>
    extends _$PhoneContactCopyWithImpl<$Res, _$PhoneContactSingle>
    implements _$$PhoneContactSingleCopyWith<$Res> {
  __$$PhoneContactSingleCopyWithImpl(
      _$PhoneContactSingle _value, $Res Function(_$PhoneContactSingle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinned = null,
    Object? title = null,
    Object? tel = null,
    Object? subtitle = freezed,
  }) {
    return _then(_$PhoneContactSingle(
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
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
class _$PhoneContactSingle extends PhoneContactSingle {
  const _$PhoneContactSingle(
      {this.pinned = false,
      required this.title,
      required this.tel,
      this.subtitle,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$PhoneContactSingle.fromJson(Map<String, dynamic> json) =>
      _$$PhoneContactSingleFromJson(json);

  @override
  @JsonKey()
  final bool pinned;
  @override
  final String title;
  @override
  final String tel;
  @override
  final String? subtitle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhoneContact(pinned: $pinned, title: $title, tel: $tel, subtitle: $subtitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneContactSingle &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pinned, title, tel, subtitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneContactSingleCopyWith<_$PhoneContactSingle> get copyWith =>
      __$$PhoneContactSingleCopyWithImpl<_$PhoneContactSingle>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)
        subList,
  }) {
    return $default(pinned, title, tel, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
  }) {
    return $default?.call(pinned, title, tel, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(pinned, title, tel, subtitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneContactSingle value) $default, {
    required TResult Function(PhoneContactSubList value) subList,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneContactSingle value)? $default, {
    TResult? Function(PhoneContactSubList value)? subList,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneContactSingle value)? $default, {
    TResult Function(PhoneContactSubList value)? subList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneContactSingleToJson(
      this,
    );
  }
}

abstract class PhoneContactSingle extends PhoneContact {
  const factory PhoneContactSingle(
      {final bool pinned,
      required final String title,
      required final String tel,
      final String? subtitle}) = _$PhoneContactSingle;
  const PhoneContactSingle._() : super._();

  factory PhoneContactSingle.fromJson(Map<String, dynamic> json) =
      _$PhoneContactSingle.fromJson;

  bool get pinned;
  @override
  String get title;
  String get tel;
  @override
  String? get subtitle;
  @override
  @JsonKey(ignore: true)
  _$$PhoneContactSingleCopyWith<_$PhoneContactSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneContactSubListCopyWith<$Res>
    implements $PhoneContactCopyWith<$Res> {
  factory _$$PhoneContactSubListCopyWith(_$PhoneContactSubList value,
          $Res Function(_$PhoneContactSubList) then) =
      __$$PhoneContactSubListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String? subtitle, List<SubPhoneContact> subPhoneContacts});
}

/// @nodoc
class __$$PhoneContactSubListCopyWithImpl<$Res>
    extends _$PhoneContactCopyWithImpl<$Res, _$PhoneContactSubList>
    implements _$$PhoneContactSubListCopyWith<$Res> {
  __$$PhoneContactSubListCopyWithImpl(
      _$PhoneContactSubList _value, $Res Function(_$PhoneContactSubList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? subPhoneContacts = null,
  }) {
    return _then(_$PhoneContactSubList(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      subPhoneContacts: null == subPhoneContacts
          ? _value._subPhoneContacts
          : subPhoneContacts // ignore: cast_nullable_to_non_nullable
              as List<SubPhoneContact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneContactSubList extends PhoneContactSubList {
  const _$PhoneContactSubList(
      {required this.title,
      this.subtitle,
      required final List<SubPhoneContact> subPhoneContacts,
      final String? $type})
      : _subPhoneContacts = subPhoneContacts,
        $type = $type ?? 'subList',
        super._();

  factory _$PhoneContactSubList.fromJson(Map<String, dynamic> json) =>
      _$$PhoneContactSubListFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;
  final List<SubPhoneContact> _subPhoneContacts;
  @override
  List<SubPhoneContact> get subPhoneContacts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subPhoneContacts);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhoneContact.subList(title: $title, subtitle: $subtitle, subPhoneContacts: $subPhoneContacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneContactSubList &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality()
                .equals(other._subPhoneContacts, _subPhoneContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle,
      const DeepCollectionEquality().hash(_subPhoneContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneContactSubListCopyWith<_$PhoneContactSubList> get copyWith =>
      __$$PhoneContactSubListCopyWithImpl<_$PhoneContactSubList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)
        subList,
  }) {
    return subList(title, subtitle, subPhoneContacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
  }) {
    return subList?.call(title, subtitle, subPhoneContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String tel, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubPhoneContact> subPhoneContacts)?
        subList,
    required TResult orElse(),
  }) {
    if (subList != null) {
      return subList(title, subtitle, subPhoneContacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneContactSingle value) $default, {
    required TResult Function(PhoneContactSubList value) subList,
  }) {
    return subList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneContactSingle value)? $default, {
    TResult? Function(PhoneContactSubList value)? subList,
  }) {
    return subList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneContactSingle value)? $default, {
    TResult Function(PhoneContactSubList value)? subList,
    required TResult orElse(),
  }) {
    if (subList != null) {
      return subList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneContactSubListToJson(
      this,
    );
  }
}

abstract class PhoneContactSubList extends PhoneContact {
  const factory PhoneContactSubList(
          {required final String title,
          final String? subtitle,
          required final List<SubPhoneContact> subPhoneContacts}) =
      _$PhoneContactSubList;
  const PhoneContactSubList._() : super._();

  factory PhoneContactSubList.fromJson(Map<String, dynamic> json) =
      _$PhoneContactSubList.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  List<SubPhoneContact> get subPhoneContacts;
  @override
  @JsonKey(ignore: true)
  _$$PhoneContactSubListCopyWith<_$PhoneContactSubList> get copyWith =>
      throw _privateConstructorUsedError;
}

SubPhoneContact _$SubPhoneContactFromJson(Map<String, dynamic> json) {
  return _SubPhoneContact.fromJson(json);
}

/// @nodoc
mixin _$SubPhoneContact {
  String get title => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;
  SubPhoneContactAction get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubPhoneContactCopyWith<SubPhoneContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubPhoneContactCopyWith<$Res> {
  factory $SubPhoneContactCopyWith(
          SubPhoneContact value, $Res Function(SubPhoneContact) then) =
      _$SubPhoneContactCopyWithImpl<$Res, SubPhoneContact>;
  @useResult
  $Res call({String title, String tel, SubPhoneContactAction action});
}

/// @nodoc
class _$SubPhoneContactCopyWithImpl<$Res, $Val extends SubPhoneContact>
    implements $SubPhoneContactCopyWith<$Res> {
  _$SubPhoneContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? tel = null,
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SubPhoneContactAction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubPhoneContactCopyWith<$Res>
    implements $SubPhoneContactCopyWith<$Res> {
  factory _$$_SubPhoneContactCopyWith(
          _$_SubPhoneContact value, $Res Function(_$_SubPhoneContact) then) =
      __$$_SubPhoneContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String tel, SubPhoneContactAction action});
}

/// @nodoc
class __$$_SubPhoneContactCopyWithImpl<$Res>
    extends _$SubPhoneContactCopyWithImpl<$Res, _$_SubPhoneContact>
    implements _$$_SubPhoneContactCopyWith<$Res> {
  __$$_SubPhoneContactCopyWithImpl(
      _$_SubPhoneContact _value, $Res Function(_$_SubPhoneContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? tel = null,
    Object? action = null,
  }) {
    return _then(_$_SubPhoneContact(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SubPhoneContactAction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubPhoneContact extends _SubPhoneContact {
  const _$_SubPhoneContact(
      {required this.title,
      required this.tel,
      this.action = SubPhoneContactAction.phone})
      : super._();

  factory _$_SubPhoneContact.fromJson(Map<String, dynamic> json) =>
      _$$_SubPhoneContactFromJson(json);

  @override
  final String title;
  @override
  final String tel;
  @override
  @JsonKey()
  final SubPhoneContactAction action;

  @override
  String toString() {
    return 'SubPhoneContact(title: $title, tel: $tel, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubPhoneContact &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, tel, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubPhoneContactCopyWith<_$_SubPhoneContact> get copyWith =>
      __$$_SubPhoneContactCopyWithImpl<_$_SubPhoneContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubPhoneContactToJson(
      this,
    );
  }
}

abstract class _SubPhoneContact extends SubPhoneContact {
  const factory _SubPhoneContact(
      {required final String title,
      required final String tel,
      final SubPhoneContactAction action}) = _$_SubPhoneContact;
  const _SubPhoneContact._() : super._();

  factory _SubPhoneContact.fromJson(Map<String, dynamic> json) =
      _$_SubPhoneContact.fromJson;

  @override
  String get title;
  @override
  String get tel;
  @override
  SubPhoneContactAction get action;
  @override
  @JsonKey(ignore: true)
  _$$_SubPhoneContactCopyWith<_$_SubPhoneContact> get copyWith =>
      throw _privateConstructorUsedError;
}
