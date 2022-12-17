import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderFoodILikeDao extends NepanikarListFormDao {
  EatingDisorderFoodILikeDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderFoodILikeDao> init() async {
    registry.registerSingleton<EatingDisorderFoodILikeDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_food_i_like';
}
