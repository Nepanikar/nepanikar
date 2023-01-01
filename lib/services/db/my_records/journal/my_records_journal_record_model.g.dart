// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_journal_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JournalRecordAnswer _$$_JournalRecordAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_JournalRecordAnswer(
      question: $enumDecode(_$JournalQuestionEnumMap, json['question']),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$_JournalRecordAnswerToJson(
        _$_JournalRecordAnswer instance) =>
    <String, dynamic>{
      'question': _$JournalQuestionEnumMap[instance.question]!,
      'answer': instance.answer,
    };

const _$JournalQuestionEnumMap = {
  JournalQuestion.grateful: 'grateful',
  JournalQuestion.great: 'great',
  JournalQuestion.feel: 'feel',
  JournalQuestion.three: 'three',
  JournalQuestion.improve: 'improve',
};

_$_JournalRecord _$$_JournalRecordFromJson(Map<String, dynamic> json) =>
    _$_JournalRecord(
      dateTime: DateTime.parse(json['dateWithTime'] as String),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => JournalRecordAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_JournalRecordToJson(_$_JournalRecord instance) =>
    <String, dynamic>{
      'dateWithTime': instance.dateTime.toIso8601String(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };
