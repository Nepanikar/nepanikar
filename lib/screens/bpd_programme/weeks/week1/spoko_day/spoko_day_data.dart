// Long verbatim copy is wrapped across lines with adjacent string literals
// (required for const context); the resulting list elements are intentional.
// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';

/// What the optional safety contact deep-link on a SPOKO day should do.
enum SpokoContactAction {
  /// Open the eating-disorder (PPP) contacts screen.
  eatingDisorderContacts,

  /// No dedicated screen yet — show a "coming soon" hint.
  comingSoon,
}

/// Optional safety contact shown on sensitive SPOKO days (3 – PPP, 4 – látky).
@immutable
class SpokoContact {
  const SpokoContact({required this.text, required this.label, required this.action});

  final String text;
  final String label;
  final SpokoContactAction action;
}

/// Content for one SPOKO day (Days 3–6 of Week 1). Drives [SpokoDayScreen]:
/// a 3-page flow (education + mapping questions → challenge → completion).
///
/// All displayed copy is verbatim from docs/hpo/source/tyzden-1.md.
@immutable
class SpokoDayData {
  const SpokoDayData({
    required this.weekNumber,
    required this.dayNumber,
    required this.appBarTitle,
    required this.headerIcon,
    required this.headerTitle,
    required this.areaLabel,
    required this.educationParagraphs,
    required this.note,
    required this.questions,
    this.contact,
    required this.challengeLead,
    required this.futureLead,
    required this.challengeItems,
    required this.completionIcon,
    required this.completionHeading,
    required this.completionPraise,
  });

  final int weekNumber;
  final int dayNumber;
  final String appBarTitle;
  final IconData headerIcon;
  final String headerTitle;

  /// Short, uniform SPOKO area name (e.g. "Potrava") used to tag the tracked
  /// challenges in "Moje výzvy" (card badge + filter chips).
  final String areaLabel;
  final List<String> educationParagraphs;
  final String note;
  final List<String> questions;
  final SpokoContact? contact;
  final String challengeLead;
  final String futureLead;
  final List<String> challengeItems;
  final IconData completionIcon;
  final String completionHeading;
  final String completionPraise;
}

// ── Day 3 — Potrava (verbatim, source: tyzden-1.md §3) ──────────────────────

const spokoDay3Potrava = SpokoDayData(
  weekNumber: 1,
  dayNumber: 3,
  appBarTitle: 'Den 3 · Potrava',
  headerIcon: Icons.restaurant_outlined,
  headerTitle: 'P – potrava',
  areaLabel: 'Potrava',
  educationParagraphs: [
    'Druhou oblastí v modelu SPOKO je potrava. Pojďme se dnes zaměřit jen na '
        'tuto oblast.',
    'Jídlo ovlivňuje nejen tělo, ale i emoce, energii a schopnost zvládat '
        'stres. Pravidelný a dostatečný příjem potravy pomáhá stabilizovat '
        'náladu a snižuje zranitelnost vůči emočním výkyvům.',
  ],
  note:
      'Podobně jako včera začneme chvilkou k zamyšlení. Následující otázky '
      'nemají správné ani špatné odpovědi. Pomáhají všimnout si, jak tvé '
      'stravování aktuálně vypadá a jak ovlivňuje tvoji energii a pohodu.',
  questions: [
    'Jak pravidelně během dne jíš?',
    'Všímáš si, že ti jídlo ovlivňuje náladu nebo energii?',
    'Stává se, že vynecháváš jídlo nebo jíš až ve velkém hladu?',
    'Jak vypadá tvůj typický denní rytmus jídla?',
    'Jak se cítíš fyzicky i psychicky, když jíš pravidelně vs. nepravidelně?',
  ],
  contact: SpokoContact(
    text:
        'Pokud cítíš, že je pro tebe oblast jídla problematická nebo vyvolává '
        'nepříjemné emoce, můžeš se obrátit na následující kontakty.',
    label: 'Kontakty (PPP)',
    action: SpokoContactAction.eatingDisorderContacts,
  ),
  challengeLead:
      'Zkusme i pro dnešek společnou výzvu. Vyber si alespoň jednu věc, kterou '
      'vyzkoušíš.',
  futureLead: 'Můžeš si nastavit výzvu i do budoucna.',
  challengeItems: [
    'Najíst se alespoň 3x během dne',
    'Nevynechat žádné hlavní jídlo (snídaně, oběd, večeře)',
    'Vypít alespoň 2,5 litru',
    'Dát si jídlo bez telefonu/obrazovky',
    'Zkusit jíst pomaleji a vnímat chuť jídla',
    'Přidat k jídlu navíc ovoce nebo zeleninu',
    'Najíst se dřív, než přijde „extrémní hlad“',
  ],
  completionIcon: Icons.restaurant_outlined,
  completionHeading: 'Hezky!',
  completionPraise: 'Hodně štěstí v dnešní výzvě! Potkáme se zase zítra',
);

