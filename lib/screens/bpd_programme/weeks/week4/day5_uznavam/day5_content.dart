// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';

/// Week 4, Day 5 — techniky pro zvládnutí okamžiku krize (UZNÁVÁM).
///
/// Copy verbatim from `docs/hpo/source/tyzden-4.md` §5.

const day5IntroChat = <String>[
  'Když přijde silná emoce, někdy ji nejde hned změnit. V takové chvíli pomáhá '
      'odvést pozornost jinam, dokud bouře trochu neodezní.',
  'UZNÁVÁM je sada drobných triků, které ti můžou ulevit, jak?:',
];

/// The seven tricks.
///
/// The letters come from the checklist headings below, which spell U-Z-N-Á-V-Á-M
/// and therefore match the acronym; the source's short list writes "Ú-silím",
/// "Ná-hledem" and two plain "A-", which do not. The *words and instructions*
/// are hers, untouched — only the badge letter follows the checklist
/// (WEEK4_SCREEN_PLAN.md → OQ-10, still to be confirmed by the author).
const day5Letters = <AcronymLetter>[
  ('U', 'Úsilím', 'dělej vědomě něco, co tě zabaví – uklízení, kreslení, seriál.'),
  ('Z', 'Zapojením', 'udělej drobnost pro někoho jiného – napiš zprávu, nabídni pomoc.'),
  ('N', 'Náhledem', 'připomeň si, kdy už ti bylo podobně nebo i hůř – a zvládl/a jsi to.'),
  ('Á', 'Aktivní obranou', 'představ si, že emoci dáš do krabice a na chvíli ji odložíš.'),
  ('V', 'Vytvořením jiné emoce', 'pusť si hudbu nebo film, který vyvolá jinou emoci.'),
  (
    'Á',
    'Aktivací smyslů',
    'využij tělo – dej si studenou sprchu, drž v ruce kostku ledu, protáhni se.',
  ),
  ('M', 'Myšlenkami', 'zkus počítat, luštit sudoku, říkat si básničku'),
];

/// One group of the checklist: its letter, heading and items.
@immutable
class UznavamGroup {
  const UznavamGroup({
    required this.sectionKey,
    required this.letter,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String sectionKey;
  final String letter;
  final String title;
  final IconData icon;
  final List<String> items;
}

/// All 22 checklist items, verbatim. Split across two pages (4 groups + 3) so
/// neither page becomes a wall — same rhythm as the Week 2 pick-lists.
const day5GroupsPart1 = <UznavamGroup>[
  UznavamGroup(
    sectionKey: 'week4_day5_u',
    letter: 'U',
    title: 'Úsilí (činnosti)',
    icon: Icons.brush_outlined,
    items: [
      'Uklidit si pokoj nebo srovnat věci v šuplíku.',
      'Kreslit si, vybarvovat nebo tvořit.',
      'Skládat puzzle nebo stavebnici.',
      'Jít na krátkou, svižnou procházku.',
      'Pustit si oblíbený seriál nebo film.',
    ],
  ),
  UznavamGroup(
    sectionKey: 'week4_day5_z',
    letter: 'Z',
    title: 'Zapojení (přispívání)',
    icon: Icons.volunteer_activism_outlined,
    items: [
      'Napsat někomu blízkému povzbudivou zprávu.',
      'Nabídnout pomoc kamarádovi nebo někomu v rodině.',
      'Udělat pro někoho jiného jakoukoli drobnost, která odvede pozornost od '
          'vlastní bolesti.',
    ],
  ),
  UznavamGroup(
    sectionKey: 'week4_day5_n',
    letter: 'N',
    title: 'Náhled (porovnávání)',
    icon: Icons.history_outlined,
    items: [
      'Připomenout si jinou těžkou situaci, kterou už jsi v minulosti zvládl/a.',
      'Uvědomit si, že i ostatní lidé mají své skryté boje a problémy.',
      'Srovnat aktuální moment s chvílemi, kdy ti bylo podobně nebo i hůř.',
    ],
  ),
  UznavamGroup(
    sectionKey: 'week4_day5_a1',
    letter: 'Á',
    title: 'Aktivní obrana (odstranění)',
    icon: Icons.inventory_2_outlined,
    items: [
      'Představit si, že svou emoci dáváš do krabice a na chvíli ji odkládáš '
          'stranou.',
      'Zapsat si trápící myšlenky na papír a ten fyzicky schovat nebo odložit.',
    ],
  ),
];

const day5GroupsPart2 = <UznavamGroup>[
  UznavamGroup(
    sectionKey: 'week4_day5_v',
    letter: 'V',
    title: 'Vytvoření jiné emoce',
    icon: Icons.music_note_outlined,
    items: [
      'Pustit si hudbu, která vyvolá úplně jiný pocit, než máš teď.',
      'Podívat se na video nebo film, který tě rozesměje nebo napne.',
    ],
  ),
  UznavamGroup(
    sectionKey: 'week4_day5_a2',
    letter: 'Á',
    title: 'Aktivace smyslů',
    icon: Icons.back_hand_outlined,
    items: [
      'Podržet v ruce kostku ledu, dokud se nerozpustí.',
      'Dát si studenou sprchu nebo si opláchnout obličej ledovou vodou.',
      'Vnímat tělo skrze intenzivní protažení.',
      'Soustředit se na to, co právě teď vidíš, slyšíš nebo cítíš hmatem.',
    ],
  ),
  UznavamGroup(
    sectionKey: 'week4_day5_m',
    letter: 'M',
    title: 'Myšlenky',
    icon: Icons.psychology_outlined,
    items: [
      'Počítat cokoli v okolí nebo si v duchu opakovat básničku.',
      'Luštit sudoku, křížovku nebo hrát logickou hru.',
      'Opakovat si neutrální myšlenku, citát nebo afirmaci, která tě uklidňuje.',
    ],
  ),
];

/// Ours. "Zaznačí co vyzkoušeli" is a record of what already happened, so the
/// wording must not read as a task for today.
// TODO: schválit autorem
const day5ChecklistLead = 'Označ, co jsi zkusil/a. Nic z toho není povinné — je to jen pro tebe.';

/// Ours — the source has no closing line. Picks up the thread from page 1/5:
/// after a week 3 spent learning *not* to suppress emotions, a day about
/// distraction needs that distinction said out loud.
// TODO: schválit autorem
const day5CompletionText =
    'UZNÁVÁM není potlačování emocí — je to způsob, jak přečkat tu nejsilnější '
    'chvíli, dokud bouře neodezní. Sedm triků máš uložených, až je budeš '
    'potřebovat.';
