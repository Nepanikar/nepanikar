import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

part 'my_records_food_record_model.freezed.dart';
part 'my_records_food_record_model.g.dart';

@freezed
class FoodQuestionTextAnswer with _$FoodQuestionTextAnswer {
  const factory FoodQuestionTextAnswer({
    required FoodQuestionText foodQuestionText,
    required String answer,
  }) = _FoodQuestionTextAnswer;

  const FoodQuestionTextAnswer._();

  factory FoodQuestionTextAnswer.fromJson(Map<String, Object?> json) =>
      _$FoodQuestionTextAnswerFromJson(json);
}

@freezed
class DailyFoodRecordAnswer with _$DailyFoodRecordAnswer {
  const factory DailyFoodRecordAnswer({
    required FoodType foodType,
    @Default(false) bool isTaken,
    @Default([]) List<FoodQuestionTextAnswer> questionTextAnswers,
    @Default([]) List<FoodQuestionFeel> tickedQuestionFeels,
    @Default([]) List<FoodQuestionProblem> tickedQuestionProblems,
  }) = _DailyFoodRecordAnswer;

  const DailyFoodRecordAnswer._();

  factory DailyFoodRecordAnswer.fromJson(Map<String, Object?> json) =>
      _$DailyFoodRecordAnswerFromJson(json);
}

@freezed
class DailyFoodRecord with _$DailyFoodRecord {
  const factory DailyFoodRecord({
    // ignore: invalid_annotation_target
    @JsonKey(name: FilterKeys.dateWithTime) required DateTime dateTime,
    required List<DailyFoodRecordAnswer> answers,
  }) = _DailyFoodRecord;

  const DailyFoodRecord._();

  factory DailyFoodRecord.fromJson(Map<String, Object?> json) => _$DailyFoodRecordFromJson(json);
}
