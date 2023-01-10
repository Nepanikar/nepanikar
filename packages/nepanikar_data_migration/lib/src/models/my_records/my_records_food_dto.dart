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
    required this.isTaken,
    required this.textQuestionAnswers,
    required this.feelTickedAnswers,
    required this.problemTickedAnswers,
  });

  final FoodType foodType;
  final bool isTaken;
  final List<Tuple2<FoodQuestionText, String>> textQuestionAnswers;
  final List<FoodQuestionFeel> feelTickedAnswers;
  final List<FoodQuestionProblem> problemTickedAnswers;

  @override
  List<Object> get props =>
      [foodType, isTaken, textQuestionAnswers, feelTickedAnswers, problemTickedAnswers];

  @override
  String toString() {
    return 'FoodRecordAnswerDTO(foodType: $foodType, isTaken: $isTaken, textQuestionAnswers: $textQuestionAnswers, feelTickedAnswers: $feelTickedAnswers, problemTickedAnswers: $problemTickedAnswers)';
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

FoodRecordAnswerDTO _getFoodRecordAnswer({
  required FoodType foodType,
  required bool isTaken,
  required String? dataConfigLine,
}) {
  final textQuestionAnswers = <Tuple2<FoodQuestionText, String>>[];
  final feelTickedAnswers = <FoodQuestionFeel>[];
  final problemTickedAnswers = <FoodQuestionProblem>[];

  if (dataConfigLine == null) {
    return FoodRecordAnswerDTO(
      foodType: foodType,
      isTaken: isTaken,
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

    final feelAnswers = dataConfigLineParts.elementAtOrNull(5);
    if (feelAnswers != null && feelAnswers.length == 10) {
      for (final feelQuestion in FoodQuestionFeel.values) {
        final answerBool = feelAnswers.split('').elementAtOrNull(feelQuestion.index);
        if (answerBool == '1') {
          feelTickedAnswers.add(feelQuestion);
        }
      }
    }

    final problemAnswers = dataConfigLineParts.elementAtOrNull(6);
    if (problemAnswers != null && problemAnswers.length == 5) {
      for (final problemQuestion in FoodQuestionProblem.values) {
        final answerBool = problemAnswers.split('').elementAtOrNull(problemQuestion.index);
        if (answerBool == '1') {
          problemTickedAnswers.add(problemQuestion);
        }
      }
    }
  }

  return FoodRecordAnswerDTO(
    foodType: foodType,
    isTaken: isTaken,
    textQuestionAnswers: textQuestionAnswers,
    feelTickedAnswers: feelTickedAnswers,
    problemTickedAnswers: problemTickedAnswers,
  );
}

class MyRecordsFoodDTO extends Equatable {
  const MyRecordsFoodDTO._({
    required this.records,
  });

  factory MyRecordsFoodDTO.getAndroidData(Config config) {
    final records = <FoodRecordDTO>[];

    final foodRecordsDateMap = config.itemsToMap('foodRecordDates');

    final foodTypeBreakfastMap = config.itemsToMap('foodRecordBreakfast');
    final foodTypeAmSnackMap = config.itemsToMap('foodRecordAmSnack');
    final foodTypeLunchMap = config.itemsToMap('foodRecordLunch');
    final foodTypePmSnackMap = config.itemsToMap('foodRecordPmSnack');
    final foodTypeDinnerMap = config.itemsToMap('foodRecordDinner');
    final foodTypeSecondDinnerMap = config.itemsToMap('foodRecordSecondDinner');

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

          bool getIsTaken(int index) {
            final isTaken = splitValues.elementAtOrNull(index);
            if (isTaken == null) return false;
            return isTaken != '-1';
          }

          final answers = <FoodRecordAnswerDTO>[];
          answers.addAll(
            [
              _getFoodRecordAnswer(
                foodType: FoodType.breakfast,
                isTaken: getIsTaken(1),
                dataConfigLine: foodTypeBreakfastMap?[record.key],
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.amSnack,
                isTaken: getIsTaken(2),
                dataConfigLine: foodTypeAmSnackMap?[record.key],
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.lunch,
                isTaken: getIsTaken(3),
                dataConfigLine: foodTypeLunchMap?[record.key],
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.pmSnack,
                isTaken: getIsTaken(4),
                dataConfigLine: foodTypePmSnackMap?[record.key],
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.dinner,
                isTaken: getIsTaken(5),
                dataConfigLine: foodTypeDinnerMap?[record.key],
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.secondDinner,
                isTaken: getIsTaken(6),
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

  factory MyRecordsFoodDTO.getIosData(Map<String, Object> config) {
    final foodRecordsDatesSize = config['foodRecordDates.size']?.toString().getIniIntValue();

    const foodTypeBreakfastKey = 'foodRecordBreakfast';
    const foodTypeAmSnackKey = 'foodRecordAmSnack';
    const foodTypeLunchKey = 'foodRecordLunch';
    const foodTypePmSnackKey = 'foodRecordPmSnack';
    const foodTypeDinnerKey = 'foodRecordDinner';
    const foodTypeSecondDinnerKey = 'foodRecordSecondDinner';

    final records = <FoodRecordDTO>[];
    if (foodRecordsDatesSize != null) {
      for (var i = 1; i <= foodRecordsDatesSize; i++) {
        final foodRecordDateLine = config['foodRecordDates.$i.value']?.toString();
        if (foodRecordDateLine == null) continue;
        final splitValues = foodRecordDateLine.split('|');
        if (splitValues.isNotEmpty) {
          final date = splitValues.first.getIniDateTimeValue(
                cleanFromUnicodes: false,
                dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
              ) ??
              DateTime(2000);

          bool getIsTaken(int index) {
            final isTaken = splitValues.elementAtOrNull(index);
            if (isTaken == null) return false;
            return isTaken != '-1';
          }

          final answers = <FoodRecordAnswerDTO>[];
          answers.addAll(
            [
              _getFoodRecordAnswer(
                foodType: FoodType.breakfast,
                isTaken: getIsTaken(1),
                dataConfigLine: config['$foodTypeBreakfastKey.$i.value']?.toString(),
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.amSnack,
                isTaken: getIsTaken(2),
                dataConfigLine: config['$foodTypeAmSnackKey.$i.value']?.toString(),
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.lunch,
                isTaken: getIsTaken(3),
                dataConfigLine: config['$foodTypeLunchKey.$i.value']?.toString(),
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.pmSnack,
                isTaken: getIsTaken(4),
                dataConfigLine: config['$foodTypePmSnackKey.$i.value']?.toString(),
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.dinner,
                isTaken: getIsTaken(5),
                dataConfigLine: config['$foodTypeDinnerKey.$i.value']?.toString(),
              ),
              _getFoodRecordAnswer(
                foodType: FoodType.secondDinner,
                isTaken: getIsTaken(6),
                dataConfigLine: config['$foodTypeSecondDinnerKey.$i.value']?.toString(),
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
