import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderFoodCreativeDao extends NepanikarCheckListFormDao {
  EatingDisorderFoodCreativeDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderFoodCreativeDao> init() async {
    registry.registerSingleton<EatingDisorderFoodCreativeDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_food_creative';
}
