import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class EatingDisorderModuleDTO extends Equatable {
  const EatingDisorderModuleDTO._({
    required this.eatingDisorderFoodCreativeConfig,
    required this.eatingDisorderFoodMotivationConfig,
    required this.eatingDisorderFoodChallengesConfig,
    required this.eatingDisorderFoodLikeOnMyselfConfig,
    required this.eatingDisorderFoodILikeConfig,
    required this.eatingDisorderFoodAfraidOfConfig,
  });

  factory EatingDisorderModuleDTO.getData(Config config) {
    NepanikarChecklistFormDTO? eatingDisorderFoodCreativeConfig;
    try {
      eatingDisorderFoodCreativeConfig = NepanikarChecklistFormDTO.getData(
        config,
        sectionTextsName: 'foodCreative',
        sectionCheckboxStatesName: 'foodCreativeC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodMotivationConfig;
    try {
      eatingDisorderFoodMotivationConfig = NepanikarChecklistFormDTO.getData(
        config,
        sectionTextsName: 'foodMotivation',
        sectionCheckboxStatesName: 'foodMotivationC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodChallengesConfig;
    try {
      eatingDisorderFoodChallengesConfig = NepanikarChecklistFormDTO.getData(
        config,
        sectionTextsName: 'foodChallenge',
        sectionCheckboxStatesName: 'foodChallengeC',
      );
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodLikeOnMyselfConfig;
    try {
      eatingDisorderFoodLikeOnMyselfConfig =
          NepanikarListFormDTO.getData(config, sectionName: 'foodLike');
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodILikeConfig;
    try {
      eatingDisorderFoodILikeConfig =
          NepanikarListFormDTO.getData(config, sectionName: 'foodFoodLike');
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodAfraidOfConfig;
    try {
      eatingDisorderFoodAfraidOfConfig = NepanikarChecklistFormDTO.getData(
        config,
        sectionTextsName: 'foodAfraid',
        sectionCheckboxStatesName: 'foodAfraidC',
      );
    } catch (_) {}

    return EatingDisorderModuleDTO._(
      eatingDisorderFoodCreativeConfig: eatingDisorderFoodCreativeConfig,
      eatingDisorderFoodMotivationConfig: eatingDisorderFoodMotivationConfig,
      eatingDisorderFoodChallengesConfig: eatingDisorderFoodChallengesConfig,
      eatingDisorderFoodLikeOnMyselfConfig: eatingDisorderFoodLikeOnMyselfConfig,
      eatingDisorderFoodILikeConfig: eatingDisorderFoodILikeConfig,
      eatingDisorderFoodAfraidOfConfig: eatingDisorderFoodAfraidOfConfig,
    );
  }

  final NepanikarChecklistFormDTO? eatingDisorderFoodCreativeConfig;
  final NepanikarChecklistFormDTO? eatingDisorderFoodMotivationConfig;
  final NepanikarChecklistFormDTO? eatingDisorderFoodChallengesConfig;
  final NepanikarListFormDTO? eatingDisorderFoodLikeOnMyselfConfig;
  final NepanikarListFormDTO? eatingDisorderFoodILikeConfig;
  final NepanikarChecklistFormDTO? eatingDisorderFoodAfraidOfConfig;

  @override
  List<Object?> get props => [
        eatingDisorderFoodCreativeConfig,
        eatingDisorderFoodMotivationConfig,
        eatingDisorderFoodChallengesConfig,
        eatingDisorderFoodLikeOnMyselfConfig,
        eatingDisorderFoodILikeConfig,
        eatingDisorderFoodAfraidOfConfig,
      ];
}
