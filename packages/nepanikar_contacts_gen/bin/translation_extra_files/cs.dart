import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

const cs_Contacts = CountryContacts(
  languageTag: 'cs',
  phoneContacts: _phoneContacts,
  crisisCenterContacts: _crisisCenterContacts,
  chatContacts: _chatContacts,
  universityRegionContacts: _universityRegionContacts,
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

const _crisisCenterContacts = <CrisisCenterContact>[
  CrisisCenterContact(title: 'CrisisCenterContact TODO'),
];

const _chatContacts = <ChatContact>[
  ChatContact(title: 'Poradna 1 - TODO'),
  ChatContact(title: 'Poradna 2 - TODO'),
];

const _universityRegionContacts = <UniversityRegionContact>[
  UniversityRegionContact(
    region: 'Praha a Středočeský kraj',
    universities: [
      UniversityContact(
        name: 'Akademie výtvarných umění Praha',
        contacts: [
          'https://avu.cz/oddeleni/psychologicke-pracoviste',
          'psycholog@avu.cz',
        ],
      ),
      UniversityContact(
        name: 'Česká zemědělská univerzita v Praze',
        contacts: [
          'https://www.fzp.czu.cz/cs/r-6896-studium/r-9878-informace-pro-studenty/r-12299-poradenstvi-pro-studenty',
          'sabolovak@fzp.czu.cz',
          'tendonkelaar@fzp.czu.cz',
        ],
      ),
      UniversityContact(
        name: 'České vysoké učení technické v Praze',
        contacts: [
          'https://www.cips.cvut.cz/poradny/psychologicka-poradna/',
          'cips@cvut.cz',
        ],
      ),
      UniversityContact(
        name: 'Policejní akademie ČR v Praze',
        contacts: [
          'chvostkova@polac.cz',
        ],
      ),
      UniversityContact(
        name: 'Univerzita Jana Amose Komenského, s.r.o.',
        contacts: [
          'http://www.ujak.cz/akademicke-poradenske-centrum/',
          'kocurova.marie@ujak.cz',
        ],
      ),
      UniversityContact(
        name: 'Univerzita Karlova',
        contacts: [
          'https://centrumcarolina.cuni.cz/CC-31.html',
          'hedvika.boukalova@ff.cuni.cz',
          'vendula.vinklerova@centrum.cz',
        ],
      ),
      UniversityContact(
        name: 'Vysoká škola ekonomická v Praze',
        contacts: [
          'http://rpc.vse.cz',
          'jiri.knap@vse.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Jihomoravský kraj',
    universities: [
      UniversityContact(
        name: 'Masarykova univerzita',
        contacts: [
          'https://www.teiresias.muni.cz/',
          'teiresias@muni.cz',
        ],
      ),
      UniversityContact(
        name: 'Mendelova univerzita v Brně',
        contacts: [
          'https://icv.mendelu.cz/pcentrum/psychologicke-poradenstvi/?psn=1700',
          'pcentrum@mendelu.cz',
          'petra.kadlecova@mendelu.cz',
        ],
      ),
      UniversityContact(
        name: 'Vysoké učení technické v Brně',
        contacts: [
          'https://www.lli.vutbr.cz/psychologicke-poradenstvi',
          'eva.viktorinova@vutbr.cz',
          'Petr.Matousek@lli.vutbr.cz',
          'tereza.hruskova@vutbr.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Olomoucký kraj',
    universities: [
      UniversityContact(
        name: 'Univerzita Palackého v Olomouci',
        contacts: [
          'https://www.upol.cz/studenti/pruvodce/poradenstvi/#c23969',
          'michaela.pugnerova@upol.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Jihočeský kraj',
    universities: [
      UniversityContact(
        name: 'Jihočeská univerzita v Českých Budějovicích',
        contacts: [
          'http://www.pf.jcu.cz/structure/poradna/',
          'zbajgarova@pf.jcu.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Moravskoslezský kraj',
    universities: [
      UniversityContact(
        name: 'Ostravská univerzita',
        contacts: [
          'https://www.osu.cz/poradenske-centrum/psychologicke-poradenstvi/',
          'pavlina.jablonska@osu.cz',
        ],
      ),
      UniversityContact(
        name: 'Slezská univerzita v Opavě',
        contacts: [
          'https://www.slu.cz/slu/cz/psychologickekonzultace',
          'BChodura@vez.opa.justice.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Plzeňský kraj',
    universities: [
      UniversityContact(
        name: 'Západočeská univerzita v Plzni',
        contacts: [
          'https://old.zcu.cz/pracoviste/ipc/psychologicke-poradenstvi/',
          'psyche@rek.zcu.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Vysočina',
    universities: [
      UniversityContact(
        name: 'Vysoká škola polytechnická Jihlava',
        contacts: [
          'http://www.vspj.cz/student/poradenske-a-karierni-centrum-vspj',
          'simona.mertlova@vspj.cz',
          'poradce@vspj.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Ústecký kraj',
    universities: [
      UniversityContact(
        name: 'Univerzita Jana Evangelisty Purkyně v Ústí nad Labem',
        contacts: [
          'https://www.pf.ujep.cz/cs/katedra-psychologie-psychologicka-poradna',
          'michala.linkova@ujep.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Liberecký kraj',
    universities: [
      UniversityContact(
        name: 'Technická univerzita v Liberci',
        contacts: [
          'https://www.tul.cz/studenti/sluzby-studentum/podpora-a-poradenstvi/',
          'lucie.hubertova@tul.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Královéhradecký kraj',
    universities: [
      UniversityContact(
        name: 'Univerzita Hradec Králové',
        contacts: [
          'https://www.uhk.cz/cs/univerzita-hradec-kralove/uhk/celouniverzitni-pracoviste/ipakc/psychologicka-a-terapeuticka-podpora',
          'katerina.juklova@uhk.cz',
          'gabriela.slaninova@uhk.cz',
          'anezka.kohoutova@uhk.cz',
          'damian.kastner@uhk.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Pardubický kraj',
    universities: [
      UniversityContact(
        name: 'Univerzita Pardubice',
        contacts: [
          'https://www.upce.cz/krizova-intervence',
          'barbora.bajova@upce.cz',
          'hana.jelinkova@upce.cz',
        ],
      ),
    ],
  ),
  UniversityRegionContact(
    region: 'Zlínský kraj',
    universities: [
      UniversityContact(
        name: 'Univerzita Tomáše Bati ve Zlíně',
        contacts: [
          'https://akademickaporadna.utb.cz/poradna/',
          'poradnak@utb.cz',
        ],
      ),
    ],
  ),
];
