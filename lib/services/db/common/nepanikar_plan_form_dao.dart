import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';
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

  Future<void> _addFormTexts(List<String> texts) async {
    for (var i = 0; i < texts.length; i++) {
      final key = getFormItemKeyFromFormIndex(i);
      await _store.record(key).put(_db, texts[i]);
    }
  }

  Stream<List<RecordSnapshot<String, PlanFormItem?>>> get allFormItemsRecordsStream =>
      _store.query().onSnapshots(_db);

  Future<void> doOldVersionMigration(NepanikarListFormDTO planFormConfig) async {
    final planFormItems = planFormConfig.texts;
    if (planFormItems != null) {
      await _addFormTexts(planFormItems);
    }
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
