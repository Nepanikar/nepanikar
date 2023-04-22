import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

extension SemanticsStrExt on String {
  /// Specifically used for phone numbers to spell out chars,
  /// e.g. 1234 -> will say: "tel one two three four", instead "one thousand two hundred thirty four"
  String get spellOutNumFormat => 'tel: ${split('').map((e) => e).join(' ')}';
}

extension SemanticsUiExt on BuildContext {
  /// Announces a message to the user via TalkBack or VoiceOver.
  ///
  /// Use when you UI changes in a way that is not obvious to the user and where
  /// [SnackBar] is not used.
  ///
  /// Good use cases: Breathing exercises, Correct/Incorrect answers in Math, etc.
  void semanticsAnnounce(String message) {
    SemanticsService.announce(message, Directionality.of(this));
  }

  /// Whether accessibility reader is enabled (e.g. TalkBack on Android, VoiceOver on iOS).
  bool get isAccessibilityReaderEnabled => MediaQuery.of(this).accessibleNavigation;
}
