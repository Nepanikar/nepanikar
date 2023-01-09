import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class DepressionModuleDTO extends Equatable {
  const DepressionModuleDTO._({
    required this.depressionActivityPlanConfig,
    required this.depressionNiceMadeHappyConfig,
    required this.depressionPraiseMyAchievementsConfig,
  });

  factory DepressionModuleDTO.getAndroidData(Config config) {
    NepanikarChecklistFormDTO? depressionActivityPlanConfig;
    try {
      depressionActivityPlanConfig = NepanikarChecklistFormDTO.getAndroidData(
        config,
        sectionTextsName: 'plan',
        sectionCheckboxStatesName: 'planC',
      );
    } catch (_) {}

    NepanikarListFormDTO? depressionNiceMadeHappyConfig;
    try {
      depressionNiceMadeHappyConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'nice');
    } catch (_) {}

    NepanikarListFormDTO? depressionPraiseMyAchievementsConfig;
    try {
      depressionPraiseMyAchievementsConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'praise');
    } catch (_) {}

    return DepressionModuleDTO._(
      depressionActivityPlanConfig: depressionActivityPlanConfig,
      depressionNiceMadeHappyConfig: depressionNiceMadeHappyConfig,
      depressionPraiseMyAchievementsConfig: depressionPraiseMyAchievementsConfig,
    );
  }

  factory DepressionModuleDTO.getIosData(Map<String, Object> config) {
    NepanikarChecklistFormDTO? depressionActivityPlanConfig;
    try {
      depressionActivityPlanConfig = NepanikarChecklistFormDTO.getIosData(
        config,
        sectionTextsName: 'plan',
        sectionCheckboxStatesName: 'planC',
      );
    } catch (_) {}

    NepanikarListFormDTO? depressionNiceMadeHappyConfig;
    try {
      depressionNiceMadeHappyConfig = NepanikarListFormDTO.getIosData(config, sectionName: 'nice');
    } catch (_) {}

    NepanikarListFormDTO? depressionPraiseMyAchievementsConfig;
    try {
      depressionPraiseMyAchievementsConfig =
          NepanikarListFormDTO.getIosData(config, sectionName: 'praise');
    } catch (_) {}

    return DepressionModuleDTO._(
      depressionActivityPlanConfig: depressionActivityPlanConfig,
      depressionNiceMadeHappyConfig: depressionNiceMadeHappyConfig,
      depressionPraiseMyAchievementsConfig: depressionPraiseMyAchievementsConfig,
    );
  }

  final NepanikarChecklistFormDTO? depressionActivityPlanConfig;
  final NepanikarListFormDTO? depressionNiceMadeHappyConfig;
  final NepanikarListFormDTO? depressionPraiseMyAchievementsConfig;

  @override
  List<Object?> get props => [
        depressionActivityPlanConfig,
        depressionNiceMadeHappyConfig,
        depressionPraiseMyAchievementsConfig,
      ];
}
