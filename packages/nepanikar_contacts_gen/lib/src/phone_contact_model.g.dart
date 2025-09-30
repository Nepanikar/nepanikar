// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneContactSingle _$PhoneContactSingleFromJson(Map<String, dynamic> json) => PhoneContactSingle(
  pinned: json['pinned'] as bool? ?? false,
  title: json['title'] as String,
  tel: json['tel'] as String,
  subtitle: json['subtitle'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PhoneContactSingleToJson(PhoneContactSingle instance) => <String, dynamic>{
  'pinned': instance.pinned,
  'title': instance.title,
  'tel': instance.tel,
  'subtitle': instance.subtitle,
  'runtimeType': instance.$type,
};

PhoneContactSubList _$PhoneContactSubListFromJson(Map<String, dynamic> json) => PhoneContactSubList(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  subPhoneContacts: (json['subPhoneContacts'] as List<dynamic>)
      .map((e) => SubPhoneContact.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$PhoneContactSubListToJson(PhoneContactSubList instance) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'subPhoneContacts': instance.subPhoneContacts,
  'runtimeType': instance.$type,
};

_SubPhoneContact _$SubPhoneContactFromJson(Map<String, dynamic> json) =>
    _SubPhoneContact(title: json['title'] as String, tel: json['tel'] as String);

Map<String, dynamic> _$SubPhoneContactToJson(_SubPhoneContact instance) => <String, dynamic>{
  'title': instance.title,
  'tel': instance.tel,
};
