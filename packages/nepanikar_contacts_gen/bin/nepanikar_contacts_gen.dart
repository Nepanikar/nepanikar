import 'dart:convert';
import 'dart:io';

import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'translation_extra_files/cs.dart';
import 'translation_extra_files/de.dart';
import 'translation_extra_files/en.dart';
import 'translation_extra_files/es.dart';
import 'translation_extra_files/fr.dart';
import 'translation_extra_files/it.dart';
import 'translation_extra_files/pl.dart';
import 'translation_extra_files/ru.dart';
import 'translation_extra_files/sk.dart';

const appContactsAssetDirPath = '../../assets/contacts';

final allContacts = AllContacts(
  countryContacts: <CountryContacts>[
    cs_Contacts,
    en_Contacts,
    sk_Contacts,
    ru_Contacts,
    pl_Contacts,
    it_Contacts,
    fr_Contacts,
    es_Contacts,
    de_Contacts,
  ],
);

void main() {
  final json = jsonEncode(allContacts.toJson());
  File('$appContactsAssetDirPath/$CONTACTS_ASSET_NAME').writeAsStringSync(json);
}
