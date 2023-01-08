import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

// ignore: non_constant_identifier_names
final cs_Contacts = CountryContacts(
  languageTag: NepanikarLanguages.cs.languageCode,
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
  universityRegionContacts: _universityRegionContacts,
  eatingDisorderContacts: _eatingDisorderContacts,
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
  PhoneContact.subList(
    title: 'Linka Anabell (poruchy příjmu potravy)',
    subPhoneContacts: [
      SubPhoneContact(
        title: '''
Po‎ ‎ ‎ ‎ ‎ ‎ ‎ 8–16 hod.
Út    ‎ ‎ ‎ ‎ ‎ ‎ ‎ 10–18 hod.
St–pá‎ 8–16 hod.''',
        tel: '774 467 293',
      ),
    ],
  ),
];

const _crisisCenterContacts = <RegionContact>[
  RegionContact(
    region: 'Praha a Středočeský kraj',
    contacts: [
      RegionItemContact(
        name: 'Centrum krizové péče',
        contactAddresses: [
          'Pondělí až pátek 8:00 – 15:30',
          'Psychiatrická klinika VFN v Praze, Ke Karlovu 11, 120 00 Praha 2',
          'Telefonní krizová linka: 605 851 658',
          'E-mail: ckp@vfn.cz',
        ],
      ),
    ],
  )
];

const _chatContacts = <ChatContact>[
  ChatContact(
    name: 'Nepanikař',
    url: 'https://nepanikar.eu/poradna/',
  ),
  ChatContact(
    name: 'iPoradna',
    url: 'https://iporadna.cz/elinka-chatova-poradna/',
  ),
  ChatContact(
    name: 'Linka bezpečí',
    url: 'https://chat.linkabezpeci.cz/',
  ),
  ChatContact(
    name: 'Modrá linka',
    url: 'https://chat.modralinka.cz/',
  ),
  ChatContact(
    name: 'Chat pražské linky důvěry',
    url: 'https://www.chat-pomoc.cz/',
  ),
  ChatContact(
    name: 'Linka první psychické pomoci',
    url: 'https://linkapsychickepomoci.cz/chat/',
  ),
];

