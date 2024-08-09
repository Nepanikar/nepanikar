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
  static final List<String> defaultEmotions = [
    'Happy',
    'Sad',
    'Excited',
    'Relaxed',
    'Angry'
  ];
  static const emotionsKey = 100;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_records_mood_track';

  Future<void> saveMoodTrack(Mood mood, List<String>? emotions, String summary,
      String? description) async {
    final dateTimeToSave = DateTime.now();
    final date = DateTime.utc(
      dateTimeToSave.year,
      dateTimeToSave.month,
      dateTimeToSave.day,
      dateTimeToSave.hour,
      dateTimeToSave.minute,
      dateTimeToSave.second,
    );
    final moodTrack = MoodTrack(
      mood: mood,
      date: date,
      emotions: emotions,
      summary: summary,
      description: description,
    );
    final json = moodTrack.toJson();
    await _store.add(_db, json);
    debugPrint('MoodTrackDao: Added new mood track: $json');
  }

  Future<void> saveMoods(List<MoodTrack> items) async {
    await _store.addAll(_db, items.map((m) => m.toJson()).toList());
  }

  Future<void> saveSleepTrack(Mood mood) async {
    final dateTimeToSave = DateTime.now();
    final date = DateTime.utc(
        dateTimeToSave.year, dateTimeToSave.month, dateTimeToSave.day);
    final moodTrack = MoodTrack(mood: mood, date: date);
    final json = moodTrack.toJson();
    await _store
        .findFirst(_db, finder: Finder(filter: getDateEqualsFilter(date)))
        .then((record) async {
      if (record == null) {
        debugPrint(
            'MoodTrackDao: Not found mood for today - adding new: $json');
        await _store.add(_db, json);
      } else {
        debugPrint('MoodTrackDao: Found for today, updating to: $json');
        await _store.record(record.key).put(_db, json);
      }
    });
  }

  Future<void> updateMoodTrack(DateTime date, String summary,
      String description, List<String> emotions, Mood mood,) async {
    try {
      final dateString = date.toIso8601String();

      final recordFinder = Finder(filter: Filter.equals('date', dateString));
      final existingRecord = await _store.findFirst(_db, finder: recordFinder);

      if (existingRecord != null) {
        final updatedMoodTrack = MoodTrack(
          mood: mood,
          date: date,
          emotions: emotions,
          summary: summary,
          description: description,
        );
        final json = updatedMoodTrack.toJson();

        await _store.record(existingRecord.key).update(_db, json);
        debugPrint('MoodTrackDao: Updated mood track: $json');
      } else {
        debugPrint('MoodTrackDao: No record found to update for date: $dateString');
      }
    } catch (e) {
      debugPrint('Error updating mood track: $e');
      rethrow;
    }
  }

  Stream<List<MoodTrack>> get allMoodTracksStream => _store
      .query(finder: Finder(sortOrders: [SortOrder(FilterKeys.date)]))
      .onSnapshots(_db)
      .map((snapshots) => snapshots
          .map((snapshot) => MoodTrack.fromJson(snapshot.value))
          .toList());

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

  Stream<List<MoodTrack>> mostRecentMoodsTrackStream(int count) {
    final finder = Finder(
      sortOrders: [SortOrder('date', false)],
      limit: count,
    );

    return _store.query(finder: finder).onSnapshots(_db).map(
          (snapshotList) => snapshotList // Ensure the snapshot has data
              .map((snapshot) {
                final value = snapshot.value;
                if (value.isNotEmpty) {
                  return MoodTrack.fromJson(value);
                }
                return null; // Or handle the case where value is not as expected
              })
              .whereType<
                  MoodTrack>() // Ensure that only non-null MoodTrack objects are included
              .toList(),
        );
  }

  Future<List<MoodTrack>> getAllMoodTracks() async {
    final finder = Finder(sortOrders: [SortOrder(FilterKeys.date)]);
    final snapshots = await _store.find(_db, finder: finder);
    final moodTracks = snapshots
        .map((snapshot) => MoodTrack.fromJson(snapshot.value))
        .toList();
    return moodTracks;
  }

  Future<bool> isTodayTracked() async {
    final now = getNowDateUtc();
    final record = await _store.findFirst(_db,
        finder: Finder(filter: getDateEqualsFilter(now)));
    return record != null;
  }

  Future<int> getCountMoodTracks() async {
    final moodTracks = await getAllMoodTracks();
    return moodTracks.length;
  }

  Future<List<MoodTrack>> searchMoodTracks(
      String summary, List<String> emotions) async {
    final filters = <Filter>[];

    if (summary.isNotEmpty) {
      filters.add(Filter.matches('summary', summary));
    }

    if (emotions.isNotEmpty) {
      filters.add(
        Filter.custom((record) {
          final recordEmotions =
              (record['emotions'] as List<dynamic>?)?.cast<String>() ?? [];
          return emotions.every(recordEmotions.contains);
        }),
      );
    }

    final finder = Finder(
      filter: filters.isNotEmpty ? Filter.and(filters) : null,
      sortOrders: [SortOrder('date', false)],
    );

    final snapshots = await _store.find(_db, finder: finder);

    return snapshots
        .map((snapshot) => MoodTrack.fromJson(snapshot.value))
        .toList();
  }

  Future<void> doOldVersionMigration(
      MyRecordsMoodTrackDTO moodTrackConfig) async {
    final valuesMap = moodTrackConfig.values;
    final summariesMap = moodTrackConfig.summaries;
    final descriptionsMap = moodTrackConfig.descriptions;
    String? description;

    if (valuesMap != null && summariesMap != null) {
      final moodTracks = valuesMap.entries
          .map((dateMoodEntry) {
            final date = dateMoodEntry.key.toUtcDate();
            final mood = Mood.fromInteger(dateMoodEntry.value);
            final summary = summariesMap[date]!;
            description = descriptionsMap![date];

            return mood == null
                ? null
                : MoodTrack(
                    date: date,
                    mood: mood,
                    summary: summary,
                    description: description,
                  );
          })
          .whereType<MoodTrack>()
          .toList();
      await saveMoods(moodTracks);
    }
  }

  Future<void> deleteMoodTracksWithNoDescriptionOrSummary() async {
    final filter = Filter.or([
      Filter.isNull('description'),
      Filter.isNull('summary'),
    ]);

    final finder = Finder(filter: filter);

    await _store.delete(
      _db,
      finder: finder,
    );

    debugPrint('Deleted MoodTracks with null description or summary');
  }

  Future<void> deleteMoodTrackByDate(DateTime date) async {
    final finder =
        Finder(filter: Filter.equals('date', date.toIso8601String()));
    await _store.delete(
      _db,
      finder: finder,
    );
    debugPrint(
        'MoodTrackDao: Deleted mood track with date: ${date.toIso8601String()}');
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
