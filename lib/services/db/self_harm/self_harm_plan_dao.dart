import 'package:nepanikar/services/db/common/nepanikar_plan_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class SelfHarmPlanDao extends NepanikarPlanFormDao {
  SelfHarmPlanDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<SelfHarmPlanDao> init() async {
    registry.registerSingleton<SelfHarmPlanDao>(this);
    return this;
  }

  static const _storeKeyName = 'self_harm_plan';
}
