import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class SelfHarmHelpedDao extends NepanikarListFormDao {
  SelfHarmHelpedDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<SelfHarmHelpedDao> init() async {
    registry.registerSingleton<SelfHarmHelpedDao>(this);
    return this;
  }

  static const _storeKeyName = 'self_harm_helped';
}
