import 'package:freezed_annotation/freezed_annotation.dart';

part 'crisis_center_contact_model.freezed.dart';
part 'crisis_center_contact_model.g.dart';

@freezed
class CrisisCenterContact with _$CrisisCenterContact {
  const factory CrisisCenterContact({
    required String title,
  }) = _CrisisCenterContact;

  factory CrisisCenterContact.fromJson(Map<String, Object?> json) =>
      _$CrisisCenterContactFromJson(json);
}
