import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_contact_model.freezed.dart';

part 'university_contact_model.g.dart';

@freezed
class UniversityContact with _$UniversityContact {
  const factory UniversityContact({
    required String title,
  }) = _UniversityContact;

  factory UniversityContact.fromJson(Map<String, Object?> json) =>
      _$UniversityContactFromJson(json);
}
