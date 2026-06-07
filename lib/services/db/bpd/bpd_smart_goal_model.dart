import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpd_smart_goal_model.freezed.dart';
part 'bpd_smart_goal_model.g.dart';

@freezed
abstract class BpdSmartGoal with _$BpdSmartGoal {
  const factory BpdSmartGoal({
    required String id,
    required String specific,
    required String measurable,
    required String achievable,
    required String relevant,
    required String timeBound,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default(false) bool isArchived,
  }) = _BpdSmartGoal;

  const BpdSmartGoal._();

  factory BpdSmartGoal.fromJson(Map<String, Object?> json) =>
      _$BpdSmartGoalFromJson(json);
}
