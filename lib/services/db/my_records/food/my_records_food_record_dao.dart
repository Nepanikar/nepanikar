import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
import 'package:sembast/sembast.dart';

class MyRecordsFoodRecordDao {
  MyRecordsFoodRecordDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(_storeKeyName);

  Future<MyRecordsFoodRecordDao> init() async {
    registry.registerSingleton<MyRecordsFoodRecordDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, dynamic>?> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'my_records_food_records';

  Future<String> createRecord() async {
    return _store.add(_db, getEmptyDailyFoodRecord().toJson());
  }

  Future<void> updateRecordDate(
    String id,
    DailyFoodRecord record,
    DateTime newDate,
  ) async {
    final updatedRecord = record.copyWith(dateTime: newDate);
    await _store.record(id).update(_db, updatedRecord.toJson());
  }

  Future<void> updateMenuTakenState(
    String id,
    DailyFoodRecord record,
    FoodType foodType,
  ) async {
    final updatedRecord = record.getUpdatedIsTakenByFoodType(foodType);
    await _store.record(id).update(_db, updatedRecord.toJson());
  }

  Future<void> updateFoodTypeAnswer(
    String id,
    DailyFoodRecord record,
    DailyFoodRecordAnswer foodTypeAnswer,
  ) async {
    final updatedRecord = record.getUpdatedFromAnswer(foodTypeAnswer);
    await _store.record(id).update(_db, updatedRecord.toJson());
  }

  Future<void> _addRecords(List<DailyFoodRecord> items) async {
    final serializedItems = items.map((item) => item.toJson()).toList();
    await _store.addAll(_db, serializedItems);
  }

  Future<void> deleteRecord(String key) async {
    await _store.record(key).delete(_db);
  }

  Stream<DailyFoodRecord?> watchRecordById(String key) =>
      _store.record(key).onSnapshot(_db).map((snapshot) {
        final json = snapshot?.value;
        if (json == null) return null;
        return DailyFoodRecord.fromJson(json);
      });

  Stream<Map<String, DailyFoodRecord>> get allRecordsStream => _store
          .query(finder: Finder(sortOrders: [SortOrder(FilterKeys.dateWithTime, false)]))
          .onSnapshots(_db)
          .map((event) {
        final entries = event
            .map((e) {
              final value = e.value;
              if (value == null) return null;
              final model = DailyFoodRecord.fromJson(value);
              return MapEntry<String, DailyFoodRecord>(e.key, model);
            })
            .whereType<MapEntry<String, DailyFoodRecord>>()
            .toList();
        return Map.fromEntries(entries);
      });

  Future<void> doOldVersionMigration(MyRecordsFoodDTO foodConfig) async {
    final records = foodConfig.records;
    if (records != null) {
      final foodRecords = records
          .map(
            (r) => DailyFoodRecord(
              dateTime: r.date,
              answers: r.answers
                  .map(
                    (a) => DailyFoodRecordAnswer(
                      foodType: a.foodType,
                      isTaken: a.isTaken,
                      questionTextAnswers: a.textQuestionAnswers
                          .map(
                            (e) => FoodQuestionTextAnswer(
                              foodQuestionText: e.item1,
                              answer: e.item2,
                            ),
                          )
                          .toList(),
                      tickedQuestionFeels: a.feelTickedAnswers,
                      tickedQuestionProblems: a.problemTickedAnswers,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList();
      await _addRecords(foodRecords);
    }
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