// ── Day 4 — Ne Omamným látkám (verbatim, source: tyzden-1.md §4) ────────────

const spokoDay4Latky = SpokoDayData(
  weekNumber: 1,
  dayNumber: 4,
  appBarTitle: 'Den 4 · Omamné látky',
  headerIcon: Icons.smoke_free,
  headerTitle: 'O – ne omamným látkám',
  areaLabel: 'Omamné látky',
  educationParagraphs: [
    'Dnešek zaměříme na téma omamných látek. Omamné látky (např. alkohol, '
        'nikotin a jiné psychoaktivní látky) mohou krátkodobě měnit náladu nebo '
        'uvolnit napětí. Dlouhodobě ale úplně nepomáhají. Často zvyšují emoční '
        'nestabilitu, zhoršují spánek, impulzivitu a schopnost zvládat stres. '
        'U některých lidí se také mohou stát rychlým způsobem regulace emocí, '
        'který ale dlouhodobě oslabuje jiné strategie zvládání.',
  ],
  note:
      'Následující otázky nemají hodnotit ani soudit. Pomáhají všimnout si '
      'vlastního vztahu k omamným látkám.',
  questions: [
    'Jaký je tvůj vztah k omamným látkám (alkohol, nikotin, jiné)?',
    'V jakých situacích po nich saháš?',
    'Co ti v tu chvíli přinášejí?',
    'Co se děje s tvou náladou nebo energií po jejich užití?',
    'Všímáš si někdy negativních dopadů následující den?',
  ],
  contact: SpokoContact(
    text:
        'Pokud máš pocit, že omamné látky negativně ovlivňují Tvůj život, není '
        'ostuda vyhledat pomoc.',
    label: 'Infolinka Podané ruce',
    action: SpokoContactAction.comingSoon,
  ),
  challengeLead:
      'Máme tu další výzvu, která bude souviset s omezením návykových látek. '
      'Zkus si zase vybrat alespoň jednu aktivitu z listu.',
  futureLead: 'Můžeš si nastavit výzvu i do budoucna.',
  challengeItems: [
    'dnes nepoužít žádné omamné látky',
    'odložit první cigaretu / alkohol / jinou látku o několik hodin',
    'všimnout si, kdy během dne přichází chuť po látce (bez hodnocení)',
    'nahradit jednu „rutinní“ dávku jinou aktivitou (čaj, procházka, dech)',
    'vypít sklenici vody navíc v situaci, kdy bych jinak sáhl/a po látce',
    'dát si pauzu 10 minut před tím, než se rozhodnu látku použít',
    'zaznamenat si, jak se cítím před a po užití (jen pozorování)',
    'zkusit jeden den vědomě snížit množství',
  ],
  completionIcon: Icons.eco_outlined,
  completionHeading: 'Hezky!',
  completionPraise:
      'Máš za sebou čtvrtý den a téma, které nemusí být vůbec jednoduché '
      'otvírat. Chceme ocenit tvou odvahu se nad ním zamyslet a zkusit dnešní '
      'výzvu. Každé vědomé zpomalení nebo změna rutiny se počítá. Pro dnešek '
      'je to všechno, dopřej si zasloužený klid a potkáme se zase zítra.',
);

// ── Day 5 — Kondice (verbatim, source: tyzden-1.md §5) ──────────────────────

