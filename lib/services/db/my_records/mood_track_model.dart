import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

part 'mood_track_model.freezed.dart';

part 'mood_track_model.g.dart';

enum Mood {
  sad,
  bad,
  okay,
  good,
  happy;

  SvgGenImage get icon {
    switch (this) {
      case Mood.sad:
        return Assets.illustrations.moods.mood0Sad;
      case Mood.bad:
        return Assets.illustrations.moods.mood1Bad;
      case Mood.okay:
        return Assets.illustrations.moods.mood2Okay;
      case Mood.good:
        return Assets.illustrations.moods.mood3Good;
      case Mood.happy:
        return Assets.illustrations.moods.mood4Happy;
    }
  }

  LottieGenImage get animatedIcon {
    switch (this) {
      case Mood.sad:
        return Assets.animatedIllustrations.moods.mood0Sad;
      case Mood.bad:
        return Assets.animatedIllustrations.moods.mood1Bad;
      case Mood.okay:
        return Assets.animatedIllustrations.moods.mood2Okay;
      case Mood.good:
        return Assets.animatedIllustrations.moods.mood3Good;
      case Mood.happy:
        return Assets.animatedIllustrations.moods.mood4Happy;
    }
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case Mood.sad:
        return context.l10n.mood_miserable_sad;
      case Mood.bad:
        return context.l10n.mood_bad_sad;
      case Mood.okay:
        return context.l10n.mood_not_much;
      case Mood.good:
        return context.l10n.mood_good;
      case Mood.happy:
        return context.l10n.mood_great_happy;
    }
  }

  String getSemanticsLabel(BuildContext context) {
    switch (this) {
      case Mood.sad:
        return '*';
      case Mood.bad:
        return '**';
      case Mood.okay:
        return '***';
      case Mood.good:
        return '****';
      case Mood.happy:
        return '*****';
    }
  }

  int getMoodScore(Mood mood){
    switch (mood) {
      case Mood.sad:
        return 1;
      case Mood.bad:
        return 2;
      case Mood.okay:
        return 3;
      case Mood.good:
        return 4;
      case Mood.happy:
        return 5;
      default:
        return 0; // Or throw an exception as appropriate
    }
  }

  static Mood? fromInteger(int value) => Mood.values.safeElementAtOrNull(value);
}

@freezed
class MoodTrack with _$MoodTrack {
  const factory MoodTrack({
    required Mood mood,
    // ignore: invalid_annotation_target
    @JsonKey(name: FilterKeys.date) required DateTime date,
    List<String>? emotions,
    String? summary,
    String? description,
  }) = _MoodTrack;

  const MoodTrack._();

  factory MoodTrack.fromJson(Map<String, Object?> json) => _$MoodTrackFromJson(json);
}
