import 'package:nepanikar/services/db/database_service.dart';
import 'package:sembast/sembast.dart';

typedef PlanFormItem = String;

abstract class NepanikarPlanFormDao {
  NepanikarPlanFormDao({
    required DatabaseService dbService,
    required String storeKeyName,
  })  : _dbService = dbService,
        _store = StoreRef(storeKeyName);

  // TODO: use @mustBeOverridden annotation, will be available in Dart 2.19
  Future<NepanikarPlanFormDao> init() async => this;

  final DatabaseService _dbService;
  final StoreRef<String, PlanFormItem?> _store;

  Database get _db => _dbService.database;

  String getFormItemKeyFromFormIndex(int formIndex) => 'plan_form_item_$formIndex';

  Future<void> saveFormText(int formIndex, {required String? text}) async {
    final key = getFormItemKeyFromFormIndex(formIndex);
    await _store.record(key).put(_db, text);
  }

  Stream<List<RecordSnapshot<String, PlanFormItem?>>> get allFormItemsRecordsStream =>
      _store.query().onSnapshots(_db);

  Future<void> doOldVersionMigration() async {
    // TODO: implement doOldVersionMigration
  }

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
