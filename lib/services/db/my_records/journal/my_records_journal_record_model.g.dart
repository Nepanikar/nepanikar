// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_journal_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JournalRecordAnswer _$JournalRecordAnswerFromJson(Map<String, dynamic> json) =>
    _JournalRecordAnswer(
      question: $enumDecode(_$JournalQuestionEnumMap, json['question']),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$JournalRecordAnswerToJson(
  _JournalRecordAnswer instance,
) => <String, dynamic>{
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

_JournalRecord _$JournalRecordFromJson(Map<String, dynamic> json) =>
    _JournalRecord(
      dateTime: DateTime.parse(json['dateWithTime'] as String),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => JournalRecordAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JournalRecordToJson(_JournalRecord instance) =>
    <String, dynamic>{
      'dateWithTime': instance.dateTime.toIso8601String(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };
