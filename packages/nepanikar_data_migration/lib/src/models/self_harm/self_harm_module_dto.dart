import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SelfHarmModuleDTO extends Equatable {
  const SelfHarmModuleDTO._({
    required this.selfHarmTimerConfig,
  });

  factory SelfHarmModuleDTO.getData(Config config) {
    SelfHarmTimerDTO? selfHarmTimerConfig;
    try {
      selfHarmTimerConfig = SelfHarmTimerDTO.getData(config);
    } catch (_) {}
    return SelfHarmModuleDTO._(
      selfHarmTimerConfig: selfHarmTimerConfig,
    );
  }

  final SelfHarmTimerDTO? selfHarmTimerConfig;

  @override
  List<Object?> get props => [selfHarmTimerConfig];
}
