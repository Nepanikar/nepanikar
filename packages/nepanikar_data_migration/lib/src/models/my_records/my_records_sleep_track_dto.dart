import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsSleepTrackDTO extends Equatable {
  const MyRecordsSleepTrackDTO._({
    required this.values,
  });

  factory MyRecordsSleepTrackDTO.getData(Config config) {
    final values = MyRecordsMoodTrackDTO.getData(config, sectionName: 'sleep').values;
    return MyRecordsSleepTrackDTO._(
      values: values == null || values.isEmpty ? null : values,
    );
  }

  /// The map of sleep track values.
  ///
  /// Key is the date, value is the mood (0 - sad, 4 happy).
  final Map<DateTime, int>? values;

  @override
  List<Object?> get props => [values];
}
