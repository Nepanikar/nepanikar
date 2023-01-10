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

  factory NepanikarConfig.getAndroidData(Config config) {
    DepressionModuleDTO? depressionModuleConfig;
    try {
      depressionModuleConfig = DepressionModuleDTO.getAndroidData(config);
    } catch (_) {}

    SelfHarmModuleDTO? selfHarmModuleConfig;
    try {
      selfHarmModuleConfig = SelfHarmModuleDTO.getAndroidData(config);
    } catch (_) {}

    SuicidalThoughtsModuleDTO? suicidalThoughtsModuleConfig;
    try {
      suicidalThoughtsModuleConfig = SuicidalThoughtsModuleDTO.getAndroidData(config);
    } catch (_) {}

    EatingDisorderModuleDTO? eatingDisorderModuleConfig;
    try {
      eatingDisorderModuleConfig = EatingDisorderModuleDTO.getAndroidData(config);
    } catch (_) {}

    MyRecordsModuleDTO? myRecordsModuleConfig;
    try {
      myRecordsModuleConfig = MyRecordsModuleDTO.getAndroidData(config);
    } catch (_) {}

    MyContactsModuleDTO? myContactsModuleConfig;
    try {
      myContactsModuleConfig = MyContactsModuleDTO.getAndroidData(config);
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

  factory NepanikarConfig.getIosData(Map<String, Object> config) {
    DepressionModuleDTO? depressionModuleConfig;
    try {
      depressionModuleConfig = DepressionModuleDTO.getIosData(config);
    } catch (_) {}

    SelfHarmModuleDTO? selfHarmModuleConfig;
    try {
      selfHarmModuleConfig = SelfHarmModuleDTO.getIosData(config);
    } catch (_) {}

    SuicidalThoughtsModuleDTO? suicidalThoughtsModuleConfig;
    try {
      suicidalThoughtsModuleConfig = SuicidalThoughtsModuleDTO.getIosData(config);
    } catch (_) {}

    EatingDisorderModuleDTO? eatingDisorderModuleConfig;
    try {
      eatingDisorderModuleConfig = EatingDisorderModuleDTO.getIosData(config);
    } catch (_) {}

    MyRecordsModuleDTO? myRecordsModuleConfig;
    try {
      myRecordsModuleConfig = MyRecordsModuleDTO.getIosData(config);
    } catch (_) {}

    MyContactsModuleDTO? myContactsModuleConfig;
    try {
      myContactsModuleConfig = MyContactsModuleDTO.getIosData(config);
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
