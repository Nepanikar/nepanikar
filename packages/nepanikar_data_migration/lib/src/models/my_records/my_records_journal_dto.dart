import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:tuple/tuple.dart';

enum JournalQuestion { grateful, great, feel, three, improve }

class JournalRecordDTO extends Equatable {
  const JournalRecordDTO({
    required this.date,
    required this.answers,
  });

  final DateTime date;
  final List<Tuple2<JournalQuestion, String>> answers;

  @override
  List<Object> get props => [date, answers];
}

class MyRecordsJournalDTO extends Equatable {
  const MyRecordsJournalDTO._({
    required this.records,
  });

  factory MyRecordsJournalDTO.getAndroidData(Config config) {
    const sectionName = 'journalRecords';

    final records = <JournalRecordDTO>[];
    final confLines = config.items(sectionName);

    if (confLines != null) {
      for (final confLine in confLines) {
        if (confLine.length == 2) {
          final key = confLine[0];
          final values = confLine[1];
          if (key != null && values != null && key.contains('value')) {
            final splitValues = values.split('|');
            if (splitValues.length >= 6) {
              final date = splitValues[0].getIniDateTimeValue(
                    cleanFromUnicodes: false,
                    dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
                  ) ??
                  DateTime(2000);
              final answers = <Tuple2<JournalQuestion, String>>[];
              for (final journalQuestion in JournalQuestion.values) {
                // First item is the date, so we need to add 1 to the index.
                final answer =
                    splitValues.elementAtOrNull(journalQuestion.index + 1)?.getIniStrValue() ?? '';
                answers.add(Tuple2(journalQuestion, answer));
              }
              records.add(JournalRecordDTO(date: date, answers: answers));
            }
          }
        }
      }
    }

    return MyRecordsJournalDTO._(
      records: records.isEmpty ? null : records,
    );
  }

  factory MyRecordsJournalDTO.getIosData(Map<String, Object> config) {
    final journalRecordsSize = config['journalRecords.size']?.toString().getIniIntValue();

    final records = <JournalRecordDTO>[];
    if (journalRecordsSize != null) {
      for (var i = 1; i <= journalRecordsSize; i++) {
        final line = config['journalRecords.$i.value']?.toString();
        if (line != null) {
          final splitValues = line.split('|');
          if (splitValues.length >= 6) {
            final date = splitValues[0].getIniDateTimeValue(
                  cleanFromUnicodes: false,
                  dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
                ) ??
                DateTime(2000);
            final answers = <Tuple2<JournalQuestion, String>>[];
            for (final journalQuestion in JournalQuestion.values) {
              // First item is the date, so we need to add 1 to the index.
              final answer =
                  splitValues.elementAtOrNull(journalQuestion.index + 1)?.getIniStrValue() ?? '';
              answers.add(Tuple2(journalQuestion, answer));
            }
            records.add(JournalRecordDTO(date: date, answers: answers));
          }
        }
      }
    }

    return MyRecordsJournalDTO._(
      records: records.isEmpty ? null : records,
    );
  }

  final List<JournalRecordDTO>? records;

  @override
  List<Object?> get props => [records];
}
