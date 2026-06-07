// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatContactSubList _$ChatContactSubListFromJson(Map<String, dynamic> json) =>
    ChatContactSubList(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      subChatContacts: (json['subChatContacts'] as List<dynamic>)
          .map((e) => SubChatContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatContactSubListToJson(ChatContactSubList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'subChatContacts': instance.subChatContacts,
    };

_SubChatContact _$SubChatContactFromJson(Map<String, dynamic> json) =>
    _SubChatContact(title: json['title'] as String, url: json['url'] as String);

Map<String, dynamic> _$SubChatContactToJson(_SubChatContact instance) =>
    <String, dynamic>{'title': instance.title, 'url': instance.url};
