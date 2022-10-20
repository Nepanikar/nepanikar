import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const en_Contacts = CountryContacts(
  languageTag: 'en',
  phoneContacts: _phoneContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'TODO number 1',
    tel: '116 111',
    subtitle: 'Nonstop',
  ),
  PhoneContact(title: 'Example 2', tel: '123 456'),
];
