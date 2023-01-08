import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/app/l10n/ext.dart';
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

DailyFoodRecord getEmptyDailyFoodRecord() => DailyFoodRecord(
      dateTime: DateTime.now(),
      answers: [],
    );

DailyFoodRecordAnswer getEmptyDailyFoodRecordAnswer(FoodType foodType) => DailyFoodRecordAnswer(
      foodType: foodType,
      isTaken: false,
      questionTextAnswers: [],
      tickedQuestionFeels: [],
      tickedQuestionProblems: [],
    );

extension DailyFoodRecordExt on DailyFoodRecord {
  bool getIsFoodTaken(FoodType foodType) {
    final answer = answers.lastWhereOrNull((e) => e.foodType == foodType);
    return answer?.isTaken ?? false;
  }

  DailyFoodRecordAnswer getFoodRecordAnswerFromFoodType(FoodType foodType) =>
      answers.lastWhereOrNull((e) => e.foodType == foodType) ??
      getEmptyDailyFoodRecordAnswer(foodType);

  DailyFoodRecord getUpdatedFromAnswer(DailyFoodRecordAnswer updatedAnswer) {
    final answers = [...this.answers];
    final index = answers.indexWhere((e) => e.foodType == updatedAnswer.foodType);
    if (index == -1) {
      answers.add(updatedAnswer);
    } else {
      answers[index] = updatedAnswer;
    }
    return copyWith(answers: answers);
  }

  DailyFoodRecord getUpdatedIsTakenByFoodType(FoodType foodType) {
    final answer = getFoodRecordAnswerFromFoodType(foodType);
    final updatedAnswer = answer.copyWith(isTaken: !answer.isTaken);
    final updatedAnswers = answers.where((e) => e.foodType != foodType).toList()
      ..add(updatedAnswer);
    return copyWith(answers: updatedAnswers);
  }
}

extension DailyFoodRecordAnswerExt on DailyFoodRecordAnswer {
  bool getIsQuestionFeelTicked(FoodQuestionFeel foodQuestionFeel) {
    return tickedQuestionFeels.contains(foodQuestionFeel);
  }

  bool getIsQuestionProblemTicked(FoodQuestionProblem foodQuestionProblem) {
    return tickedQuestionProblems.contains(foodQuestionProblem);
  }
}

extension FoodTypeExt on FoodType {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case FoodType.breakfast:
        return l10n.food_breakfast;
      case FoodType.amSnack:
        return l10n.food_am_snack;
      case FoodType.lunch:
        return l10n.food_lunch;
      case FoodType.dinner:
        return l10n.food_dinner;
      case FoodType.pmSnack:
        return l10n.food_pm_snack;
      case FoodType.secondDinner:
        return l10n.food_second_dinner;
    }
  }
}

extension FoodQuestionTextExt on FoodQuestionText {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case FoodQuestionText.when:
        return l10n.food_record_when;
      case FoodQuestionText.where:
        return l10n.food_record_where;
      case FoodQuestionText.$with:
        return l10n.food_record_with;
      case FoodQuestionText.what:
        return l10n.food_record_what;
    }
  }
}

extension FoodQuestionFeelExt on FoodQuestionFeel {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case FoodQuestionFeel.happy:
        return l10n.food_problems_happy;
      case FoodQuestionFeel.satisfied:
        return l10n.food_problems_satisfied;
      case FoodQuestionFeel.proud:
        return l10n.food_problems_proud;
      case FoodQuestionFeel.fear:
        return l10n.food_problems_fear;
      case FoodQuestionFeel.anger:
        return l10n.food_problems_anger;
      case FoodQuestionFeel.anxiety:
        return l10n.food_problems_anxiety;
      case FoodQuestionFeel.unsatisfied:
        return l10n.food_problems_unsatisfied;
      case FoodQuestionFeel.disgusted:
        return l10n.food_problems_disgusted;
      case FoodQuestionFeel.sad:
        return l10n.food_problems_sad;
      case FoodQuestionFeel.stress:
        return l10n.food_problems_stress;
    }
  }
}

extension FoodQuestionProblemExt on FoodQuestionProblem {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case FoodQuestionProblem.vomit:
        return l10n.food_problems_vomit;
      case FoodQuestionProblem.exercise:
        return l10n.food_problems_exercise;
      case FoodQuestionProblem.selfHarm:
        return l10n.food_problems_self_harm;
      case FoodQuestionProblem.laxative:
        return l10n.food_problems_laxative;
      case FoodQuestionProblem.anxietyAttack:
        return l10n.food_problems_anxiety_attack;
    }
  }
}
