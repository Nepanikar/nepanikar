import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class NepanikarConfig extends Equatable {
  const NepanikarConfig._({
    required this.selfHarmModuleConfig,
    required this.myRecordsModuleConfig,
  });

  factory NepanikarConfig.getData(Config config) {
    SelfHarmModuleDTO? selfHarmModuleConfig;
    try {
      selfHarmModuleConfig = SelfHarmModuleDTO.getData(config);
    } catch (_) {}

    MyRecordsModuleDTO? myRecordsModuleConfig;
    try {
      myRecordsModuleConfig = MyRecordsModuleDTO.getData(config);
    } catch (_) {}

    return NepanikarConfig._(
      selfHarmModuleConfig: selfHarmModuleConfig,
      myRecordsModuleConfig: myRecordsModuleConfig,
    );
  }

  final SelfHarmModuleDTO? selfHarmModuleConfig;
  final MyRecordsModuleDTO? myRecordsModuleConfig;

  @override
  List<Object?> get props => [selfHarmModuleConfig, myRecordsModuleConfig];
}
