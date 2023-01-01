import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:tuple/tuple.dart';

enum FoodType { breakfast, amSnack, lunch, pmSnack, dinner, secondDinner }

enum FoodQuestionText { when, where, $with, what }

enum FoodQuestionFeel {
  happy,
  satisfied,
  proud,
  fear,
  anger,
  anxiety,
  unsatisfied,
  disgusted,
  sad,
  stress,
}

enum FoodQuestionProblem { vomit, exercise, selfHarm, laxative, anxietyAttack }

class FoodRecordAnswerDTO extends Equatable {
  const FoodRecordAnswerDTO({
    required this.foodType,
    required this.textQuestionAnswers,
    required this.feelTickedAnswers,
    required this.problemTickedAnswers,
  });

  final FoodType foodType;
  final List<Tuple2<FoodQuestionText, String>> textQuestionAnswers;
  final List<FoodQuestionFeel> feelTickedAnswers;
  final List<FoodQuestionProblem> problemTickedAnswers;

  @override
  List<Object> get props =>
      [foodType, textQuestionAnswers, feelTickedAnswers, problemTickedAnswers];

  @override
  String toString() {
    return 'FoodRecordAnswerDTO(foodType: $foodType, textQuestionAnswers: $textQuestionAnswers, feelTickedAnswers: $feelTickedAnswers, problemTickedAnswers: $problemTickedAnswers)';
  }
}

class FoodRecordDTO extends Equatable {
  const FoodRecordDTO({
    required this.date,
    required this.answers,
  });

  final DateTime date;
  final List<FoodRecordAnswerDTO> answers;

  @override
  List<Object> get props => [date, answers];
}

class MyRecordsFoodDTO extends Equatable {
  const MyRecordsFoodDTO._({
    required this.records,
  });

  factory MyRecordsFoodDTO.getData(Config config) {
    final records = <FoodRecordDTO>[];

    final foodRecordsDateMap = config.itemsToMap('foodRecordDates');

    final foodTypeBreakfastMap = config.itemsToMap('foodRecordBreakfast');
    final foodTypeAmSnackMap = config.itemsToMap('foodRecordAmSnack');
    final foodTypeLunchMap = config.itemsToMap('foodRecordLunch');
    final foodTypePmSnackMap = config.itemsToMap('foodRecordPmSnack');
    final foodTypeDinnerMap = config.itemsToMap('foodRecordDinner');
    final foodTypeSecondDinnerMap = config.itemsToMap('foodRecordSecondDinner');

    FoodRecordAnswerDTO getFoodRecordAnswer({
      required FoodType foodType,
      required String? dataConfigLine,
    }) {
      final textQuestionAnswers = <Tuple2<FoodQuestionText, String>>[];
      final feelTickedAnswers = <FoodQuestionFeel>[];
      final problemTickedAnswers = <FoodQuestionProblem>[];

      if (dataConfigLine == null) {
        return FoodRecordAnswerDTO(
          foodType: foodType,
          textQuestionAnswers: textQuestionAnswers,
          feelTickedAnswers: feelTickedAnswers,
          problemTickedAnswers: problemTickedAnswers,
        );
      }

      final dataConfigLineParts = dataConfigLine.split('|');
      if (dataConfigLineParts.length >= 6) {
        for (final foodTextQuestion in FoodQuestionText.values) {
          if (foodTextQuestion.index < 4) {
            final answer = dataConfigLineParts.elementAtOrNull(foodTextQuestion.index);
            textQuestionAnswers.add(Tuple2(foodTextQuestion, answer ?? ''));
          }
        }

        for (final feelAnswer in FoodQuestionFeel.values) {
          final answer = dataConfigLineParts.elementAtOrNull(5);
          if (answer != null && answer.length == 10) {
            final answerBool = answer.split('').elementAtOrNull(feelAnswer.index);
            if (answerBool == '1') {
              feelTickedAnswers.add(feelAnswer);
            }
          }
        }

        for (final problemAnswer in FoodQuestionProblem.values) {
          final answer = dataConfigLineParts.elementAtOrNull(6);
          if (answer != null && answer.length == 5) {
            final answerBool = answer.split('').elementAtOrNull(problemAnswer.index);
            if (answerBool == '1') {
              problemTickedAnswers.add(problemAnswer);
            }
          }
        }
      }

      return FoodRecordAnswerDTO(
        foodType: foodType,
        textQuestionAnswers: textQuestionAnswers,
        feelTickedAnswers: feelTickedAnswers,
        problemTickedAnswers: problemTickedAnswers,
      );
    }

    if (foodRecordsDateMap != null) {
      for (final record in foodRecordsDateMap.entries) {
        if (record.value == null) continue;
        final splitValues = record.value!.split('|');
        if (splitValues.isNotEmpty) {
          final date = splitValues.first.getIniDateTimeValue(
                cleanFromUnicodes: false,
                dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
              ) ??
              DateTime(2000);

          final answers = <FoodRecordAnswerDTO>[];
          answers.addAll(
            [
              getFoodRecordAnswer(
                foodType: FoodType.breakfast,
                dataConfigLine: foodTypeBreakfastMap?[record.key],
              ),
              getFoodRecordAnswer(
                foodType: FoodType.amSnack,
                dataConfigLine: foodTypeAmSnackMap?[record.key],
              ),
              getFoodRecordAnswer(
                foodType: FoodType.lunch,
                dataConfigLine: foodTypeLunchMap?[record.key],
              ),
              getFoodRecordAnswer(
                foodType: FoodType.pmSnack,
                dataConfigLine: foodTypePmSnackMap?[record.key],
              ),
              getFoodRecordAnswer(
                foodType: FoodType.dinner,
                dataConfigLine: foodTypeDinnerMap?[record.key],
              ),
              getFoodRecordAnswer(
                foodType: FoodType.secondDinner,
                dataConfigLine: foodTypeSecondDinnerMap?[record.key],
              ),
            ],
          );

          records.add(FoodRecordDTO(date: date, answers: answers));
        }
      }
    }

    return MyRecordsFoodDTO._(
      records: records.isEmpty ? null : records,
    );
  }

  final List<FoodRecordDTO>? records;

  @override
  List<Object?> get props => [records];
}
