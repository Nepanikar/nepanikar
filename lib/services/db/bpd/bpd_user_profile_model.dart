import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpd_user_profile_model.freezed.dart';
part 'bpd_user_profile_model.g.dart';

/// Pronoun options for BPD programme personalization
enum BpdPronoun {
  /// Masculine (on/he)
  he,

  /// Feminine (ona/she)
  she,

  /// Non-binary (oni/they)
  they,
}

@freezed
abstract class BpdUserProfile with _$BpdUserProfile {
  const factory BpdUserProfile({
    required String name,
    required BpdPronoun pronoun,
    DateTime? createdAt,
  }) = _BpdUserProfile;

  const BpdUserProfile._();

  factory BpdUserProfile.fromJson(Map<String, Object?> json) =>
      _$BpdUserProfileFromJson(json);
}
