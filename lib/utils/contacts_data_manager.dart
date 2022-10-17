import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ContactsDataManager {
  ContactsDataManager();

  late final AllContacts _allContacts;

  Future<void> init() async {
    _allContacts = await rootBundle.loadString(Assets.contacts.allContacts).then((s) {
      try {
        return AllContacts.fromJson(jsonDecode(s) as Map<String, dynamic>);
      } catch (e) {
        debugPrint('AllContacts JSON decoding has failed: $e');
        return const AllContacts(countryContacts: []);
      }
    });
  }

  CountryContacts getContactsFromLocale(Locale locale) {
    return _allContacts.countryContacts.firstWhereOrNull(
          (countryContacts) => countryContacts.languageTag == locale.toLanguageTag(),
        ) ??
        const CountryContacts(languageTag: 'not_found');
  }
}
