import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_contact_model.freezed.dart';

part 'university_contact_model.g.dart';

@freezed
class UniversityRegionContact with _$UniversityRegionContact {
  const factory UniversityRegionContact({
    required String region,
    required List<UniversityContact> universities,
  }) = _UniversityRegionContact;

  factory UniversityRegionContact.fromJson(Map<String, Object?> json) =>
      _$UniversityRegionContactFromJson(json);
}

@freezed
class UniversityContact with _$UniversityContact {
  const factory UniversityContact({
    required String name,
    required List<String> contacts,
  }) = _UniversityContact;

  factory UniversityContact.fromJson(Map<String, Object?> json) =>
      _$UniversityContactFromJson(json);
}
