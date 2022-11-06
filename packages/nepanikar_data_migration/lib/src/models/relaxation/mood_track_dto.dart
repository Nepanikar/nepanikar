import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MoodTrackDTO extends Equatable {
  const MoodTrackDTO._({
    required this.values,
  });

  factory MoodTrackDTO.getData(Config config) {
    const sectionName = 'moods';

    final convertedValues = <DateTime, int>{};
    final confValues = config.items(sectionName);
    if (confValues != null && confValues.isNotEmpty) {
      for (final item in confValues) {
        if (item.length == 2) {
          final key = item[0];
          final keyValues = item[1];
          if (key != null && keyValues != null && key.contains('value')) {
            final split = keyValues.split('|');
            if (split.length == 2) {
              final dateTime = split[0].getIniDateTimeValue();
              final value = split[1].getIniIntValue();
              if (dateTime != null && value != null) {
                final date = DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
                convertedValues[date] = value;
              }
            }
          }
        }
      }
    }
    return MoodTrackDTO._(
      values: convertedValues,
    );
  }

  /// The map of mood track values.
  ///
  /// Key is the date, value is the mood (0 - sad, 4 happy).
  final Map<DateTime, int> values;

  @override
  List<Object> get props => [values];
}
