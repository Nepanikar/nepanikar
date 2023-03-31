import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'en.dart';

// ignore: non_constant_identifier_names
final de_Contacts = en_Contacts.copyWith(
  languageCode: NepanikarLanguages.de.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact.subList(
    title: 'Psychosoziale Dienste in Wien Notfälle',
    subtitle: '',
    subPhoneContacts: [
      SubPhoneContact(title: 'Nonstop', tel: '(01) 31330'),
    ],
  ),
  PhoneContact.subList(
    title: 'Telefonseelsorge Deutschland',
    subtitle: '',
    subPhoneContacts: [
      SubPhoneContact(title: '', tel: '0800 1110 111'),
      SubPhoneContact(title: '', tel: '0800 1110 222'),
    ],
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: 'Deutschland',
    contacts: [
      RegionItemContact(
        name: 'TelefonSeelsorge',
        contactAddresses: [
          'https://www.telefonseelsorge.de/',
        ],
      ),
      RegionItemContact(
        name: 'Psychiatrisches Zentrum Nordbadenn',
        contactAddresses: [
          'Heidelberger Str. 1a',
          '69168 Wiesloch',
          'https://www.pzn-wiesloch.de/',
        ],
      ),
      RegionItemContact(
        name: 'Psychiatrisches Zentrum AR',
        contactAddresses: [
          'Krombach, Postfach',
          '9101 Herisau',
          'https://www.spitalverbund.ch/pza/home-pza/',
        ],
      ),
      RegionItemContact(
        name: 'Fachkrankenhaus fuer Psychiatrie und Psychotherapie',
        contactAddresses: [
          'Johannesallee',
          '24848 Kropp',
          'https://www.diakonie-kropp.de/unternehmen_alt__trashed/diakoniewerk-kropp/psychiatrisches-zentrum/',
        ],
      ),
      RegionItemContact(
        name: 'Zentrum für Psychiatrie Emmendingen',
        contactAddresses: [
          'Neubronnstraße 25',
          '79312 Emmendingen',
          'https://www.zfp-emmendingen.de/',
        ],
      ),
      RegionItemContact(
        name: 'Zentrum für Psychiatrie Calw - Klinikum Nordschwarzwald',
        contactAddresses: [
          'Im Lützenhardter Hof',
          '75365 Calw',
          'https://www.zfp-emmendingen.de/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Österreich',
    contacts: [
      RegionItemContact(
        name: 'Psychosoziale Dienste in Wien',
        contactAddresses: [
          'Modecenterstraße 14/A/2',
          '1030 Wien',
          'https://psd-wien.at/',
        ],
      ),
    ],
  ),
];

const _chatContacts = <ChatContact>[
  ChatContact.subList(
    title: 'Telefonseelsorge',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://online.telefonseelsorge.de/',
      ),
    ],
  ),
];
