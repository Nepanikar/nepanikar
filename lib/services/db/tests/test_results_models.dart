import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_results_models.freezed.dart';
part 'test_results_models.g.dart';

@freezed
abstract class TestResult with _$TestResult {
  const factory TestResult({
    required String testId,
    required DateTime completedAt,
    required int totalScore,
    required Map<String, String> answers, // question_id -> answer_id
  }) = _TestResult;

  const TestResult._();

  factory TestResult.fromJson(Map<String, Object?> json) =>
      _$TestResultFromJson(json);
}

@freezed
abstract class TestAnswer with _$TestAnswer {
  const factory TestAnswer({
    required String questionId,
    required String answerId,
    required int score,
  }) = _TestAnswer;

  const TestAnswer._();

  factory TestAnswer.fromJson(Map<String, Object?> json) =>
      _$TestAnswerFromJson(json);
}
