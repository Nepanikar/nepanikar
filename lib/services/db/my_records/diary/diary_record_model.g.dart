// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiaryRecord _$DiaryRecordFromJson(Map<String, dynamic> json) => _DiaryRecord(
  dateTime: DateTime.parse(json['dateWithTime'] as String),
  title: json['title'] as String,
  text: json['text'] as String,
);

Map<String, dynamic> _$DiaryRecordToJson(_DiaryRecord instance) => <String, dynamic>{
  'dateWithTime': instance.dateTime.toIso8601String(),
  'title': instance.title,
  'text': instance.text,
};
