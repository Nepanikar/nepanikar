// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegionContact _$RegionContactFromJson(Map<String, dynamic> json) =>
    _RegionContact(
      region: json['region'] as String,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => RegionItemContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionContactToJson(_RegionContact instance) =>
    <String, dynamic>{'region': instance.region, 'contacts': instance.contacts};

_RegionItemContact _$RegionItemContactFromJson(Map<String, dynamic> json) =>
    _RegionItemContact(
      name: json['name'] as String,
      contactAddresses: (json['contactAddresses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegionItemContactToJson(_RegionItemContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contactAddresses': instance.contactAddresses,
    };
