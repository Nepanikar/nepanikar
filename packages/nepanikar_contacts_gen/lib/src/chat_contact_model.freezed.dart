// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ChatContact _$ChatContactFromJson(
  Map<String, dynamic> json
) {
    return ChatContactSubList.fromJson(
      json
    );
}

/// @nodoc
mixin _$ChatContact {

 String get title; String? get subtitle; List<SubChatContact> get subChatContacts;
/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatContactCopyWith<ChatContact> get copyWith => _$ChatContactCopyWithImpl<ChatContact>(this as ChatContact, _$identity);

  /// Serializes this ChatContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatContact&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.subChatContacts, subChatContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(subChatContacts));

@override
String toString() {
  return 'ChatContact(title: $title, subtitle: $subtitle, subChatContacts: $subChatContacts)';
}


}

/// @nodoc
abstract mixin class $ChatContactCopyWith<$Res>  {
  factory $ChatContactCopyWith(ChatContact value, $Res Function(ChatContact) _then) = _$ChatContactCopyWithImpl;
@useResult
$Res call({
 String title, String? subtitle, List<SubChatContact> subChatContacts
});




}
/// @nodoc
class _$ChatContactCopyWithImpl<$Res>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._self, this._then);

  final ChatContact _self;
  final $Res Function(ChatContact) _then;

/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = freezed,Object? subChatContacts = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,subChatContacts: null == subChatContacts ? _self.subChatContacts : subChatContacts // ignore: cast_nullable_to_non_nullable
as List<SubChatContact>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatContact].
extension ChatContactPatterns on ChatContact {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatContactSubList value)?  subList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatContactSubList() when subList != null:
return subList(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatContactSubList value)  subList,}){
final _that = this;
switch (_that) {
case ChatContactSubList():
return subList(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatContactSubList value)?  subList,}){
final _that = this;
switch (_that) {
case ChatContactSubList() when subList != null:
return subList(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title,  String? subtitle,  List<SubChatContact> subChatContacts)?  subList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatContactSubList() when subList != null:
return subList(_that.title,_that.subtitle,_that.subChatContacts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title,  String? subtitle,  List<SubChatContact> subChatContacts)  subList,}) {final _that = this;
switch (_that) {
case ChatContactSubList():
return subList(_that.title,_that.subtitle,_that.subChatContacts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title,  String? subtitle,  List<SubChatContact> subChatContacts)?  subList,}) {final _that = this;
switch (_that) {
case ChatContactSubList() when subList != null:
return subList(_that.title,_that.subtitle,_that.subChatContacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ChatContactSubList extends ChatContact {
  const ChatContactSubList({required this.title, this.subtitle, required final  List<SubChatContact> subChatContacts}): _subChatContacts = subChatContacts,super._();
  factory ChatContactSubList.fromJson(Map<String, dynamic> json) => _$ChatContactSubListFromJson(json);

@override final  String title;
@override final  String? subtitle;
 final  List<SubChatContact> _subChatContacts;
@override List<SubChatContact> get subChatContacts {
  if (_subChatContacts is EqualUnmodifiableListView) return _subChatContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subChatContacts);
}


/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatContactSubListCopyWith<ChatContactSubList> get copyWith => _$ChatContactSubListCopyWithImpl<ChatContactSubList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatContactSubListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatContactSubList&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._subChatContacts, _subChatContacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,const DeepCollectionEquality().hash(_subChatContacts));

@override
String toString() {
  return 'ChatContact.subList(title: $title, subtitle: $subtitle, subChatContacts: $subChatContacts)';
}


}

/// @nodoc
abstract mixin class $ChatContactSubListCopyWith<$Res> implements $ChatContactCopyWith<$Res> {
  factory $ChatContactSubListCopyWith(ChatContactSubList value, $Res Function(ChatContactSubList) _then) = _$ChatContactSubListCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, List<SubChatContact> subChatContacts
});




}
/// @nodoc
class _$ChatContactSubListCopyWithImpl<$Res>
    implements $ChatContactSubListCopyWith<$Res> {
  _$ChatContactSubListCopyWithImpl(this._self, this._then);

  final ChatContactSubList _self;
  final $Res Function(ChatContactSubList) _then;

/// Create a copy of ChatContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? subChatContacts = null,}) {
  return _then(ChatContactSubList(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,subChatContacts: null == subChatContacts ? _self._subChatContacts : subChatContacts // ignore: cast_nullable_to_non_nullable
as List<SubChatContact>,
  ));
}


}


/// @nodoc
mixin _$SubChatContact {

 String get title; String get url;
/// Create a copy of SubChatContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubChatContactCopyWith<SubChatContact> get copyWith => _$SubChatContactCopyWithImpl<SubChatContact>(this as SubChatContact, _$identity);

  /// Serializes this SubChatContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubChatContact&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url);

@override
String toString() {
  return 'SubChatContact(title: $title, url: $url)';
}


}

/// @nodoc
abstract mixin class $SubChatContactCopyWith<$Res>  {
  factory $SubChatContactCopyWith(SubChatContact value, $Res Function(SubChatContact) _then) = _$SubChatContactCopyWithImpl;
@useResult
$Res call({
 String title, String url
});




}
/// @nodoc
class _$SubChatContactCopyWithImpl<$Res>
    implements $SubChatContactCopyWith<$Res> {
  _$SubChatContactCopyWithImpl(this._self, this._then);

  final SubChatContact _self;
  final $Res Function(SubChatContact) _then;

/// Create a copy of SubChatContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubChatContact].
extension SubChatContactPatterns on SubChatContact {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubChatContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubChatContact() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubChatContact value)  $default,){
final _that = this;
switch (_that) {
case _SubChatContact():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubChatContact value)?  $default,){
final _that = this;
switch (_that) {
case _SubChatContact() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubChatContact() when $default != null:
return $default(_that.title,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String url)  $default,) {final _that = this;
switch (_that) {
case _SubChatContact():
return $default(_that.title,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String url)?  $default,) {final _that = this;
switch (_that) {
case _SubChatContact() when $default != null:
return $default(_that.title,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubChatContact extends SubChatContact {
  const _SubChatContact({required this.title, required this.url}): super._();
  factory _SubChatContact.fromJson(Map<String, dynamic> json) => _$SubChatContactFromJson(json);

@override final  String title;
@override final  String url;

/// Create a copy of SubChatContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubChatContactCopyWith<_SubChatContact> get copyWith => __$SubChatContactCopyWithImpl<_SubChatContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubChatContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubChatContact&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url);

@override
String toString() {
  return 'SubChatContact(title: $title, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SubChatContactCopyWith<$Res> implements $SubChatContactCopyWith<$Res> {
  factory _$SubChatContactCopyWith(_SubChatContact value, $Res Function(_SubChatContact) _then) = __$SubChatContactCopyWithImpl;
@override @useResult
$Res call({
 String title, String url
});




}
/// @nodoc
class __$SubChatContactCopyWithImpl<$Res>
    implements _$SubChatContactCopyWith<$Res> {
  __$SubChatContactCopyWithImpl(this._self, this._then);

  final _SubChatContact _self;
  final $Res Function(_SubChatContact) _then;

/// Create a copy of SubChatContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,}) {
  return _then(_SubChatContact(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
