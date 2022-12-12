import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderFoodAfraidOfDao extends NepanikarCheckListFormDao {
  EatingDisorderFoodAfraidOfDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderFoodAfraidOfDao> init() async {
    registry.registerSingleton<EatingDisorderFoodAfraidOfDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_food_afraid_of';
}
