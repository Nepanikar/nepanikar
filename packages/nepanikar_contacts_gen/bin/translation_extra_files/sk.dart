import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

// ignore: non_constant_identifier_names
final sk_Contacts = CountryContacts(
  languageCode: NepanikarLanguages.sk.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
  eatingDisorderContacts: _eatingDisorderContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    pinned: true,
    title: 'Linka detskej istoty',
    subtitle: 'Nonstop zdarma',
    tel: '116 123',
  ),
  PhoneContact(
    title: 'Krízová linka pomoci',
    subtitle: 'Nonstop zdarma',
    tel: '0800 500 333',
  ),
  PhoneContact(
    title: 'Liga za duševné zdravie Slovensko',
    subtitle: 'Nonstop zdarma',
    tel: '0800 800 566',
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: 'Káčko',
    contacts: [
      RegionItemContact(
        name: 'Káčko',
        contactAddresses: [
          'Káčko funguje na princípe dohody cez Krízovú linku pomoci (www.krizovalinkapomoci.sk), na bezplatnom nonstop telefónnom čísle 0800 500 333 alebo prostredníctvom e-mailu:',
          'kackoba@ipcko.sk (Bratislavský kraj)',
          'kackonr@ipcko.sk (Nitriansky kraj)',
          'kackobb@ipcko.sk (Banskobystrický kraj)',
          'kackott@ipcko.sk (Trnavský kraj)',
          'kackoke@ipcko.sk (Košický kraj)',
          'kackopo@ipcko.sk (Prešovský kraj)',
          'kackoza@ipcko.sk (Žilinský kraj)',
          'kackotn@ipcko.sk (Trenčiansky kraj)',
          '',
          'Všechny adresy: https://ipcko.sk/kacko/',
        ],
      ),
    ],
  ),
];

const _chatContacts = <ChatContact>[
  ChatContact.subList(
    title: 'IPčko',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://ipcko.sk/chatova-poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Dobrá linka',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://dobralinka.sk/chatova-poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Krizová linka pomoci',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://www.krizovalinkapomoci.sk/chatova-poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Nepanikař',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://nepanikar.eu/poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Viac ako nick',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://viacakonick.gov.sk/',
      ),
    ],
  ),
];

const _eatingDisorderContacts = <String>[
  'https://chutzit.sk/',
];
