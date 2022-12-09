import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderFoodMotivationDao extends NepanikarCheckListFormDao {
  EatingDisorderFoodMotivationDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderFoodMotivationDao> init() async {
    registry.registerSingleton<EatingDisorderFoodMotivationDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_food_motivation';
}
