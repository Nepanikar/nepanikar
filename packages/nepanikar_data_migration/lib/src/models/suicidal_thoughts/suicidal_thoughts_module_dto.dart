import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SuicidalThoughtsModuleDTO extends Equatable {
  const SuicidalThoughtsModuleDTO._({
    required this.suicidalThoughtsPlanConfig,
    required this.suicidalThoughtsReasonsNoConfig,
  });

  factory SuicidalThoughtsModuleDTO.getAndroidData(Config config) {
    NepanikarListFormDTO? suicidalThoughtsPlanConfig;
    try {
      suicidalThoughtsPlanConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'suicidePlan');
    } catch (_) {}

    NepanikarListFormDTO? suicidalThoughtsReasonsNoConfig;
    try {
      suicidalThoughtsReasonsNoConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'reasons');
    } catch (_) {}

    return SuicidalThoughtsModuleDTO._(
      suicidalThoughtsPlanConfig: suicidalThoughtsPlanConfig,
      suicidalThoughtsReasonsNoConfig: suicidalThoughtsReasonsNoConfig,
    );
  }

  factory SuicidalThoughtsModuleDTO.getIosData(Map<String, Object> config) {
    NepanikarListFormDTO? suicidalThoughtsPlanConfig;
    try {
      suicidalThoughtsPlanConfig =
          NepanikarListFormDTO.getIosData(config, sectionName: 'suicidePlan');
    } catch (_) {}

    NepanikarListFormDTO? suicidalThoughtsReasonsNoConfig;
    try {
      suicidalThoughtsReasonsNoConfig =
          NepanikarListFormDTO.getIosData(config, sectionName: 'reasons');
    } catch (_) {}

    return SuicidalThoughtsModuleDTO._(
      suicidalThoughtsPlanConfig: suicidalThoughtsPlanConfig,
      suicidalThoughtsReasonsNoConfig: suicidalThoughtsReasonsNoConfig,
    );
  }


  final NepanikarListFormDTO? suicidalThoughtsPlanConfig;
  final NepanikarListFormDTO? suicidalThoughtsReasonsNoConfig;

  @override
  List<Object?> get props => [
        suicidalThoughtsPlanConfig,
        suicidalThoughtsReasonsNoConfig,
      ];
}
