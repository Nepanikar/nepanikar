// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoodTrack _$$_MoodTrackFromJson(Map<String, dynamic> json) => _$_MoodTrack(
      mood: $enumDecode(_$MoodEnumMap, json['mood']),
      date: DateTime.parse(json['date'] as String),
      emotions: (json['emotions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$_MoodTrackToJson(_$_MoodTrack instance) =>
    <String, dynamic>{
      'mood': _$MoodEnumMap[instance.mood]!,
      'date': instance.date.toIso8601String(),
      'emotions': instance.emotions,
      'summary': instance.summary,
    };

const _$MoodEnumMap = {
  Mood.sad: 'sad',
  Mood.bad: 'bad',
  Mood.okay: 'okay',
  Mood.good: 'good',
  Mood.happy: 'happy',
};
