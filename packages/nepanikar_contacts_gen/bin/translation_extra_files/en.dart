import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const en_Contacts = CountryContacts(
  languageTag: 'en',
  phoneContacts: _phoneContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'TODO number 1',
    number: 116111,
    subtitle: 'Nonstop',
  ),
  PhoneContact(title: 'Example 2', number: 123456),
];
