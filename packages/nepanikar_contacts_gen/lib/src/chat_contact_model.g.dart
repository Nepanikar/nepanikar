// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatContactSingle _$$ChatContactSingleFromJson(Map<String, dynamic> json) =>
    _$ChatContactSingle(
      pinned: json['pinned'] as bool? ?? false,
      title: json['title'] as String,
      url: json['url'] as String,
      subtitle: json['subtitle'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatContactSingleToJson(_$ChatContactSingle instance) =>
    <String, dynamic>{
      'pinned': instance.pinned,
      'title': instance.title,
      'url': instance.url,
      'subtitle': instance.subtitle,
      'runtimeType': instance.$type,
    };

_$ChatContactSubList _$$ChatContactSubListFromJson(Map<String, dynamic> json) =>
    _$ChatContactSubList(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      subChatContacts: (json['subChatContacts'] as List<dynamic>)
          .map((e) => SubChatContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChatContactSubListToJson(
        _$ChatContactSubList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'subChatContacts': instance.subChatContacts,
      'runtimeType': instance.$type,
    };

_$_SubChatContact _$$_SubChatContactFromJson(Map<String, dynamic> json) =>
    _$_SubChatContact(
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_SubChatContactToJson(_$_SubChatContact instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
