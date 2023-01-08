import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:sembast/sembast.dart';

class MoodTrackDao with CustomFilters {
  MoodTrackDao({
    required DatabaseService dbService,
    String? storeKeyName,
  })  : _dbService = dbService,
        _store = intMapStoreFactory.store(storeKeyName ?? _storeKeyName);

  Future<MoodTrackDao> init() async {
    registry.registerSingleton<MoodTrackDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<int, Map<String, Object?>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_records_mood_track';

  Future<void> saveMood(Mood mood) async {
    final dateTimeToSave = DateTime.now();
    final date = DateTime.utc(dateTimeToSave.year, dateTimeToSave.month, dateTimeToSave.day);
    final moodTrack = MoodTrack(mood: mood, date: date);
    final json = moodTrack.toJson();
    await _store
        .findFirst(_db, finder: Finder(filter: getDateEqualsFilter(date)))
        .then((record) async {
      if (record == null) {
        debugPrint('MoodTrackDao: Not found mood for today - adding new: $json');
        await _store.add(_db, json);
      } else {
        debugPrint('MoodTrackDao: Found for today, updating to: $json');
        await _store.record(record.key).put(_db, json);
      }
    });
  }

  Future<void> saveMoods(List<MoodTrack> items) async {
    await _store.addAll(_db, items.map((m) => m.toJson()).toList());
  }

  Stream<List<MoodTrack>> get allMoodTracksStream => _store
      .query(finder: Finder(sortOrders: [SortOrder(FilterKeys.date)]))
      .onSnapshots(_db)
      .map((snapshots) => snapshots.map((snapshot) => MoodTrack.fromJson(snapshot.value)).toList());

  Stream<MoodTrack?> get latestMoodTrackStream => _store
          .query(finder: Finder(filter: getDateEqualsFilter(getNowDateUtc())))
          .onSnapshot(_db)
          .map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return null;
        try {
          final moodTrack = MoodTrack.fromJson(json);
          return moodTrack;
        } catch (e) {
          return null;
        }
      });

  Future<void> doOldVersionMigration(MyRecordsMoodTrackDTO moodTrackConfig) async {
    final valuesMap = moodTrackConfig.values;
    if (valuesMap != null) {
      final moodTracks = valuesMap.entries
          .map((dateMoodEntry) {
            final date = dateMoodEntry.key.toUtcDate();
            final mood = Mood.fromInteger(dateMoodEntry.value);
            return mood == null ? null : MoodTrack(date: date, mood: mood);
          })
          .whereType<MoodTrack>()
          .toList();
      await saveMoods(moodTracks);
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
