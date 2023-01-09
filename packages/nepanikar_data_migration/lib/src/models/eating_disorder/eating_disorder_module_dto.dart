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

  factory EatingDisorderModuleDTO.getAndroidData(Config config) {
    NepanikarChecklistFormDTO? eatingDisorderFoodCreativeConfig;
    try {
      eatingDisorderFoodCreativeConfig = NepanikarChecklistFormDTO.getAndroidData(
        config,
        sectionTextsName: 'foodCreative',
        sectionCheckboxStatesName: 'foodCreativeC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodMotivationConfig;
    try {
      eatingDisorderFoodMotivationConfig = NepanikarChecklistFormDTO.getAndroidData(
        config,
        sectionTextsName: 'foodMotivation',
        sectionCheckboxStatesName: 'foodMotivationC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodChallengesConfig;
    try {
      eatingDisorderFoodChallengesConfig = NepanikarChecklistFormDTO.getAndroidData(
        config,
        sectionTextsName: 'foodChallenge',
        sectionCheckboxStatesName: 'foodChallengeC',
      );
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodLikeOnMyselfConfig;
    try {
      eatingDisorderFoodLikeOnMyselfConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'foodLike');
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodILikeConfig;
    try {
      eatingDisorderFoodILikeConfig =
          NepanikarListFormDTO.getAndroidData(config, sectionName: 'foodFoodLike');
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodAfraidOfConfig;
    try {
      eatingDisorderFoodAfraidOfConfig = NepanikarChecklistFormDTO.getAndroidData(
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

  factory EatingDisorderModuleDTO.getIosData(Map<String, Object> config) {
    NepanikarChecklistFormDTO? eatingDisorderFoodCreativeConfig;
    try {
      eatingDisorderFoodCreativeConfig = NepanikarChecklistFormDTO.getIosData(
        config,
        sectionTextsName: 'foodCreative',
        sectionCheckboxStatesName: 'foodCreativeC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodMotivationConfig;
    try {
      eatingDisorderFoodMotivationConfig = NepanikarChecklistFormDTO.getIosData(
        config,
        sectionTextsName: 'foodMotivation',
        sectionCheckboxStatesName: 'foodMotivationC',
      );
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodChallengesConfig;
    try {
      eatingDisorderFoodChallengesConfig = NepanikarChecklistFormDTO.getIosData(
        config,
        sectionTextsName: 'foodChallenge',
        sectionCheckboxStatesName: 'foodChallengeC',
      );
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodLikeOnMyselfConfig;
    try {
      eatingDisorderFoodLikeOnMyselfConfig =
          NepanikarListFormDTO.getIosData(config, sectionName: 'foodLike');
    } catch (_) {}

    NepanikarListFormDTO? eatingDisorderFoodILikeConfig;
    try {
      eatingDisorderFoodILikeConfig =
          NepanikarListFormDTO.getIosData(config, sectionName: 'foodFoodLike');
    } catch (_) {}

    NepanikarChecklistFormDTO? eatingDisorderFoodAfraidOfConfig;
    try {
      eatingDisorderFoodAfraidOfConfig = NepanikarChecklistFormDTO.getIosData(
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
