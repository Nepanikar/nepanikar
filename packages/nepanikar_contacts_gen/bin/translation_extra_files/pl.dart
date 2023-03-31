import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'en.dart';

// ignore: non_constant_identifier_names
final pl_Contacts = en_Contacts.copyWith(
  languageCode: NepanikarLanguages.pl.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'Numer alarmowy',
    tel: '112',
  ),
  PhoneContact(
    title: 'Woj. zarządzanie kryzysowe',
    tel: '987',
  ),
  PhoneContact(
    title: 'Pogotowie Ratunkowe',
    tel: '999',
  ),
  PhoneContact(
    title: 'Centrum kryzysowe',
    tel: '+48 91 350-80-80',
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: 'Łódź',
    contacts: [
      RegionItemContact(
        name: 'Ośrodek Interwencji Kryzysowej',
        contactAddresses: [
          'Piotrkowska 102',
          '90-004 Łódź',
          'http://www.interwencjakryzysowa.pl/osrodki-interwencji-kryzysowej/4180',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Wrocław',
    contacts: [
      RegionItemContact(
        name: 'Powiatowe Centrum Pomocy Rodzinie ve Vratislavi',
        contactAddresses: [
          'ul. Kościuszki 131',
          '50-440 Wrocław',
          'https://pcpr.wroclaw.pl/strona/kontakt/580-kontakt-do-powiatowego-centrum-pomocy-rodzinie-we-wroclawiu',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Piastów',
    contacts: [
      RegionItemContact(
        name: 'Ośrodek Interwencji Kryzysowej',
        contactAddresses: [
          'ul. Ks. J. Popiełuszki 24',
          '05-820 Piastów',
          'http://zowpiastow.pl/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Wolsztyn',
    contacts: [
      RegionItemContact(
        name: 'Powiatowe Centrum Pomocy Rodzinie w Wolsztynie',
        contactAddresses: [
          '5 Stycznia 5',
          '64-200 Wolsztyn',
          'http://pcpr.powiatwolsztyn.pl/index.php/kontakt/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Warszawa',
    contacts: [
      RegionItemContact(
        name: 'Warszawskie Centrum Pomocy Rodzinie',
        contactAddresses: [
          'Lipińska 2',
          '01-001 Warszawa',
          'https://wcpr.pl/',
        ],
      ),
    ],
  ),
];
