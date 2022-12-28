import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SuicidalThoughtsModuleDTO extends Equatable {
  const SuicidalThoughtsModuleDTO._({
    required this.suicidalThoughtsPlanConfig,
    required this.suicidalThoughtsReasonsNoConfig,
  });

  factory SuicidalThoughtsModuleDTO.getData(Config config) {
    NepanikarListFormDTO? suicidalThoughtsPlanConfig;
    try {
      suicidalThoughtsPlanConfig = NepanikarListFormDTO.getData(config, sectionName: 'suicidePlan');
    } catch (_) {}

    NepanikarListFormDTO? suicidalThoughtsReasonsNoConfig;
    try {
      suicidalThoughtsReasonsNoConfig =
          NepanikarListFormDTO.getData(config, sectionName: 'reasons');
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
