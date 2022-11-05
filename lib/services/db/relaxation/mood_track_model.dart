import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/services/db/filters.dart';

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
    // TODO: l10n
    switch (this) {
      case Mood.sad:
        return 'Mizerně';
      case Mood.bad:
        return 'Smutně';
      case Mood.okay:
        return 'Nic moc';
      case Mood.good:
        return 'Dobře';
      case Mood.happy:
        return 'Super';
    }
  }

  static Mood? fromInteger(int value) {
    final mood = Mood.values.firstWhereOrNull((mood) => mood.index == value);
    return mood;
  }
}

@freezed
class MoodTrack with _$MoodTrack {
  const factory MoodTrack({
    required Mood mood,
    // ignore: invalid_annotation_target
    @JsonKey(name: FilterKeys.date) required DateTime date,
  }) = _MoodTrack;

  const MoodTrack._();

  factory MoodTrack.fromJson(Map<String, Object?> json) => _$MoodTrackFromJson(json);
}
