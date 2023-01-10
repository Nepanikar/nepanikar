import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsDiaryDTO extends Equatable {
  const MyRecordsDiaryDTO._({
    required this.recordEntries,
  });

  factory MyRecordsDiaryDTO.getAndroidData(Config config) {
    const sectionName = 'diaryRecords';

    final recordEntries = <MapEntry<DateTime, String>>[];
    final confLines = config.items(sectionName);

    if (confLines != null) {
      for (final confLine in confLines) {
        if (confLine.length == 2) {
          final key = confLine[0];
          final values = confLine[1];
          if (key != null && values != null && key.contains('value')) {
            final splitValues = values.split('|');
            if (splitValues.length >= 2) {
              final date = splitValues[0].getIniDateTimeValue(
                    cleanFromUnicodes: false,
                    dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
                  ) ??
                  DateTime(2000);
              final text = splitValues[1].getIniStrValue() ?? '';
              recordEntries.add(MapEntry(date, text));
            }
          }
        }
      }
    }

    return MyRecordsDiaryDTO._(
      recordEntries: recordEntries.isEmpty ? null : recordEntries,
    );
  }

  factory MyRecordsDiaryDTO.getIosData(Map<String, Object> config) {
    final diaryRecordsSize = config['diaryRecords.size']?.toString().getIniIntValue();

    final recordEntries = <MapEntry<DateTime, String>>[];
    if (diaryRecordsSize != null) {
      for (var i = 1; i <= diaryRecordsSize; i++) {
        final line = config['diaryRecords.$i.value']?.toString();
        if (line != null) {
          final splitValues = line.split('|');
          if (splitValues.length >= 2) {
            final date = splitValues[0].getIniDateTimeValue(
                  cleanFromUnicodes: false,
                  dateTimePattern: NepanikarConfigParser.QT_DATE_PATTERN,
                ) ??
                DateTime(2000);
            final text = splitValues[1].getIniStrValue() ?? '';
            recordEntries.add(MapEntry(date, text));
          }
        }
      }
    }

    return MyRecordsDiaryDTO._(
      recordEntries: recordEntries.isEmpty ? null : recordEntries,
    );
  }

  /// Key is the date, value is the text.
  final List<MapEntry<DateTime, String>>? recordEntries;

  @override
  List<Object?> get props => [recordEntries];
}
