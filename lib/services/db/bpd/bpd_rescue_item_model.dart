import 'package:flutter/material.dart';

/// An exercise the user saved into their "záchranný balíček" (rescue package) —
/// a personal shortlist of techniques to reach for when things get hard.
///
/// Saved from the HPO programme day pages (Week 2 breathing + mindfulness
/// techniques) via `BpdRescuePackageDao`. Kept as a plain immutable class (no
/// codegen), matching [BpdChallenge].
@immutable
class BpdRescueItem {
  const BpdRescueItem({
    required this.id,
    required this.title,
    required this.description,
    required this.sourceLabel,
    required this.savedAt,
    this.videoUrl,
    this.iconKey,
  });

  factory BpdRescueItem.fromMap(Map<String, dynamic> map) {
    return BpdRescueItem(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      sourceLabel: map['sourceLabel'] as String? ?? '',
      savedAt: DateTime.tryParse(map['savedAt'] as String? ?? '') ?? DateTime(2024),
      videoUrl: map['videoUrl'] as String?,
      iconKey: map['iconKey'] as String?,
    );
  }

  /// Stable identity so re-saving the same exercise never duplicates it.
  final String id;
  final String title;
  final String description;

  /// Where the exercise came from, e.g. "Všímavé dýchání" — shown as a badge.
  final String sourceLabel;
  final DateTime savedAt;

  /// Optional guided-exercise video from the programme source.
  final String? videoUrl;

  /// Key into [_icons] for the icon the day page used for this exercise.
  ///
  /// A key rather than a raw code point on purpose: building `IconData` from a
  /// stored int at runtime defeats Flutter's icon tree-shaking, so only icons
  /// referenced as constants below ship in release builds.
  final String? iconKey;

  IconData get icon => _icons[iconKey] ?? Icons.self_improvement;

  /// Icons the programme can attach to a saved exercise.
  static const _icons = <String, IconData>{
    'air': Icons.air,
    'box': Icons.crop_square,
    'waves': Icons.waves,
    'body': Icons.accessibility_new,
    'walk': Icons.directions_walk,
    'eat': Icons.restaurant,
    'listen': Icons.hearing,
    'senses': Icons.auto_awesome,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'sourceLabel': sourceLabel,
    'savedAt': savedAt.toIso8601String(),
    'videoUrl': videoUrl,
    'iconKey': iconKey,
  };
}
