import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class DepressionActivityPlanDao extends NepanikarCheckListFormDao {
  DepressionActivityPlanDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<DepressionActivityPlanDao> init() async {
    registry.registerSingleton<DepressionActivityPlanDao>(this);
    return this;
  }

  static const _storeKeyName = 'depression_activity_plan';
}
