// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_results_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestResult _$TestResultFromJson(Map<String, dynamic> json) => _TestResult(
  testId: json['testId'] as String,
  completedAt: DateTime.parse(json['completedAt'] as String),
  totalScore: (json['totalScore'] as num).toInt(),
  answers: Map<String, String>.from(json['answers'] as Map),
);

Map<String, dynamic> _$TestResultToJson(_TestResult instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'completedAt': instance.completedAt.toIso8601String(),
      'totalScore': instance.totalScore,
      'answers': instance.answers,
    };

_TestAnswer _$TestAnswerFromJson(Map<String, dynamic> json) => _TestAnswer(
  questionId: json['questionId'] as String,
  answerId: json['answerId'] as String,
  score: (json['score'] as num).toInt(),
);

Map<String, dynamic> _$TestAnswerToJson(_TestAnswer instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerId': instance.answerId,
      'score': instance.score,
    };
