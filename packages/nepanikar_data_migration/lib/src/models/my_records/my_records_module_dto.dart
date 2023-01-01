import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsModuleDTO extends Equatable {
  const MyRecordsModuleDTO._({
    required this.moodTrackConfig,
    required this.sleepTrackConfig,
    required this.diaryConfig,
    required this.journalConfig,
    required this.foodRecordConfig,
  });

  factory MyRecordsModuleDTO.getData(Config config) {
    MyRecordsMoodTrackDTO? moodTrackConfig;
    try {
      moodTrackConfig = MyRecordsMoodTrackDTO.getData(config);
    } catch (_) {}

    MyRecordsSleepTrackDTO? sleepTrackConfig;
    try {
      sleepTrackConfig = MyRecordsSleepTrackDTO.getData(config);
    } catch (_) {}

    MyRecordsDiaryDTO? diaryConfig;
    try {
      diaryConfig = MyRecordsDiaryDTO.getData(config);
    } catch (_) {}

    MyRecordsJournalDTO? journalConfig;
    try {
      journalConfig = MyRecordsJournalDTO.getData(config);
    } catch (_) {}

    MyRecordsFoodDTO? foodConfig;
    try {
      foodConfig = MyRecordsFoodDTO.getData(config);
    } catch (_) {}

    return MyRecordsModuleDTO._(
      moodTrackConfig: moodTrackConfig,
      sleepTrackConfig: sleepTrackConfig,
      diaryConfig: diaryConfig,
      journalConfig: journalConfig,
      foodRecordConfig: foodConfig,
    );
  }

  final MyRecordsMoodTrackDTO? moodTrackConfig;
  final MyRecordsSleepTrackDTO? sleepTrackConfig;
  final MyRecordsDiaryDTO? diaryConfig;
  final MyRecordsJournalDTO? journalConfig;
  final MyRecordsFoodDTO? foodRecordConfig;

  @override
  List<Object?> get props => [
        moodTrackConfig,
        sleepTrackConfig,
        diaryConfig,
        journalConfig,
        foodRecordConfig,
      ];
}
