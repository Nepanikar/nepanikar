import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

part 'mood_track_model.freezed.dart';
part 'mood_track_model.g.dart';

enum Mood {
  sad,
  bad,
  okay,
  good,
  happy,
  unknown;

  Widget get icon {
    switch (this) {
      case Mood.sad:
        return Assets.illustrations.moods.sad5.svg();
      case Mood.bad:
        return Assets.illustrations.moods.bad4.svg();
      case Mood.okay:
        return Assets.illustrations.moods.okay3.svg();
      case Mood.good:
        return Assets.illustrations.moods.good2.svg();
      case Mood.happy:
        return Assets.illustrations.moods.happy1.svg();
      case Mood.unknown:
        return const SizedBox.shrink();
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
      case Mood.unknown:
        return '';
    }
  }

  static Mood fromInteger(int value) {
    final mood = Mood.values.firstWhereOrNull((mood) => mood.index == value);
    return mood ?? Mood.unknown;
  }

  static List<Mood> get knownMoods => Mood.values.where((e) => e != Mood.unknown).toList();
}

@freezed
class MoodTrack with _$MoodTrack {
  const factory MoodTrack({
    required Mood mood,
    required DateTime date,
  }) = _MoodTrack;

  const MoodTrack._();

  factory MoodTrack.fromJson(Map<String, Object?> json) => _$MoodTrackFromJson(json);
}
