import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class MyRecordsSleepTrackDao extends MoodTrackDao {
  MyRecordsSleepTrackDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<MyRecordsSleepTrackDao> init() async {
    registry.registerSingleton<MyRecordsSleepTrackDao>(this);
    return this;
  }

  static const _storeKeyName = 'my_records_sleep_track';
}
