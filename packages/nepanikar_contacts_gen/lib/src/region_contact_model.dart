import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_contact_model.freezed.dart';
part 'region_contact_model.g.dart';

@freezed
class RegionContact with _$RegionContact {
  const factory RegionContact({
    required String region,
    required List<RegionItemContact> contacts,
  }) = _RegionContact;

  factory RegionContact.fromJson(Map<String, Object?> json) => _$RegionContactFromJson(json);
}

@freezed
class RegionItemContact with _$RegionItemContact {
  const factory RegionItemContact({
    required String name,
    required List<String> contactAddresses,
  }) = _RegionItemContact;

  factory RegionItemContact.fromJson(Map<String, Object?> json) =>
      _$RegionItemContactFromJson(json);
}
