import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

// ignore: non_constant_identifier_names
final cs_Contacts = CountryContacts(
  languageCode: NepanikarLanguages.cs.languageCode,
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
        name: 'Centrum krizové intervence Psychiatrické nemocnice Bohnice',
        contactAddresses: [
          'Ústavní 91, 181 02 Praha 8',
          '284 016 110, 284 016 666',
          'https://bohnice.cz/krizova-pomoc/',
        ],
      ),
      RegionItemContact(
        name: 'Centrum krizové péče Všeobecné fakultní nemocnice v Praze',
        contactAddresses: [
          'Pondělí až pátek 8:00 – 15:00',
          'Psychiatrická klinika VFN v Praze, Ke Karlovu 11, 128 08 Praha, budova D1 (přízemí)',
          '605 851 658',
          'ckp@vfn.cz',
          'https://www.vfn.cz/pacienti/kliniky-ustavy/psychiatricka-klinika/specializovana-centra/',
        ],
      ),
      RegionItemContact(
        name: 'Krizové centrum RIAPS',
        contactAddresses: [
          'NONSTOP',
          'Chelčického 39, 130 Praha 3',
          '222 586 768',
          'riaps@csspraha.cz',
          'https://www.csspraha.cz/kc-riaps',
        ],
      ),
      RegionItemContact(
        name: 'Dětské krizové centrum',
        contactAddresses: [
          'Út, St, Čt: 16:00 - 18:00',
          'Cílkova 796/7, 142 00 Praha 12 - Kamýk',
          '241 480 511, 777 664 672',
          'problem@ditekrize.cz',
          'ambulance@ditekrize.cz',
          'https://www.ditekrize.cz/',
        ],
      ),
      RegionItemContact(
        name: 'Dům Přemysla Pittra pro děti - krizová pomoc',
        contactAddresses: [
          'Po 09:00-16:00, Út 12:30-16:00, St 12:00-17:00, Čt 12:00-16:00, konzultace bez předchozí domluvy každé pondělí 13:00-16:00',
          'Karlovarská 337/18 161 00 Praha 6 – Ruzyně',
          '235 302 698, 607 199 291',
          'veronikavejvodova@dumtriprani.cz',
          'https://www.dumtriprani.cz/nase-centra/dum-premysla-pittra-pro-deti/',
        ],
      ),
      RegionItemContact(
        name: 'Modré dveře - krizová pomoc (Hostivař)',
        contactAddresses: [
          'Po-Pá 08:00-16:00',
          'K Horkám 23/16, Praha 10 - Hostivař',
          '725 515 934',
          'https://www.modredvere.cz/cz/praha-krizova-pomoc',
        ],
      ),
      RegionItemContact(
        name: 'Modré dveře - krizová pomoc (Říčany)',
        contactAddresses: [
          'Po-Pá 08:00-16:00',
          'Tyrše a Fügnera 105/7, Říčany',
          '725 515 905',
          'https://www.modredvere.cz/cz/ricany-krizova-pomoc',
        ],
      ),
      RegionItemContact(
        name: 'SOS centrum Diakonie ČCE - SKP v Praze',
        contactAddresses: [
          'Po-Pá 08:00-20:00',
          'Varšavská 37, Praha 2',
          '777 734 173, 222 514 040',
          'linka.duvery@diakonie-praha.cz',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Jihomoravský kraj',
    contacts: [
      RegionItemContact(
        name: 'Krizové centrum Psychiatrické kliniky FN Brno',
        contactAddresses: [
          'NONSTOP',
          'Jihlavská 20, Brno pavilon G',
          '532 232 078, 547 212 333',
          'https://www.fnbrno.cz/psychiatricka-klinika/k1484',
        ],
      ),
      RegionItemContact(
        name: 'Krizové centrum pro děti a dospívající',
        contactAddresses: [
          'Po-Pá 8-20',
          'Hapalova 4 Brno 621 00',
          '541 229 298, 723 006 004',
          'css.sspd@volny.cz',
          'https://www.krizovecentrum.cz/',
        ],
      ),
      RegionItemContact(
        name: 'Okno dokořán Blansko',
        contactAddresses: [
          'Po 8:30-11:30 12:00-15:00, St 9:00-12:30, Čt 7:30-1:30, Pá 7:30-11:30 12:00-15:00',
          'Komenského 19, 678 01 Blansko',
          'krizovapomoc@blansko.charita.cz',
          'https://blansko.charita.cz/co-delame/jsem-v-krizi/charitni-krizova-pomoc/',
        ],
      ),
      RegionItemContact(
        name: 'SPONDEA',
        contactAddresses: [
          'nutné se předem objednat',
          'Sýpka 25, 613 00 Brno, Česká republika',
          '608 118 088, 725 735 983',
          'https://www.spondea.cz/cz/kontakt',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Jihočeský kraj',
    contacts: [
      RegionItemContact(
        name: 'Krizové centrum - Centrum pomoci rodině a dětem',
        contactAddresses: [
          'Po - Pá 08:00-16:00',
          'Starokasárenská 192, 383 01 Prachatice',
          '736 213 002',
          'krizac@portusprachatice.cz',
          'https://www.portusprachatice.cz/krizove-centrum-centrum-pomoci-rodine-a-detem_169.html',
        ],
      ),
      RegionItemContact(
        name: 'Akráda - sociálně psychologické centrum, z.ú',
        contactAddresses: [
          'Po, St, Pá 08:00 - 15:00, Út, Čt 08:00-17:00',
          '382 211 300',
          'info@arkada-pisek.cz',
          'http://arkada.jaroslavabromova.cz/krizova-pomoc/',
        ],
      ),
      RegionItemContact(
        name: 'Krizové centrum - Centrum pro rodinu a děti',
        contactAddresses: [
          'Po, Út 08:00-16:00, St 08:00-18:00, Čt, Pá 08:00-14:00',
          'Jiráskovo nábřeží 1549/10,  370 04 České Budějovice',
          '776 763 176',
          'pomoc@ditevkrizi.cz',
          'https://www.ditevkrizi.cz/kontakt/',
        ],
      ),
      RegionItemContact(
        name: 'THEiA - krizové centrum, o.p.s.',
        contactAddresses: [
          'Po 08:00-18:00, Út, Čt 08:00-14:00, St 08:00-15:30, Pá pouze na objednání.',
          'Mánesova 11/3b, 370 01 České Budějovice',
          '728 008 771',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Olomoucký kraj',
    contacts: [
      RegionItemContact(
        name: 'Krizové centrum Olomouc',
        contactAddresses: [
          'Po - Pá od 8:00 do 18:00',
          'Riegrova 406/1 Olomouc',
          '734 435 078',
          'https://www.olomouc.charita.cz/nase-sluzby/lide-v-krizi/krizova-pomoc/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Plzeňský kraj',
    contacts: [
      RegionItemContact(
        name: 'Diakonie Českobratrské církve evangelické - PLUS pro lidi v krizové situaci',
        contactAddresses: [
          'Po, Pá 08:00-17:00',
          'Resslova 12, 301 00 Plzeň',
          '733 414 421',
          'plus@diakoniezapad.cz',
          'https://www.diakoniezapad.cz/sluzby-diakonie-zapad/pro-lidi-v-nouzi/plus-pro-lidi-v-krizove-situaci/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Karlovarský kraj',
    contacts: [
      RegionItemContact(
        name: 'Diecézní charita Plzeň - Krizová pomoc Cheb',
        contactAddresses: [
          'NONSTOP',
          'Koželužská 19, 350 02 Cheb',
          '731 433 007, 731 433 079',
          'charitabetlem@dchp.charita.cz',
          'https://www.dchp.cz/jak-pomahame/v-karlovarskem-kraji/pomoc-v-krizovych-situacich/krizova-pomoc-cheb/',
        ],
      ),
      RegionItemContact(
        name: 'Res vitae Karlovy Vary',
        contactAddresses: [
          'Po, Pá 18:00-06:00',
          'Blahoslavova 659/18, 360 09, Karlovy Vary',
          'https://resvitae.cz/krizove-centrum',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Moravskoslezský kraj',
    contacts: [
      RegionItemContact(
        name: 'Centrum sociálních služeb Ostrava, o.p.s. - Krizové centrum pro děti a rodinu',
        contactAddresses: [
          'Po, St 08:00-15:00 (bez objednání), Po, Pá 06:00-18:00 (individuální domluva na uvedených kontaktech)',
          'Syllabova 1161/19, Ostrava – Vítkovice',
          '778 111 281',
          'kcd@css-ostrava.cz',
          'https://www.css-ostrava.cz/sluzba/krizove-centrum-pro-deti-a-rodinu/#about',
        ],
      ),
      RegionItemContact(
        name: 'Charita Opava - Naděje - Středisko krizové pomoci',
        contactAddresses: [
          'Po, Pá 07:00-15:30 (ambulantní služba), Pá 09:00-11:00 (terénní služba)',
          'Kylešovská 0, 746 01 Opava',
          '553 653 776, 737 615 459',
          'nadeje@charitaopava.cz',
          'https://www.charitaopava.cz/informace/nadeje-stredisko-krizove-pomoci/24',
        ],
      ),
      RegionItemContact(
        name: 'KCO - Krizové centrum Ostrava',
        contactAddresses: [
          'NONSTOP',
          'Ruská 94/29, Ostrava - Vítkovice',
          '596 110 882-3, 732 957 193',
          'krizovecentrum@kriceos.cz',
          'http://www.kriceos.cz/index.html',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Královéhradecký kraj',
    contacts: [
      RegionItemContact(
        name: 'NOMIA, z.ú',
        contactAddresses: [
          'Po, Pá 08:00-16:00',
          'třída Edvarda Beneše 575, 500 12 Hradec Králové',
          '606 824 104, 495 262 214',
          'poradna@nomiahk.cz',
          'https://nomiahk.cz/detske-krizove-centrum/	',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Pardubický kraj',
    contacts: [
      RegionItemContact(
        name: 'Centrum J. J. Pestalozziho, o.p.s. - Krizové centrum Chrudim',
        contactAddresses: [
          'Po, St 07:30-17:00, Út 07:30-15:30, Čt 07:30-16:00, Pá 07:30-14:30',
          'Štěpánkova 108, 537 01 Chrudim',
          '469 623 899, 725 838 213',
          'kc@pestalozzi.cz',
          'https://pestalozzi.cz/sluzby/krizove-centrum-chrudim/',
        ],
      ),
      RegionItemContact(
        name: 'Centrum J. J. Pestalozziho, o.p.s. - Krizové centrum Svitavy',
        contactAddresses: [
          'Po, St 07:30-17:00, Út 07:30-15:30, Čt 07:30-16:00, Pá 07:30-14:30',
          'Milady Horákové 10, 568 02 Svitavy',
          '461 321 100, 461 321 200, 725 719 029',
          'kcsvi@pestalozzi.cz',
          'https://pestalozzi.cz/sluzby/krizove-centrum-svitavy/',
        ],
      ),
      RegionItemContact(
        name: 'Centrum J. J. Pestalozziho, o.p.s. - Krizové centrum Žamberk',
        contactAddresses: [
          'Po, St 07:30-17:00, Út 07:30-15:30, Čt 07:30-16:00, Pá 07:30-14:30',
          'Masarykovo nám. 86, 564 01 Žamberk',
          '725 838 127',
          'kcza@pestalozzi.cz',
          'https://pestalozzi.cz/sluzby/krizove-centrum-zamberk/',
        ],
      ),
      RegionItemContact(
        name: 'Cesta pro rodinu (těhotné ženy, rodiče s dětmi)',
        contactAddresses: [
          'NONSTOP',
          'Čs. armády 728 564 01 Žamberk',
          '465 321 295, 465 321 327',
          'jansova@cestaprorodinu.cz',
          'https://www.cestaprorodinu.cz/sluzby/azylovy_dum_a_krizova_pomoc/krizova_pomoc-3-13-21.html',
        ],
      ),
      RegionItemContact(
        name: 'Krizové centrum Pardubice',
        contactAddresses: [
          'Po, 09:00 -12:00 (telefonní poradenství), 12:00-16:00 (osobní konzultace), Út 09:00-14:00 (telefonické poradenství), St 09:00-13:00 (osobní konzultace), Čt, Pá 09:00-13:00',
          'Erno Košťála 1013, 530 12 Pardubice',
          '608 432 117',
          'kc.pardubice@skp-centrum.cz',
          'https://www.skp-centrum.cz/nase-sluzby-a-projekty/krizove-centrum-pardubice',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Kraj Vysočina',
    contacts: [
      RegionItemContact(
        name: 'Centrum J. J. Pestalozziho, o.p.s. - Krizové centrum Jihlava',
        contactAddresses: [
          'Po, St 07:30-17:00, Út 07:30-15:30, Čt 07:30-16:00, Pá 07:30-14:30',
          'Štefanikovo nám. 1972/2, Jihlava',
          '567 155 028, 727 803 665',
          'kcji@pestalozzi.cz',
          'https://pestalozzi.cz/sluzby/krizove-centrum-jihlava/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Ústecký kraj',
    contacts: [
      RegionItemContact(
        name: 'Most k naději - Krizová poradna',
        contactAddresses: [
          'Po 12:00-17:30 (bez objednání), Út, Pá pouze na objednání',
          'Jilemnického 1929, 434 01 Most',
          '728 697 202',
          'ldt.most@seznam.cz',
          'http://www.mostknadeji.eu/ustecky-kraj/krizova/',
        ],
      ),
      RegionItemContact(
        name: 'Spirála Ústecký kraj, z.s. - Centrum krizové intervence Ústí nad Labem',
        contactAddresses: [
          'K Chatám 22, 403 40 Ústí nad Labem – Skorotice',
          '475 603 390',
          'https://spirala-ul.cz/sluzby/ambulantni-sluzba/',
        ],
      ),
      RegionItemContact(
        name: 'Spirála Ústecký kraj, z.s. - Centrum krizové intervence Rumbuk',
        contactAddresses: [
          'Pá 10:00-16:00',
          'Máchova 492/30, Rumburk 1, 408 01 Rumburk',
          '475 603 390',
          'vedouci.cki@spirala-ul.cz',
          'https://spirala-ul.cz/centra/rumburk/',
        ],
      ),
      RegionItemContact(
        name: 'Spirála Ústecký kraj, z.s. - Centrum krizové intervence Louny',
        contactAddresses: [
          'Út 10:00-16:00',
          'Pod Nemocnicí 2503, 440 01 Louny',
          '475 603 390',
          'louny@spirala.cz',
          'https://spirala-ul.cz/centra/louny/',
        ],
      ),
      RegionItemContact(
        name: 'Spirála Ústecký kraj, z.s. - Triangl - krizové centrum pro děti',
        contactAddresses: [
          'Út, Čt 10:00-18:00',
          'K Chatám 22, 403 40 Ústí nad Labem – Skorotice',
          '475 603 390',
          'deti@spirala-ul.cz',
          'https://spirala-ul.cz/sluzby/krizove-centrum-triangl/',
        ],
      ),
    ],
  ),
  RegionContact(
    region: 'Zlínský kraj',
    contacts: [
      RegionItemContact(
        name: 'Poradenské a krizové centrum, o.p.s.',
        contactAddresses: [
          'Po 09:00-12:00, Čt 14:00-17:00',
          'Divadelní 3354, Zlín',
          '730 166 862',
          'kp@pkcentrum.cz',
          'https://pkcentrum.cz/nase-sluzby/krizova-pomoc/',
        ],
      ),
    ],
  ),
];

const _chatContacts = <ChatContact>[
  ChatContact.subList(
    title: 'Nepanikař',
    subChatContacts: [
      SubChatContact(
        title: 'Po-Pá 16-21h',
        url: 'https://nepanikar.eu/poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Linka Bezpečí',
    subChatContacts: [
      SubChatContact(
        title: 'Denně 9-13h a 15-19h',
        url: 'https://www.linkabezpeci.cz/chat',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'iPoradna',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://iporadna.cz/elinka-chatova-poradna/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Modrá linka',
    subChatContacts: [
      SubChatContact(
        title: 'Po, St, Ne 18-22h\nPá 10-13h',
        url: 'https://chat.modralinka.cz/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Chat pražské linky důvěry',
    subChatContacts: [
      SubChatContact(
        title: 'Po-Čt 9-21h\nPá 16-20h\nSo 14-20h',
        url: 'https://www.chat-pomoc.cz/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Linka první psychické pomoci',
    subChatContacts: [
      SubChatContact(
        title: 'Po-Ne 12-17h',
        url: 'https://linkapsychickepomoci.cz/chat/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Linka pro rodinu a školu',
    subChatContacts: [
      SubChatContact(
        title: 'Po-Ne 15-18h',
        url: 'https://linkaztracenedite.cz/chat/',
      ),
    ],
  ),
  ChatContact.subList(
    title: 'Locika - dětství bez násilí',
    subChatContacts: [
      SubChatContact(
        title: 'Po-Pá 13-17h',
        url: 'https://locika.neziskovky.com/',
      ),
    ],
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
  'Centrum Anabell',
  'Masarykova 37',
  '602 000 Brno',
  '',
  'Centrum Anabell',
  'Pivovarská 10',
  '702 00 Ostrava',
  '',
  'Centrum Anabell',
  'Cimburkova 21',
  '130 00 Praha 3',
  '',
  'http://www.anabell.cz/',
  '774 467 293',
];
