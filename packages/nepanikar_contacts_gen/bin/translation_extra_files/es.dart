import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'en.dart';

// ignore: non_constant_identifier_names
final es_Contacts = en_Contacts.copyWith(
  languageCode: NepanikarLanguages.es.languageCode,
  phoneContacts: _phoneContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    title: 'Teléfono de la Esperanza',
    tel: '717 003 717',
  ),
];
