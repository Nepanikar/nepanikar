// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_contacts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllContacts _$AllContactsFromJson(Map<String, dynamic> json) => _AllContacts(
  countryContacts: (json['countryContacts'] as List<dynamic>)
      .map((e) => CountryContacts.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AllContactsToJson(_AllContacts instance) => <String, dynamic>{
  'countryContacts': instance.countryContacts,
};
