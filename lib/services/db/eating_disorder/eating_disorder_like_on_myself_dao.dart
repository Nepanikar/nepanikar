import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class EatingDisorderLikeOnMyselfDao extends NepanikarListFormDao {
  EatingDisorderLikeOnMyselfDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<EatingDisorderLikeOnMyselfDao> init() async {
    registry.registerSingleton<EatingDisorderLikeOnMyselfDao>(this);
    return this;
  }

  static const _storeKeyName = 'eating_disorder_like_on_myself';
}