const _universityRegionContacts = <RegionContact>[
  RegionContact(
    region: 'Praha a Středočeský kraj',
    contacts: [
      RegionItemContact(
        name: 'Akademie výtvarných umění Praha',
        contactAddresses: [
          'https://avu.cz/oddeleni/psychologicke-pracoviste',
          'psycholog@avu.cz',
        ],
      ),
      RegionItemContact(
        name: 'Česká zemědělská univerzita v Praze',
        contactAddresses: [
          'https://www.fzp.czu.cz/cs/r-6896-studium/r-9878-informace-pro-studenty/r-12299-poradenstvi-pro-studenty',
          'sabolovak@fzp.czu.cz',
          'tendonkelaar@fzp.czu.cz',
        ],
      ),
      RegionItemContact(
        name: 'České vysoké učení technické v Praze',
        contactAddresses: [
          'https://www.cips.cvut.cz/poradny/psychologicka-poradna/',
          'cips@cvut.cz',
        ],
      ),
      RegionItemContact(
        name: 'Policejní akademie ČR v Praze',
        contactAddresses: [
          'chvostkova@polac.cz',
        ],
      ),
      RegionItemContact(
        name: 'Univerzita Jana Amose Komenského, s.r.o.',
        contactAddresses: [
          'http://www.ujak.cz/akademicke-poradenske-centrum/',
          'kocurova.marie@ujak.cz',
        ],
      ),
      RegionItemContact(
        name: 'Univerzita Karlova',
        contactAddresses: [
          'https://centrumcarolina.cuni.cz/CC-31.html',
          'hedvika.boukalova@ff.cuni.cz',
          'vendula.vinklerova@centrum.cz',
        ],
      ),
      RegionItemContact(
        name: 'Vysoká škola ekonomická v Praze',
        contactAddresses: [
          'https://ac.vse.cz/nase-sluzby/psychologicka-poradna/',
          'jiri.knap@vse.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Jihomoravský kraj',
    contacts: [
      RegionItemContact(
        name: 'Masarykova univerzita',
        contactAddresses: [
          'https://www.teiresias.muni.cz/',
          'teiresias@muni.cz',
        ],
      ),
      RegionItemContact(
        name: 'Mendelova univerzita v Brně',
        contactAddresses: [
          'https://icv.mendelu.cz/pcentrum/psychologicke-poradenstvi/?psn=1700',
          'pcentrum@mendelu.cz',
          'petra.kadlecova@mendelu.cz',
        ],
      ),
      RegionItemContact(
        name: 'Vysoké učení technické v Brně',
        contactAddresses: [
          'https://www.lli.vutbr.cz/psychologicke-poradenstvi',
          'eva.viktorinova@vutbr.cz',
          'Petr.Matousek@lli.vutbr.cz',
          'tereza.hruskova@vutbr.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Olomoucký kraj',
    contacts: [
      RegionItemContact(
        name: 'Univerzita Palackého v Olomouci',
        contactAddresses: [
          'https://www.upol.cz/studenti/pruvodce/poradenstvi/#c23969',
          'michaela.pugnerova@upol.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Jihočeský kraj',
    contacts: [
      RegionItemContact(
        name: 'Jihočeská univerzita v Českých Budějovicích',
        contactAddresses: [
          'http://www.pf.jcu.cz/structure/poradna/',
          'zbajgarova@pf.jcu.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Moravskoslezský kraj',
    contacts: [
      RegionItemContact(
        name: 'Ostravská univerzita',
        contactAddresses: [
          'https://www.osu.cz/poradenske-centrum/psychologicke-poradenstvi/',
          'pavlina.jablonska@osu.cz',
        ],
      ),
      RegionItemContact(
        name: 'Slezská univerzita v Opavě',
        contactAddresses: [
          'https://www.slu.cz/slu/cz/psychologickekonzultace',
          'BChodura@vez.opa.justice.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Plzeňský kraj',
    contacts: [
      RegionItemContact(
        name: 'Západočeská univerzita v Plzni',
        contactAddresses: [
          'https://old.zcu.cz/pracoviste/ipc/psychologicke-poradenstvi/',
          'psyche@rek.zcu.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Vysočina',
    contacts: [
      RegionItemContact(
        name: 'Vysoká škola polytechnická Jihlava',
        contactAddresses: [
          'http://www.vspj.cz/student/poradenske-a-karierni-centrum-vspj',
          'simona.mertlova@vspj.cz',
          'poradce@vspj.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Ústecký kraj',
    contacts: [
      RegionItemContact(
        name: 'Univerzita Jana Evangelisty Purkyně v Ústí nad Labem',
        contactAddresses: [
          'https://www.pf.ujep.cz/cs/katedra-psychologie-psychologicka-poradna',
          'michala.linkova@ujep.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Liberecký kraj',
    contacts: [
      RegionItemContact(
        name: 'Technická univerzita v Liberci',
        contactAddresses: [
          'https://www.tul.cz/studenti/sluzby-studentum/podpora-a-poradenstvi/',
          'lucie.hubertova@tul.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Královéhradecký kraj',
    contacts: [
      RegionItemContact(
        name: 'Univerzita Hradec Králové',
        contactAddresses: [
          'https://www.uhk.cz/cs/univerzita-hradec-kralove/uhk/celouniverzitni-pracoviste/ipakc/psychologicka-a-terapeuticka-podpora',
          'katerina.juklova@uhk.cz',
          'gabriela.slaninova@uhk.cz',
          'anezka.kohoutova@uhk.cz',
          'damian.kastner@uhk.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Pardubický kraj',
    contacts: [
      RegionItemContact(
        name: 'Univerzita Pardubice',
        contactAddresses: [
          'https://www.upce.cz/krizova-intervence',
          'barbora.bajova@upce.cz',
          'hana.jelinkova@upce.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Zlínský kraj',
    contacts: [
      RegionItemContact(
        name: 'Univerzita Tomáše Bati ve Zlíně',
        contactAddresses: [
          'https://akademickaporadna.utb.cz/poradna/',
          'poradnak@utb.cz',
        ],
      ),
    ],
  ),
];

const _eatingDisorderContacts = <String>[
  'http://www.anabell.cz/',
  '774 467 293',
];
