import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class DepressionNiceMadeHappyDao extends NepanikarListFormDao {
  DepressionNiceMadeHappyDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<DepressionNiceMadeHappyDao> init() async {
    registry.registerSingleton<DepressionNiceMadeHappyDao>(this);
    return this;
  }

  static const _storeKeyName = 'depression_nice_made_happy';
}
