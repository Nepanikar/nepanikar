import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

class SelfHarmTimerDao {
  SelfHarmTimerDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = StoreRef(_storeKeyName);

  Future<SelfHarmTimerDao> init() async {
    registry.registerSingleton<SelfHarmTimerDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Timestamp?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'self_harm_timer';

  static const _selfHarmTimerCurrentTimestampKey = 'self_harm_timer_current_timestamp';
  static const _selfHarmTimerRecordStartTimestampKey = 'self_harm_timer_record_start_timestamp';
  static const _selfHarmTimerRecordEndTimestampKey = 'self_harm_timer_record_end_timestamp';

  Future<void> startSelfHarmTimer([DateTime? startDateTime]) async {
    final timestampNow = startDateTime != null ? Timestamp.fromDateTime(startDateTime.toUtc()) : Timestamp.now();
    await _store.record(_selfHarmTimerCurrentTimestampKey).put(_db, timestampNow);
  }

  Future<void> stopSelfHarmTimer() async {
    // Get start DateTime of the just stopped timer and remove the value.
    final timerStartDate = await getCurrentTimerStartDateTime();
    await _store.record(_selfHarmTimerCurrentTimestampKey).delete(_db);

    // Check if this is a new record.
    if (timerStartDate != null) {
      final dateTimeNow = DateTime.now().toUtc();
      final newPossibleRecordRange = DateTimeRange(start: timerStartDate, end: dateTimeNow);
      final timerBestRecordRange = await getBestTimerRecordDateTimeRange();
      if (timerBestRecordRange == null || newPossibleRecordRange.duration > timerBestRecordRange.duration) {
        await saveNewBestRecord(newPossibleRecordRange);
      }
    }
  }

  Future<void> saveNewBestRecord(DateTimeRange dateTimeRange) async {
    await _store.record(_selfHarmTimerRecordStartTimestampKey).put(_db, Timestamp.fromDateTime(dateTimeRange.start));
    await _store.record(_selfHarmTimerRecordEndTimestampKey).put(_db, Timestamp.fromDateTime(dateTimeRange.end));
  }

  Future<DateTime?> getCurrentTimerStartDateTime() async {
    final startTimestamp = await _store.record(_selfHarmTimerCurrentTimestampKey).get(_db);
    return startTimestamp?.toDateTime(isUtc: true).toLocal();
  }

  Future<DateTimeRange?> getBestTimerRecordDateTimeRange() async {
    final startRecordTimestamp = await _store.record(_selfHarmTimerRecordStartTimestampKey).get(_db);
    final endRecordTimestamp = await _store.record(_selfHarmTimerRecordEndTimestampKey).get(_db);
    if (startRecordTimestamp != null && endRecordTimestamp != null) {
      return DateTimeRange(
        start: startRecordTimestamp.toDateTime(isUtc: true).toLocal(),
        end: endRecordTimestamp.toDateTime(isUtc: true).toLocal(),
      );
    }
    return null;
  }

  Stream<DateTime?> get selfHarmTimerStartDateTimeStream => _store
      .record(_selfHarmTimerCurrentTimestampKey)
      .onSnapshot(_db)
      .map((snapshot) => snapshot?.value?.toDateTime(isUtc: true).toLocal());

  Stream<DateTimeRange?> get selfHarmTimerRecordStream => Rx.combineLatest2(
        _store.record(_selfHarmTimerRecordStartTimestampKey).onSnapshot(_db),
        _store.record(_selfHarmTimerRecordEndTimestampKey).onSnapshot(_db),
        (a, b) {
          final aVal = a?.value;
          final bVal = b?.value;
          debugPrint('selfHarmTimerRecordStream: start: $aVal, end: $bVal');
          if (aVal != null && bVal != null) {
            return DateTimeRange(
              start: aVal.toDateTime(isUtc: true).toLocal(),
              end: bVal.toDateTime(isUtc: true).toLocal(),
            );
          }
          return null;
        },
      );

  Future<void> doOldVersionMigration(SelfHarmTimerDTO timerConfig) async {
    if (timerConfig.currSelfHarmTimerStartDateTime != null) {
      await startSelfHarmTimer(timerConfig.currSelfHarmTimerStartDateTime);
    }

    if (timerConfig.selfHarmTimerRecord != null) {
      final nowUtc = DateTime.now().toUtc();
      await saveNewBestRecord(
        DateTimeRange(
          start: nowUtc.subtract(Duration(seconds: timerConfig.selfHarmTimerRecord!)),
          end: nowUtc,
        ),
      );
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
