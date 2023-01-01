// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_food_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodQuestionTextAnswer _$$_FoodQuestionTextAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_FoodQuestionTextAnswer(
      foodQuestionText:
          $enumDecode(_$FoodQuestionTextEnumMap, json['foodQuestionText']),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$_FoodQuestionTextAnswerToJson(
        _$_FoodQuestionTextAnswer instance) =>
    <String, dynamic>{
      'foodQuestionText': _$FoodQuestionTextEnumMap[instance.foodQuestionText]!,
      'answer': instance.answer,
    };

const _$FoodQuestionTextEnumMap = {
  FoodQuestionText.when: 'when',
  FoodQuestionText.where: 'where',
  FoodQuestionText.$with: r'$with',
  FoodQuestionText.what: 'what',
};

_$_DailyFoodRecordAnswer _$$_DailyFoodRecordAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_DailyFoodRecordAnswer(
      foodType: $enumDecode(_$FoodTypeEnumMap, json['foodType']),
      isTaken: json['isTaken'] as bool? ?? false,
      questionTextAnswers: (json['questionTextAnswers'] as List<dynamic>?)
              ?.map((e) =>
                  FoodQuestionTextAnswer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tickedQuestionFeels: (json['tickedQuestionFeels'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FoodQuestionFeelEnumMap, e))
              .toList() ??
          const [],
      tickedQuestionProblems: (json['tickedQuestionProblems'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FoodQuestionProblemEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DailyFoodRecordAnswerToJson(
        _$_DailyFoodRecordAnswer instance) =>
    <String, dynamic>{
      'foodType': _$FoodTypeEnumMap[instance.foodType]!,
      'isTaken': instance.isTaken,
      'questionTextAnswers':
          instance.questionTextAnswers.map((e) => e.toJson()).toList(),
      'tickedQuestionFeels': instance.tickedQuestionFeels
          .map((e) => _$FoodQuestionFeelEnumMap[e]!)
          .toList(),
      'tickedQuestionProblems': instance.tickedQuestionProblems
          .map((e) => _$FoodQuestionProblemEnumMap[e]!)
          .toList(),
    };

const _$FoodTypeEnumMap = {
  FoodType.breakfast: 'breakfast',
  FoodType.amSnack: 'amSnack',
  FoodType.lunch: 'lunch',
  FoodType.pmSnack: 'pmSnack',
  FoodType.dinner: 'dinner',
  FoodType.secondDinner: 'secondDinner',
};

const _$FoodQuestionFeelEnumMap = {
  FoodQuestionFeel.happy: 'happy',
  FoodQuestionFeel.satisfied: 'satisfied',
  FoodQuestionFeel.proud: 'proud',
  FoodQuestionFeel.fear: 'fear',
  FoodQuestionFeel.anger: 'anger',
  FoodQuestionFeel.anxiety: 'anxiety',
  FoodQuestionFeel.unsatisfied: 'unsatisfied',
  FoodQuestionFeel.disgusted: 'disgusted',
  FoodQuestionFeel.sad: 'sad',
  FoodQuestionFeel.stress: 'stress',
};

const _$FoodQuestionProblemEnumMap = {
  FoodQuestionProblem.vomit: 'vomit',
  FoodQuestionProblem.exercise: 'exercise',
  FoodQuestionProblem.selfHarm: 'selfHarm',
  FoodQuestionProblem.laxative: 'laxative',
  FoodQuestionProblem.anxietyAttack: 'anxietyAttack',
};

_$_DailyFoodRecord _$$_DailyFoodRecordFromJson(Map<String, dynamic> json) =>
    _$_DailyFoodRecord(
      dateTime: DateTime.parse(json['dateWithTime'] as String),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => DailyFoodRecordAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DailyFoodRecordToJson(_$_DailyFoodRecord instance) =>
    <String, dynamic>{
      'dateWithTime': instance.dateTime.toIso8601String(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };
