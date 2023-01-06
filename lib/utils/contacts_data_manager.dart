import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/utils/crashlytics_utils.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ContactsDataManager {
  ContactsDataManager();

  late final AllContacts _allContacts;

  Future<void> init() async {
    _allContacts = await rootBundle.loadString(Assets.contacts.allContacts).then((s) async {
      try {
        return AllContacts.fromJson(jsonDecode(s) as Map<String, dynamic>);
      } catch (e, s) {
        await logExceptionToCrashlytics(e, s, logMessage: 'Error decoding AllContacts json.');
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
