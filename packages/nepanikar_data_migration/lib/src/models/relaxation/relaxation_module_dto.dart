import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/src/models/relaxation/mood_track_dto.dart';

class RelaxationModuleDTO extends Equatable {
  const RelaxationModuleDTO._({
    required this.moodTrackConfig,
  });

  factory RelaxationModuleDTO.getData(Config config) {
    MoodTrackDTO? moodTrackConfig;
    try {
      moodTrackConfig = MoodTrackDTO.getData(config);
    } catch (_) {}
    return RelaxationModuleDTO._(
      moodTrackConfig: moodTrackConfig,
    );
  }

  final MoodTrackDTO? moodTrackConfig;

  @override
  List<Object?> get props => [moodTrackConfig];
}
