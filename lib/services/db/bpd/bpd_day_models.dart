import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpd_day_models.freezed.dart';
part 'bpd_day_models.g.dart';

@freezed
abstract class BpdDayProgress with _$BpdDayProgress {
  const factory BpdDayProgress({
    required int weekNumber,
    required int dayNumber,
    required DateTime unlockDate,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
    DateTime? startedAt,
  }) = _BpdDayProgress;

  const BpdDayProgress._();

  factory BpdDayProgress.fromJson(Map<String, Object?> json) =>
      _$BpdDayProgressFromJson(json);

  /// Check if this day is currently unlocked based on current date
  bool isUnlocked() {
    return DateTime.now().isAfter(unlockDate) ||
        DateTime.now().isAtSameMomentAs(unlockDate);
  }

  /// Check if this is the current active day (unlocked but not completed)
  bool isActive() {
    return isUnlocked() && !isCompleted;
  }

  /// Get remaining time until unlock
  Duration? getRemainingTime() {
    if (isUnlocked()) return null;
    return unlockDate.difference(DateTime.now());
  }
}

@freezed
abstract class BpdDayData with _$BpdDayData {
  const factory BpdDayData({
    required int weekNumber,
    required int dayNumber,
    required String titleKey,
    required String descriptionKey,
    String? iconPath,
    String? contentType, // 'lesson', 'exercise', 'reflection', etc.
  }) = _BpdDayData;

  const BpdDayData._();

  factory BpdDayData.fromJson(Map<String, Object?> json) =>
      _$BpdDayDataFromJson(json);
}
