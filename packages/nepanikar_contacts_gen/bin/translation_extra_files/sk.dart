import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const sk_Contacts = CountryContacts(
  languageTag: 'sk',
  phoneContacts: _phoneContacts,
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
