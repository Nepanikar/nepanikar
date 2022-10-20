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
    tel: '116 111',
    subtitle: 'Nonstop zdarma',
  ),
  PhoneContact(
    pinned: true,
    title: 'Linka psychické pomoci',
    subtitle: 'Nonstop zdarma',
    tel: '116 123',
  ),
  PhoneContact.subList(
    title: 'Modrá linka',
    subtitle: 'Nonstop',
    subPhoneContacts: [
      SubPhoneContact(title: 'Mobil', tel: '731 197 477'),
      SubPhoneContact(title: 'Mobil', tel: '608 902 410'),
    ],
  ),
  PhoneContact(
    title: 'Linka pro rodinu a školu',
    subtitle: 'Nonstop zdarma',
    tel: '116 000',
  ),
  PhoneContact(
    title: 'Pražská linka důvěry',
    subtitle: 'Nonstop',
    tel: '222 580 697',
  ),
  PhoneContact(
    title: 'Linka důvěry CKI Bohnice',
    subtitle: 'Nonstop',
    tel: '284 016 666',
  ),
  PhoneContact.subList(
    title: 'Linka důvěry Dětského krizového centra',
    subtitle: 'Nonstop',
    subPhoneContacts: [
      SubPhoneContact(title: 'Telefon', tel: '241 484 149'),
      SubPhoneContact(title: 'Mobil', tel: '777 715 215'),
    ],
  ),
  PhoneContact(
    title: 'Linka Anabell (poruchy přijmu potravy)',
    subtitle: 'Nonstop',
    tel: '774 467 293',
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
