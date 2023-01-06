import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class NepanikarConfig extends Equatable {
  const NepanikarConfig._({
    required this.depressionModuleConfig,
    required this.selfHarmModuleConfig,
    required this.suicidalThoughtsModuleConfig,
    required this.eatingDisorderModuleConfig,
    required this.myRecordsModuleConfig,
    required this.myContactsModuleConfig,
  });

  factory NepanikarConfig.getData(Config config) {
    DepressionModuleDTO? depressionModuleConfig;
    try {
      depressionModuleConfig = DepressionModuleDTO.getData(config);
    } catch (_) {}

    SelfHarmModuleDTO? selfHarmModuleConfig;
    try {
      selfHarmModuleConfig = SelfHarmModuleDTO.getData(config);
    } catch (_) {}

    SuicidalThoughtsModuleDTO? suicidalThoughtsModuleConfig;
    try {
      suicidalThoughtsModuleConfig = SuicidalThoughtsModuleDTO.getData(config);
    } catch (_) {}

    EatingDisorderModuleDTO? eatingDisorderModuleConfig;
    try {
      eatingDisorderModuleConfig = EatingDisorderModuleDTO.getData(config);
    } catch (_) {}

    MyRecordsModuleDTO? myRecordsModuleConfig;
    try {
      myRecordsModuleConfig = MyRecordsModuleDTO.getData(config);
    } catch (_) {}

    MyContactsModuleDTO? myContactsModuleConfig;
    try {
      myContactsModuleConfig = MyContactsModuleDTO.getData(config);
    } catch (_) {}

    return NepanikarConfig._(
      depressionModuleConfig: depressionModuleConfig,
      selfHarmModuleConfig: selfHarmModuleConfig,
      suicidalThoughtsModuleConfig: suicidalThoughtsModuleConfig,
      eatingDisorderModuleConfig: eatingDisorderModuleConfig,
      myRecordsModuleConfig: myRecordsModuleConfig,
      myContactsModuleConfig: myContactsModuleConfig,
    );
  }

  final DepressionModuleDTO? depressionModuleConfig;
  final SelfHarmModuleDTO? selfHarmModuleConfig;
  final SuicidalThoughtsModuleDTO? suicidalThoughtsModuleConfig;
  final EatingDisorderModuleDTO? eatingDisorderModuleConfig;
  final MyRecordsModuleDTO? myRecordsModuleConfig;
  final MyContactsModuleDTO? myContactsModuleConfig;

  @override
  List<Object?> get props => [
        depressionModuleConfig,
        selfHarmModuleConfig,
        suicidalThoughtsModuleConfig,
        eatingDisorderModuleConfig,
        myRecordsModuleConfig,
        myContactsModuleConfig,
      ];
}
