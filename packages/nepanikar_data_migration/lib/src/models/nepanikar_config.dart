import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class NepanikarConfig extends Equatable {
  const NepanikarConfig._({
    required this.selfHarmModuleConfig,
    required this.relaxationModuleConfig,
  });

  factory NepanikarConfig.getData(Config config) {
    SelfHarmModuleDTO? selfHarmModuleConfig;
    try {
      selfHarmModuleConfig = SelfHarmModuleDTO.getData(config);
    } catch (_) {}
    RelaxationModuleDTO? relaxationModuleConfig;
    try {
      relaxationModuleConfig = RelaxationModuleDTO.getData(config);
    } catch (_) {}
    return NepanikarConfig._(
      selfHarmModuleConfig: selfHarmModuleConfig,
      relaxationModuleConfig: relaxationModuleConfig,
    );
  }

  final SelfHarmModuleDTO? selfHarmModuleConfig;
  final RelaxationModuleDTO? relaxationModuleConfig;

  @override
  List<Object?> get props => [selfHarmModuleConfig, relaxationModuleConfig];
}
