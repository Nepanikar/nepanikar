import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpd_week_models.freezed.dart';
part 'bpd_week_models.g.dart';

@freezed
abstract class BpdWeekProgress with _$BpdWeekProgress {
  const factory BpdWeekProgress({
    required int weekNumber,
    required DateTime unlockDate,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
  }) = _BpdWeekProgress;

  const BpdWeekProgress._();

  factory BpdWeekProgress.fromJson(Map<String, Object?> json) =>
      _$BpdWeekProgressFromJson(json);

  /// Check if this week is currently unlocked based on current date
  bool isUnlocked() {
    return DateTime.now().isAfter(unlockDate) ||
        DateTime.now().isAtSameMomentAs(unlockDate);
  }
}

@freezed
abstract class BpdWeekData with _$BpdWeekData {
  const factory BpdWeekData({
    required int weekNumber,
    required String titleKey,
    required String descriptionKey,
    String? iconPath,
  }) = _BpdWeekData;

  const BpdWeekData._();

  factory BpdWeekData.fromJson(Map<String, Object?> json) =>
      _$BpdWeekDataFromJson(json);
}
