import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderFoodChallengesDao extends NepanikarCheckListFormDao {
  EatingDisorderFoodChallengesDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderFoodChallengesDao> init() async {
    registry.registerSingleton<EatingDisorderFoodChallengesDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_food_challenges';
}
