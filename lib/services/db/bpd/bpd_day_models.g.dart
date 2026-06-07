// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_day_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BpdDayProgress _$BpdDayProgressFromJson(Map<String, dynamic> json) =>
    _BpdDayProgress(
      weekNumber: (json['weekNumber'] as num).toInt(),
      dayNumber: (json['dayNumber'] as num).toInt(),
      unlockDate: DateTime.parse(json['unlockDate'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
    );

Map<String, dynamic> _$BpdDayProgressToJson(_BpdDayProgress instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'dayNumber': instance.dayNumber,
      'unlockDate': instance.unlockDate.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
    };

_BpdDayData _$BpdDayDataFromJson(Map<String, dynamic> json) => _BpdDayData(
  weekNumber: (json['weekNumber'] as num).toInt(),
  dayNumber: (json['dayNumber'] as num).toInt(),
  titleKey: json['titleKey'] as String,
  descriptionKey: json['descriptionKey'] as String,
  iconPath: json['iconPath'] as String?,
  contentType: json['contentType'] as String?,
);

Map<String, dynamic> _$BpdDayDataToJson(_BpdDayData instance) =>
    <String, dynamic>{
      'weekNumber': instance.weekNumber,
      'dayNumber': instance.dayNumber,
      'titleKey': instance.titleKey,
      'descriptionKey': instance.descriptionKey,
      'iconPath': instance.iconPath,
      'contentType': instance.contentType,
    };
