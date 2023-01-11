// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return ChatContactSingle.fromJson(json);
    case 'subList':
      return ChatContactSubList.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatContact',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatContact {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)
        subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatContactSingle value) $default, {
    required TResult Function(ChatContactSubList value) subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatContactSingle value)? $default, {
    TResult? Function(ChatContactSubList value)? subList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatContactSingle value)? $default, {
    TResult Function(ChatContactSubList value)? subList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
abstract class _$$ChatContactSingleCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$ChatContactSingleCopyWith(
          _$ChatContactSingle value, $Res Function(_$ChatContactSingle) then) =
      __$$ChatContactSingleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool pinned, String title, String url, String? subtitle});
}

/// @nodoc
class __$$ChatContactSingleCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$ChatContactSingle>
    implements _$$ChatContactSingleCopyWith<$Res> {
  __$$ChatContactSingleCopyWithImpl(
      _$ChatContactSingle _value, $Res Function(_$ChatContactSingle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinned = null,
    Object? title = null,
    Object? url = null,
    Object? subtitle = freezed,
  }) {
    return _then(_$ChatContactSingle(
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
class _$ChatContactSingle extends ChatContactSingle {
  const _$ChatContactSingle(
      {this.pinned = false,
      required this.title,
      required this.url,
      this.subtitle,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$ChatContactSingle.fromJson(Map<String, dynamic> json) =>
      _$$ChatContactSingleFromJson(json);

  @override
  @JsonKey()
  final bool pinned;
  @override
  final String title;
  @override
  final String url;
  @override
  final String? subtitle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatContact(pinned: $pinned, title: $title, url: $url, subtitle: $subtitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContactSingle &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pinned, title, url, subtitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContactSingleCopyWith<_$ChatContactSingle> get copyWith =>
      __$$ChatContactSingleCopyWithImpl<_$ChatContactSingle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)
        subList,
  }) {
    return $default(pinned, title, url, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
  }) {
    return $default?.call(pinned, title, url, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(pinned, title, url, subtitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatContactSingle value) $default, {
    required TResult Function(ChatContactSubList value) subList,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatContactSingle value)? $default, {
    TResult? Function(ChatContactSubList value)? subList,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatContactSingle value)? $default, {
    TResult Function(ChatContactSubList value)? subList,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContactSingleToJson(
      this,
    );
  }
}

abstract class ChatContactSingle extends ChatContact {
  const factory ChatContactSingle(
      {final bool pinned,
      required final String title,
      required final String url,
      final String? subtitle}) = _$ChatContactSingle;
  const ChatContactSingle._() : super._();

  factory ChatContactSingle.fromJson(Map<String, dynamic> json) =
      _$ChatContactSingle.fromJson;

  bool get pinned;
  @override
  String get title;
  String get url;
  @override
  String? get subtitle;
  @override
  @JsonKey(ignore: true)
  _$$ChatContactSingleCopyWith<_$ChatContactSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatContactSubListCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$ChatContactSubListCopyWith(_$ChatContactSubList value,
          $Res Function(_$ChatContactSubList) then) =
      __$$ChatContactSubListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String? subtitle, List<SubChatContact> subChatContacts});
}

/// @nodoc
class __$$ChatContactSubListCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$ChatContactSubList>
    implements _$$ChatContactSubListCopyWith<$Res> {
  __$$ChatContactSubListCopyWithImpl(
      _$ChatContactSubList _value, $Res Function(_$ChatContactSubList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? subChatContacts = null,
  }) {
    return _then(_$ChatContactSubList(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      subChatContacts: null == subChatContacts
          ? _value._subChatContacts
          : subChatContacts // ignore: cast_nullable_to_non_nullable
              as List<SubChatContact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatContactSubList extends ChatContactSubList {
  const _$ChatContactSubList(
      {required this.title,
      this.subtitle,
      required final List<SubChatContact> subChatContacts,
      final String? $type})
      : _subChatContacts = subChatContacts,
        $type = $type ?? 'subList',
        super._();

  factory _$ChatContactSubList.fromJson(Map<String, dynamic> json) =>
      _$$ChatContactSubListFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;
  final List<SubChatContact> _subChatContacts;
  @override
  List<SubChatContact> get subChatContacts {
    if (_subChatContacts is EqualUnmodifiableListView) return _subChatContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subChatContacts);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatContact.subList(title: $title, subtitle: $subtitle, subChatContacts: $subChatContacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContactSubList &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality()
                .equals(other._subChatContacts, _subChatContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle,
      const DeepCollectionEquality().hash(_subChatContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContactSubListCopyWith<_$ChatContactSubList> get copyWith =>
      __$$ChatContactSubListCopyWithImpl<_$ChatContactSubList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)
        $default, {
    required TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)
        subList,
  }) {
    return subList(title, subtitle, subChatContacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult? Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
  }) {
    return subList?.call(title, subtitle, subChatContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool pinned, String title, String url, String? subtitle)?
        $default, {
    TResult Function(String title, String? subtitle,
            List<SubChatContact> subChatContacts)?
        subList,
    required TResult orElse(),
  }) {
    if (subList != null) {
      return subList(title, subtitle, subChatContacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatContactSingle value) $default, {
    required TResult Function(ChatContactSubList value) subList,
  }) {
    return subList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatContactSingle value)? $default, {
    TResult? Function(ChatContactSubList value)? subList,
  }) {
    return subList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatContactSingle value)? $default, {
    TResult Function(ChatContactSubList value)? subList,
    required TResult orElse(),
  }) {
    if (subList != null) {
      return subList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContactSubListToJson(
      this,
    );
  }
}

abstract class ChatContactSubList extends ChatContact {
  const factory ChatContactSubList(
          {required final String title,
          final String? subtitle,
          required final List<SubChatContact> subChatContacts}) =
      _$ChatContactSubList;
  const ChatContactSubList._() : super._();

  factory ChatContactSubList.fromJson(Map<String, dynamic> json) =
      _$ChatContactSubList.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  List<SubChatContact> get subChatContacts;
  @override
  @JsonKey(ignore: true)
  _$$ChatContactSubListCopyWith<_$ChatContactSubList> get copyWith =>
      throw _privateConstructorUsedError;
}

SubChatContact _$SubChatContactFromJson(Map<String, dynamic> json) {
  return _SubChatContact.fromJson(json);
}

/// @nodoc
mixin _$SubChatContact {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubChatContactCopyWith<SubChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubChatContactCopyWith<$Res> {
  factory $SubChatContactCopyWith(
          SubChatContact value, $Res Function(SubChatContact) then) =
      _$SubChatContactCopyWithImpl<$Res, SubChatContact>;
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class _$SubChatContactCopyWithImpl<$Res, $Val extends SubChatContact>
    implements $SubChatContactCopyWith<$Res> {
  _$SubChatContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubChatContactCopyWith<$Res>
    implements $SubChatContactCopyWith<$Res> {
  factory _$$_SubChatContactCopyWith(
          _$_SubChatContact value, $Res Function(_$_SubChatContact) then) =
      __$$_SubChatContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url});
}

/// @nodoc
class __$$_SubChatContactCopyWithImpl<$Res>
    extends _$SubChatContactCopyWithImpl<$Res, _$_SubChatContact>
    implements _$$_SubChatContactCopyWith<$Res> {
  __$$_SubChatContactCopyWithImpl(
      _$_SubChatContact _value, $Res Function(_$_SubChatContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$_SubChatContact(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubChatContact extends _SubChatContact {
  const _$_SubChatContact({required this.title, required this.url}) : super._();

  factory _$_SubChatContact.fromJson(Map<String, dynamic> json) =>
      _$$_SubChatContactFromJson(json);

  @override
  final String title;
  @override
  final String url;

  @override
  String toString() {
    return 'SubChatContact(title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubChatContact &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubChatContactCopyWith<_$_SubChatContact> get copyWith =>
      __$$_SubChatContactCopyWithImpl<_$_SubChatContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubChatContactToJson(
      this,
    );
  }
}

abstract class _SubChatContact extends SubChatContact {
  const factory _SubChatContact(
      {required final String title,
      required final String url}) = _$_SubChatContact;
  const _SubChatContact._() : super._();

  factory _SubChatContact.fromJson(Map<String, dynamic> json) =
      _$_SubChatContact.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_SubChatContactCopyWith<_$_SubChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}
