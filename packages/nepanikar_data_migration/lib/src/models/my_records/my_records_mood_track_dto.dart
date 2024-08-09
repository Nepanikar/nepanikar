import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsMoodTrackDTO extends Equatable {
  const MyRecordsMoodTrackDTO._({
    required this.values,
    required this.summaries,
    this.descriptions,
    this.emotions,
  });

  factory MyRecordsMoodTrackDTO.getAndroidData(Config config, {String sectionName = 'moods'}) {
    final convertedValues = <DateTime, int>{};
    final convertedSummaries = <DateTime, String>{};
    final convertedDescriptions = <DateTime, String?>{};
    final convertedEmotions = <DateTime, List<String>>{};
    final confValues = config.items(sectionName);


    if (confValues != null) {
      for (final item in confValues) {
        String? description, summary;
        int? value;

        if (item.length == 2) {
          final key = item[0];
          final keyValues = item[1];
          if (key != null && keyValues != null && key.contains('value')) {
            final split = keyValues.split('|');
            final dateTime = split[0].getIniDateTimeValue();
            if(split.length > 1) {
              value = split[1].getIniIntValue();
            }
            final emotions = split.length > 2 ? split[2].split(',').cast<String>() : [].cast<String>();
            if(split.length > 3){
              summary = split[3].getIniStrValue();
            }
            if(split.length > 4) {
              description = split[4].getIniStrValue();
            }
            if (dateTime != null && value != null) {
              final date = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
              convertedValues[date] = value - 1;
              convertedEmotions[date] = emotions;
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
      emotions: convertedEmotions.isEmpty ? null : convertedEmotions,
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
    final convertedEmotions = <DateTime, List<String>>{};

    if (moodValuesSize != null) {
      for (var i = 1; i <= moodValuesSize; i++) {
        String? description, summary;
        List<String> emotions = [];
        int? value;

        final line = config['$sectionName.$i.value']?.toString();
        if (line != null) {
          final split = line.split('|');
          final dateTime = split[0].getIniDateTimeValue();
          if (split.length > 1) {
            value = split[1].getIniIntValue();
          }
          emotions = split.length > 2 ? split[2].split(',').cast<String>() : <String>[];
          if (split.length > 3) {
            summary = split[3];
          }
          if (split.length > 4) {
            description = split[4];
          }
          if (dateTime != null && value != null) {
            final date = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
            convertedValues[date] = value;
            convertedEmotions[date] = emotions;
            convertedSummaries[date] = summary ?? '';
            convertedDescriptions[date] = description;
          }
        }
      }
    }
    return MyRecordsMoodTrackDTO._(
      values: convertedValues.isEmpty ? null : convertedValues,
      summaries: convertedSummaries.isEmpty ? null : convertedSummaries,
      descriptions: convertedDescriptions.isEmpty ? null : convertedDescriptions,
      emotions:  convertedEmotions.isEmpty ? null : convertedEmotions,
    );
  }

  factory MyRecordsMoodTrackDTO.fromValues(
      Map<DateTime, int> values,
      Map<DateTime, String> summaries,
      Map<DateTime, String> descriptions,
      Map<DateTime, List<String>> emotions,
      ) => MyRecordsMoodTrackDTO._(values: values, summaries: summaries, descriptions: descriptions, emotions: emotions);

  /// The map of mood track values.
  ///
  /// Key is the date, value is the mood (0 - sad, 4 happy).
  final Map<DateTime, int>? values;
  final Map<DateTime, String>? summaries;
  final Map<DateTime, String?>? descriptions;
  final Map<DateTime, List<String>>? emotions;

  @override
  List<Object?> get props => [values];
}
