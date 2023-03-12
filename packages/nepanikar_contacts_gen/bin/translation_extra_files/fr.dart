import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'en.dart';

// ignore: non_constant_identifier_names
final fr_Contacts = en_Contacts.copyWith(
  languageCode: NepanikarLanguages.fr.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    title: 'For SOS psychiatrie',
    tel: '01 47 07 24 24',
  ),
  PhoneContact.subList(
    title: 'CPOA',
    subtitle: "centre psychiatrique d'orientation et d'accueil",
    subPhoneContacts: [
      SubPhoneContact(title: '', tel: '01 45 65 81 09 / 10'),
    ],
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: '',
    contacts: [
      RegionItemContact(
        name: "Centre Intersectoriel d'Accueil et de Crise (Longjumeau)",
        contactAddresses: [
          '1 rue Lieron',
          '91160 Longjumeau',
          'https://www.longjumeau.fr/',
        ],
      ),
    ],
  ),
];
