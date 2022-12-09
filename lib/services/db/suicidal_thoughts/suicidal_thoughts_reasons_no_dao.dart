import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class SuicidalThoughtsReasonsNoDao extends NepanikarListFormDao {
  SuicidalThoughtsReasonsNoDao({
    required super.dbService,
  }) : super(storeKeyName: _storeKeyName);

  @override
  Future<SuicidalThoughtsReasonsNoDao> init() async {
    registry.registerSingleton<SuicidalThoughtsReasonsNoDao>(this);
    return this;
  }

  static const _storeKeyName = 'suicidal_thoughts_reasons_no';
}
