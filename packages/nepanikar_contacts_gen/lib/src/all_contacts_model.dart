import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar_contacts_gen/src/country_contacts_model.dart';

part 'all_contacts_model.freezed.dart';
part 'all_contacts_model.g.dart';

@freezed
class AllContacts with _$AllContacts {
  const factory AllContacts({
    required List<CountryContacts> countryContacts,
  }) = _AllContacts;

  const AllContacts._();

  factory AllContacts.fromJson(Map<String, Object?> json) => _$AllContactsFromJson(json);
}
