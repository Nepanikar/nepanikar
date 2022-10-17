import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const cs_Contacts = CountryContacts(
  languageTag: 'cs',
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
  universityContacts: _universityContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'Linka bezpečí',
    number: 116111,
    subtitle: 'Nonstop provoz',
  ),
  PhoneContact(title: 'Linka psychické pomoci', number: 116123),
  PhoneContact(title: 'KC Brno\nFN Bohunice', number: 532232078),
  PhoneContact(title: 'PN Bohnice', number: 284016666),
  PhoneContact.subList(
    title: 'Modrá linka',
    subtitle: 'Denně od 9:00 - 21:00',
    subPhoneContacts: [
      SubPhoneContact(title: 'Telefon', number: 284016666),
      SubPhoneContact(title: 'Mobil', number: 608902410),
    ],
  ),
];

const _crisisCenterContacts = <CrisisCenterContact>[
  CrisisCenterContact(title: 'CrisisCenterContact TODO'),
];

const _chatContacts = <ChatContact>[
  ChatContact(title: 'Poradna 1 - TODO'),
  ChatContact(title: 'Poradna 2 - TODO'),
];

const _universityContacts = <UniversityContact>[
  UniversityContact(title: 'Uni Contacts TODO'),
];
