import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class DepressionPraiseMyAchievementsDao extends NepanikarListFormDao {
  DepressionPraiseMyAchievementsDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<DepressionPraiseMyAchievementsDao> init() async {
    registry.registerSingleton<DepressionPraiseMyAchievementsDao>(this);
    return this;
  }

  static const _storeKeyName = 'depression_praise_my_achievements';
}
