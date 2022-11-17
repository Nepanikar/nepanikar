import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/src/models/my_records/mood_track_dto.dart';

class MyRecordsModuleDTO extends Equatable {
  const MyRecordsModuleDTO._({
    required this.moodTrackConfig,
  });

  factory MyRecordsModuleDTO.getData(Config config) {
    MoodTrackDTO? moodTrackConfig;
    try {
      moodTrackConfig = MoodTrackDTO.getData(config);
    } catch (_) {}
    return MyRecordsModuleDTO._(
      moodTrackConfig: moodTrackConfig,
    );
  }

  final MoodTrackDTO? moodTrackConfig;

  @override
  List<Object?> get props => [moodTrackConfig];
}
