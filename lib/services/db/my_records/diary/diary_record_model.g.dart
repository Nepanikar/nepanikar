// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryRecord _$$_DiaryRecordFromJson(Map<String, dynamic> json) =>
    _$_DiaryRecord(
      dateTime: DateTime.parse(json['dateWithTime'] as String),
      title: json['title'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_DiaryRecordToJson(_$_DiaryRecord instance) =>
    <String, dynamic>{
      'dateWithTime': instance.dateTime.toIso8601String(),
      'title': instance.title,
      'text': instance.text,
    };
