import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

// ignore: non_constant_identifier_names
final en_Contacts = CountryContacts(
  languageCode: NepanikarLanguages.en.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'Emotional support helpline (EU)',
    tel: '116 123',
    subtitle: 'Nonstop',
  ),
  PhoneContact(
    title: 'Australia',
    tel: '131 114',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Austria',
    tel: '01713337',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Belgium',
    tel: '106',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Brazil',
    tel: '188',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Canada (Montreal)',
    tel: '5147234000',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Canada',
    tel: '18662773553',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Croatia',
    tel: '014833888',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Denmark',
    tel: '+4570201201',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Egypt',
    tel: '7621602',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Estonia',
    tel: '3726558088',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Estonia (Russian)',
    tel: '3726555688',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Finland',
    tel: '010195202',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'France',
    tel: '0145394000',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Germany',
    tel: '08001810771',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Holland',
    tel: '09000767',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Hungary',
    tel: '116 123',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'India',
    tel: '8888817666',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Ireland',
    tel: '+4408457909090',
    subtitle: 'Lifeline Crisis Support',
  ),
  PhoneContact(
    title: 'Italy',
    tel: '800860022',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Mexico',
    tel: '5255102550',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'New Zealand',
    tel: '0800543354',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Norway',
    tel: '+4781533300',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Poland',
    tel: '5270000',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Portugal',
    tel: '218540740',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Portugal',
    tel: '8968982150',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Russia',
    tel: '0078202577577',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Spain',
    tel: '914590050',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Sweden',
    tel: '46317112400',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'Switzerland',
    tel: '143',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'United Kingdom',
    tel: '08457909090',
    subtitle: 'Lifeline Crisis Support Line',
  ),
  PhoneContact(
    title: 'USA',
    tel: '18002738255',
    subtitle: 'Lifeline Crisis Support Line',
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: 'World',
    contacts: [
      RegionItemContact(
        name: 'List on iasp.info',
        contactAddresses: [
          'https://www.iasp.info/crisis-centres-helplines/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'United Kingdom',
    contacts: [
      RegionItemContact(
        name: 'List on mind.org',
        contactAddresses: [
          'https://www.mind.org.uk/information-support/guides-to-support-and-services/crisis-services/crisis-houses/#.XQkuaFPVIXd',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'United States',
    contacts: [
      RegionItemContact(
        name: 'List on 988lifeline.org',
        contactAddresses: [
          'https://988lifeline.org/our-crisis-centers/',
        ],
      ),
    ],
  ),
];

const _chatContacts = <ChatContact>[
  ChatContact.subList(
    title: 'Lifeline Chat',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://988lifeline.org/chat/',
      ),
    ],
  ),
  ChatContact.subList(
    title: '1-2-1 Counsellor Chat',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://www.childline.org.uk/get-support/1-2-1-counsellor-chat/',
      ),
    ],
  ),
];
