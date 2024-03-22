import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsMoodTrackDTO extends Equatable {
  const MyRecordsMoodTrackDTO._({
    required this.values,
    required this.summaries,
    this.descriptions,
  });

  factory MyRecordsMoodTrackDTO.getAndroidData(Config config, {String sectionName = 'moods'}) {
    final convertedValues = <DateTime, int>{};
    final convertedSummaries = <DateTime, String>{};
    final convertedDescriptions = <DateTime, String?>{};
    final confValues = config.items(sectionName);


    if (confValues != null) {
      for (final item in confValues) {
        String? description;
        if (item.length == 2) {
          final key = item[0];
          final keyValues = item[1];
          if (key != null && keyValues != null && key.contains('value')) {
            final split = keyValues.split('|');
            final dateTime = split[0].getIniDateTimeValue();
            final value = split[1].getIniIntValue();
            final summary = split[2].getIniStrValue();
            if(split.length > 3){
              description = split[3].getIniStrValue();
            }
            if (dateTime != null && value != null) {
              final date = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
              convertedValues[date] = value - 1;
              convertedSummaries[date] = summary!;
              convertedDescriptions[date] = description;
            }
          }
        }
      }
    }
    return MyRecordsMoodTrackDTO._(
      values: convertedValues.isEmpty ? null : convertedValues,
      summaries: convertedSummaries.isEmpty ? null : convertedSummaries,
      descriptions: convertedDescriptions.isEmpty ? null : convertedDescriptions,
    );
  }

  factory MyRecordsMoodTrackDTO.getIosData(
    Map<String, Object> config, {
    String sectionName = 'moods',
  }) {
    final moodValuesSize = config['$sectionName.size']?.toString().getIniIntValue();

    final convertedDescriptions = <DateTime, String?>{};
    final convertedValues = <DateTime, int>{};
    final convertedSummaries = <DateTime, String>{};

    if (moodValuesSize != null) {
      for (var i = 1; i <= moodValuesSize; i++) {
        String? description;
        final line = config['$sectionName.$i.value']?.toString();
        if (line != null) {
          final split = line.split('|');
          final dateTime = split[0].getIniDateTimeValue();
          final value = split[1].getIniIntValue();
          final summary = split[2].getIniStrValue();
          if(split.length > 3){
            description = split[3].getIniStrValue();
          }
          if (dateTime != null && value != null) {
            final date = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
            convertedValues[date] = value - 1;
            convertedSummaries[date] = summary!;
            convertedDescriptions[date] = description;
          }
        }
      }
    }
    return MyRecordsMoodTrackDTO._(
      values: convertedValues.isEmpty ? null : convertedValues,
      summaries: convertedSummaries.isEmpty ? null : convertedSummaries,
      descriptions: convertedDescriptions.isEmpty ? null : convertedDescriptions,
    );
  }

  factory MyRecordsMoodTrackDTO.fromValues(
      Map<DateTime, int> values,
      Map<DateTime, String> summaries,
      Map<DateTime, String> descriptions,
      ) => MyRecordsMoodTrackDTO._(values: values, summaries: summaries, descriptions: descriptions);

  /// The map of mood track values.
  ///
  /// Key is the date, value is the mood (0 - sad, 4 happy).
  final Map<DateTime, int>? values;
  final Map<DateTime, String>? summaries;
  final Map<DateTime, String?>? descriptions;

  @override
  List<Object?> get props => [values];
}
