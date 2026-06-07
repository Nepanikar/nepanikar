// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BpdUserProfile _$BpdUserProfileFromJson(Map<String, dynamic> json) =>
    _BpdUserProfile(
      name: json['name'] as String,
      pronoun: $enumDecode(_$BpdPronounEnumMap, json['pronoun']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BpdUserProfileToJson(_BpdUserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pronoun': _$BpdPronounEnumMap[instance.pronoun]!,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$BpdPronounEnumMap = {
  BpdPronoun.he: 'he',
  BpdPronoun.she: 'she',
  BpdPronoun.they: 'they',
};
