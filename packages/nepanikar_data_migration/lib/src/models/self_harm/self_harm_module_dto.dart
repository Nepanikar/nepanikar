import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SelfHarmModuleDTO extends Equatable {
  const SelfHarmModuleDTO._({
    required this.selfHarmHelpedConfig,
    required this.selfHarmPlanConfig,
    required this.selfHarmTimerConfig,
  });

  factory SelfHarmModuleDTO.getData(Config config) {
    NepanikarListFormDTO? selfHarmHelpedConfig;
    try {
      selfHarmHelpedConfig = NepanikarListFormDTO.getData(config, sectionName: 'selfHarmHelped');
    } catch (_) {}

    NepanikarListFormDTO? selfHarmPlanConfig;
    try {
      selfHarmPlanConfig = NepanikarListFormDTO.getData(config, sectionName: 'selfHarmPlan');
    } catch (_) {}

    SelfHarmTimerDTO? selfHarmTimerConfig;
    try {
      selfHarmTimerConfig = SelfHarmTimerDTO.getData(config);
    } catch (_) {}
    return SelfHarmModuleDTO._(
      selfHarmHelpedConfig: selfHarmHelpedConfig,
      selfHarmPlanConfig: selfHarmPlanConfig,
      selfHarmTimerConfig: selfHarmTimerConfig,
    );
  }

  final NepanikarListFormDTO? selfHarmHelpedConfig;
  final NepanikarListFormDTO? selfHarmPlanConfig;
  final SelfHarmTimerDTO? selfHarmTimerConfig;

  @override
  List<Object?> get props => [selfHarmHelpedConfig, selfHarmPlanConfig, selfHarmTimerConfig];
}
