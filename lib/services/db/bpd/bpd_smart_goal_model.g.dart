// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_smart_goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BpdSmartGoalImpl _$$BpdSmartGoalImplFromJson(Map<String, dynamic> json) =>
    _$BpdSmartGoalImpl(
      id: json['id'] as String,
      specific: json['specific'] as String,
      measurable: json['measurable'] as String,
      achievable: json['achievable'] as String,
      relevant: json['relevant'] as String,
      timeBound: json['timeBound'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$$BpdSmartGoalImplToJson(_$BpdSmartGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specific': instance.specific,
      'measurable': instance.measurable,
      'achievable': instance.achievable,
      'relevant': instance.relevant,
      'timeBound': instance.timeBound,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isArchived': instance.isArchived,
    };
