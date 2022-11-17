// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UniversityRegionContact _$$_UniversityRegionContactFromJson(
        Map<String, dynamic> json) =>
    _$_UniversityRegionContact(
      region: json['region'] as String,
      universities: (json['universities'] as List<dynamic>)
          .map((e) => UniversityContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UniversityRegionContactToJson(
        _$_UniversityRegionContact instance) =>
    <String, dynamic>{
      'region': instance.region,
      'universities': instance.universities,
    };

_$_UniversityContact _$$_UniversityContactFromJson(Map<String, dynamic> json) =>
    _$_UniversityContact(
      name: json['name'] as String,
      contacts:
          (json['contacts'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UniversityContactToJson(
        _$_UniversityContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contacts': instance.contacts,
    };
