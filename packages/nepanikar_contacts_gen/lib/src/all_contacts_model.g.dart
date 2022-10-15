// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_contacts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllContacts _$$_AllContactsFromJson(Map<String, dynamic> json) =>
    _$_AllContacts(
      countryContacts: (json['countryContacts'] as List<dynamic>)
          .map((e) => CountryContacts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AllContactsToJson(_$_AllContacts instance) =>
    <String, dynamic>{
      'countryContacts': instance.countryContacts,
    };
