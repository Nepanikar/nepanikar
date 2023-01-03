import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar_contacts_gen/src/chat_contact_model.dart';
import 'package:nepanikar_contacts_gen/src/phone_contact_model.dart';
import 'package:nepanikar_contacts_gen/src/region_contact_model.dart';

part 'country_contacts_model.freezed.dart';
part 'country_contacts_model.g.dart';

@freezed
class CountryContacts with _$CountryContacts {
  const factory CountryContacts({
    required String languageTag,
    List<PhoneContact>? phoneContacts,
    List<RegionContact>? crisisCenterContacts,
    List<ChatContact>? chatContacts,
    List<RegionContact>? universityRegionContacts,
    List<String>? eatingDisorderContacts,
  }) = _CountryContacts;

  const CountryContacts._();

  factory CountryContacts.fromJson(Map<String, Object?> json) => _$CountryContactsFromJson(json);
}