const spokoDay5Kondice = SpokoDayData(
  weekNumber: 1,
  dayNumber: 5,
  appBarTitle: 'Den 5 · Kondice',
  headerIcon: Icons.directions_run,
  headerTitle: 'K – kondice',
  areaLabel: 'Kondice',
  educationParagraphs: [
    'Pojďme se dnes zaměřit na kondici. Pohyb a fyzická aktivita mají přímý '
        'vliv na náladu, stres i energii. Pravidelný pohyb pomáhá tělu zpracovat '
        'napětí a podporuje psychickou stabilitu. Nejde o výkon ani vzhled, ale '
        'o to, jak se tělo cítí v pohybu.',
    'Nemusí jít o sport, stačí malý pohyb během dne.',
  ],
  note: 'Nejdřív se zkus zamyslet nad tvým vztahem k pohybu..',
  questions: [
    'Jak často se během týdne hýbeš?',
    'Jak se cítíš během a po pohybu?',
    'Co ti v pohybu brání?',
    'Co ti naopak pohyb usnadňuje?',
  ],
  challengeLead: 'Podobně jako předchozí dny, zkus si vybrat i pro dnešek nějakou výzvu:',
  futureLead: 'Pokud máš zájem, můžeš si nastavit výzvu i do budoucna.',
  challengeItems: [
    'jít na 10–20 minut procházky',
    'protáhnout se 5–10 minut během dne',
    'vyjít schody místo výtahu',
    'udělat lehký domácí pohyb (úklid, tanec, práce kolem domu)',
    'krátké cvičení (např. 5–10 minut podle vlastního výběru)',
    'venku strávit alespoň 10 minut na čerstvém vzduchu',
    'vědomě uvolnit napětí v těle (ramena, čelist, záda)',
    'všimnout si, kdy během dne sedím dlouho, a jednou se zvednout',
    'udělat pohyb jen „pro uvolnění“, ne pro výkon',
    'zkusit si všimnout, jak se mění nálada po pohybu',
  ],
  completionIcon: Icons.directions_run,
  completionHeading: 'Skvělá práce!',
  completionPraise:
      'Každé protažení, procházka nebo jen vědomé uvolnění napětí má obrovský '
      'smysl pro tvou psychickou pohodu. Děkujeme za tvou energii, kterou do '
      'programu vkládáš.',
);

// ── Day 6 — Léčba Onemocnění (verbatim, source: tyzden-1.md §6) ─────────────

const spokoDay6Onemocneni = SpokoDayData(
  weekNumber: 1,
  dayNumber: 6,
  appBarTitle: 'Den 6 · Léčba onemocnění',
  headerIcon: Icons.medical_services_outlined,
  headerTitle: 'O – léčba onemocnění',
  areaLabel: 'Léčba onemocnění',
  educationParagraphs: [
    'Dnes zakončíme model SPOKO. Písmeno O zastupuje oblast “léčby '
        'onemocnění”.',
    'Tělesné i psychické zdraví jsou propojené. Neléčené nebo přehlížené '
        'zdravotní potíže mohou výrazně ovlivňovat náladu, energii, spánek i '
        'schopnost zvládat stres. Péče o zdraví není slabost ani „něco navíc“, '
        'ale základní součást dlouhodobé stability.',
  ],
  note:
      'Následující otázky nemají hodnotit ani diagnostikovat. Pomáhají si '
      'všimnout, jak se aktuálně staráš o své zdraví.',
  questions: [
    'Máš nějaké zdravotní potíže, které teď ovlivňují tvůj život?',
    'Všímáš si signálů svého těla, když se něco děje?',
    'Máš v péči o zdraví něco, co dlouhodobě odkládáš?',
    'Jak snadné nebo těžké je pro tebe vyhledat pomoc, když ji potřebuješ?',
    'Kdy naposledy jsi aktivně udělal/a něco pro své zdraví (lékař, terapie, '
        'kontrola, odpočinek)?',
  ],
  challengeLead:
      'Dnes si stanovíme poslední výzvu tohoto týdne. Zkus si vybrat z '
      'následujícího seznamu aktivit a zkus něco.',
  futureLead: 'Pokud máš zájem, můžeš si nastavit výzvu i do budoucna.',
  challengeItems: [
    'objednat se na preventivní kontrolu nebo vyšetření',
    'řešit zdravotní problém, který dlouhodobě odkládám',
    'vzít si léky nebo doporučenou péči podle plánu',
    'dopřát si odpočinek, pokud tělo signalizuje únavu nebo přetížení',
    'napsat si seznam zdravotních témat, která chci řešit',
    'všimnout si tělesných signálů během dne (bez hodnocení)',
    'udělat jeden malý krok směrem k péči o své zdraví (např. telefonát, '
        'objednání)',
    'dát si dnes prioritu „fungovat šetrně“, ne „jet na výkon“',
  ],
  completionIcon: Icons.health_and_safety_outlined,
  completionHeading: 'Dobrá práce!',
  completionPraise: 'To je pro dnešek vše.',
);
