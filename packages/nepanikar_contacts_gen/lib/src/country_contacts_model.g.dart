// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_contacts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryContacts _$$_CountryContactsFromJson(Map<String, dynamic> json) =>
    _$_CountryContacts(
      languageTag: json['languageTag'] as String,
      phoneContacts: (json['phoneContacts'] as List<dynamic>?)
          ?.map((e) => PhoneContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      crisisCenterContacts: (json['crisisCenterContacts'] as List<dynamic>?)
          ?.map((e) => CrisisCenterContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatContacts: (json['chatContacts'] as List<dynamic>?)
          ?.map((e) => ChatContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      universityContacts: (json['universityContacts'] as List<dynamic>?)
          ?.map((e) => UniversityContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CountryContactsToJson(_$_CountryContacts instance) =>
    <String, dynamic>{
      'languageTag': instance.languageTag,
      'phoneContacts': instance.phoneContacts,
      'crisisCenterContacts': instance.crisisCenterContacts,
      'chatContacts': instance.chatContacts,
      'universityContacts': instance.universityContacts,
    };