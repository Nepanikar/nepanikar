import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const sk_Contacts = CountryContacts(
  languageTag: 'sk',
  phoneContacts: _phoneContacts,
  chatContacts: _chatContacts,
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

const _chatContacts = <ChatContact>[
  ChatContact(url: 'https://ipcko.sk/chatova-poradna/'),
  ChatContact(url: 'https://dobralinka.sk/chatova-poradna/'),
  ChatContact(url: 'https://www.krizovalinkapomoci.sk/chatova-poradna/'),
  ChatContact(url: 'https://nepanikar.eu/poradna/'),
  ChatContact(url: 'https://viacakonick.gov.sk/'),
];
