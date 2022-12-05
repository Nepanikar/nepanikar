import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class MoodTrackDao with CustomFilters {
  MoodTrackDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = intMapStoreFactory.store(_storeKeyName);

  Future<MoodTrackDao> init() async {
    registry.registerSingleton<MoodTrackDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<int, Map<String, Object?>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'mood_track';

  Future<void> saveMood(Mood mood, [DateTime? dateTime]) async {
    final dateTimeToSave = dateTime ?? DateTime.now();
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

  Stream<List<MoodTrack>> get allMoodTracksStream =>
      _store.query().onSnapshots(_db).map((snapshots) {
        final results = snapshots
            .map((snapshot) {
              final json = snapshot.value;
              try {
                return MoodTrack.fromJson(json);
              } catch (e) {
                return null;
              }
            })
            .whereType<MoodTrack>()
            .sorted((a, b) => a.date.compareTo(b.date))
            .toList();
        return results;
      });

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

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
