import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SelfHarmModuleDTO extends Equatable {
  const SelfHarmModuleDTO._({
    required this.selfHarmHelpedConfig,
    required this.selfHarmPlanConfig,
    required this.selfHarmTimerConfig,
  });

  factory SelfHarmModuleDTO.getAndroidData(Config config) {
    NepanikarListFormDTO? selfHarmHelpedConfig;
    try {
      selfHarmHelpedConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'selfHarmHelped');
    } catch (_) {}

    NepanikarListFormDTO? selfHarmPlanConfig;
    try {
      selfHarmPlanConfig = NepanikarListFormDTO.getAndroidData(config, sectionName: 'selfHarmPlan');
    } catch (_) {}

    SelfHarmTimerDTO? selfHarmTimerConfig;
    try {
      selfHarmTimerConfig = SelfHarmTimerDTO.getAndroidData(config);
    } catch (_) {}
    return SelfHarmModuleDTO._(
      selfHarmHelpedConfig: selfHarmHelpedConfig,
      selfHarmPlanConfig: selfHarmPlanConfig,
      selfHarmTimerConfig: selfHarmTimerConfig,
    );
  }

  factory SelfHarmModuleDTO.getIosData(Map<String, Object> config) {
    NepanikarListFormDTO? selfHarmHelpedConfig;
    try {
      selfHarmHelpedConfig = NepanikarListFormDTO.getIosData(config, sectionName: 'selfHarmHelped');
    } catch (_) {}

    NepanikarListFormDTO? selfHarmPlanConfig;
    try {
      selfHarmPlanConfig = NepanikarListFormDTO.getIosData(config, sectionName: 'selfHarmPlan');
    } catch (_) {}

    SelfHarmTimerDTO? selfHarmTimerConfig;
    try {
      selfHarmTimerConfig = SelfHarmTimerDTO.getIosData(config);
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
