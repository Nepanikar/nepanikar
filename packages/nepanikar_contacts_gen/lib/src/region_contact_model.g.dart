// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegionContact _$$_RegionContactFromJson(Map<String, dynamic> json) =>
    _$_RegionContact(
      region: json['region'] as String,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => RegionItemContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegionContactToJson(_$_RegionContact instance) =>
    <String, dynamic>{
      'region': instance.region,
      'contacts': instance.contacts,
    };

_$_RegionItemContact _$$_RegionItemContactFromJson(Map<String, dynamic> json) =>
    _$_RegionItemContact(
      name: json['name'] as String,
      contactAddresses: (json['contactAddresses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RegionItemContactToJson(
        _$_RegionItemContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactAddresses': instance.contactAddresses,
    };
