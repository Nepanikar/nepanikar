// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_week_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BpdWeekProgress _$BpdWeekProgressFromJson(Map<String, dynamic> json) =>
    _BpdWeekProgress(
      weekNumber: (json['weekNumber'] as num).toInt(),
      unlockDate: DateTime.parse(json['unlockDate'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$BpdWeekProgressToJson(_BpdWeekProgress instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'unlockDate': instance.unlockDate.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
    };

_BpdWeekData _$BpdWeekDataFromJson(Map<String, dynamic> json) => _BpdWeekData(
  weekNumber: (json['weekNumber'] as num).toInt(),
  titleKey: json['titleKey'] as String,
  descriptionKey: json['descriptionKey'] as String,
  iconPath: json['iconPath'] as String?,
);

Map<String, dynamic> _$BpdWeekDataToJson(_BpdWeekData instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'titleKey': instance.titleKey,
      'descriptionKey': instance.descriptionKey,
      'iconPath': instance.iconPath,
    };
