// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneContactSingle _$$PhoneContactSingleFromJson(Map<String, dynamic> json) =>
    _$PhoneContactSingle(
      pinned: json['pinned'] as bool? ?? false,
      title: json['title'] as String,
      tel: json['tel'] as String,
      subtitle: json['subtitle'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PhoneContactSingleToJson(
        _$PhoneContactSingle instance) =>
    <String, dynamic>{
      'pinned': instance.pinned,
      'title': instance.title,
      'tel': instance.tel,
      'subtitle': instance.subtitle,
      'runtimeType': instance.$type,
    };

_$PhoneContactSubList _$$PhoneContactSubListFromJson(
        Map<String, dynamic> json) =>
    _$PhoneContactSubList(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      subPhoneContacts: (json['subPhoneContacts'] as List<dynamic>)
          .map((e) => SubPhoneContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PhoneContactSubListToJson(
        _$PhoneContactSubList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'subPhoneContacts': instance.subPhoneContacts,
      'runtimeType': instance.$type,
    };

_$_SubPhoneContact _$$_SubPhoneContactFromJson(Map<String, dynamic> json) =>
    _$_SubPhoneContact(
      title: json['title'] as String,
      tel: json['tel'] as String,
      action:
          $enumDecodeNullable(_$SubPhoneContactActionEnumMap, json['action']) ??
              SubPhoneContactAction.phone,
    );

Map<String, dynamic> _$$_SubPhoneContactToJson(_$_SubPhoneContact instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tel': instance.tel,
      'action': _$SubPhoneContactActionEnumMap[instance.action]!,
    };

const _$SubPhoneContactActionEnumMap = {
  SubPhoneContactAction.phone: 'phone',
  SubPhoneContactAction.whatsApp: 'whatsApp',
};
