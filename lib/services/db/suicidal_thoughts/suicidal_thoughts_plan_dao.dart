import 'package:nepanikar/services/db/common/nepanikar_plan_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class SuicidalThoughtsPlanDao extends NepanikarPlanFormDao {
  SuicidalThoughtsPlanDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<SuicidalThoughtsPlanDao> init() async {
    registry.registerSingleton<SuicidalThoughtsPlanDao>(this);
    return this;
  }

  static const _storeKeyName = 'suicidal_thoughts_plan';
}
