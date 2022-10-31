import 'dart:convert';
import 'dart:io';

import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'translation_extra_files/cs.dart';
import 'translation_extra_files/en.dart';
import 'translation_extra_files/sk.dart';

const appContactsAssetDirPath = '../../assets/contacts';

const allContacts = AllContacts(
  countryContacts: <CountryContacts>[
    cs_Contacts,
    en_Contacts,
    sk_Contacts,
  ],
);

void main() {
  final json = jsonEncode(allContacts.toJson());
  File('$appContactsAssetDirPath/$CONTACTS_ASSET_NAME').writeAsStringSync(json);
}
