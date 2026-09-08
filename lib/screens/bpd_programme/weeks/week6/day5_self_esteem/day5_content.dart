// ignore_for_file: no_adjacent_strings_in_list

/// Week 6, Day 5 — sebeúcta.
///
/// Copy verbatim from `docs/hpo/source/tyzden-6.md` §5, with two documented
/// exceptions (WEEK6_SCREEN_PLAN.md → OQ-2):
///
/// * the source runs the "O" heading onto the end of the "Z" instruction with
///   no line break ("…aby ses přizpůsobil/a**O – bez zbytečných Omluv**") —
///   split here at the obvious intent;
/// * "U – Upřímnosts" carries a stray trailing "s", dropped here.
///
/// Nothing else was touched.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/4 — what self-esteem is
// ─────────────────────────────────────────────────────────────────────────────

const day5Opening = <String>[
  'Dnes se budeme věnovat budování sebeúcty. Sebeúcta je pocit, že si vážíš '
      'sám/sama sebe, svých potřeb, pocitů a práv.',
  'Pomáhá nám lépe se rozhodovat, nastavovat zdravé hranice a být odolný/á vůči '
      'kritice nebo tlakům z okolí. Silná sebeúcta podporuje zdravé vztahy, '
      'snižuje impulzivní reakce a zvyšuje schopnost jednat uvědoměle a '
      'sebevědomě v různých životních situacích.',
];

const day5SkillIntro =
    'Dovednost “neZOUFej” ti pomáhá chránit a posilovat sebeúctu při komunikaci '
    's ostatními. Umožňuje vyjádřit své potřeby a názory jasně a asertivně, aniž '
    'bys ubližoval/a druhým nebo snižoval/a sám/sama sebe. Používáním “neZOUFej” '
    'se učíš zachovat respekt k sobě i k druhým a udržet rovnováhu mezi tím, co '
    'chceš a co je pro tebe důležité.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/4 — neZOUFej
// ─────────────────────────────────────────────────────────────────────────────

const day5NezoufejLetters = <AcronymLetter>[
  (
    'Z',
    'Zásadovost',
    'drž se svých hodnot a principů, i když je tlak okolí, aby ses přizpůsobil/a',
  ),
  (
    'O',
    'bez zbytečných Omluv',
    'neomlouvej se za to, že chráníš své hranice nebo respektuješ své potřeby',
  ),
  ('U', 'Upřímnost', 'mluv pravdu a buď upřímný/á o svých pocitech a potřebách'),
  (
    'F',
    'Férovost',
    'buď spravedlivý/á k sobě i druhým, nesnaž se druhé manipulovat ani je obviňovat',
  ),
];

const day5NezoufejRescueId = 'week6_nezoufej';

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/4 — the neZOUFej worksheet
// ─────────────────────────────────────────────────────────────────────────────

const day5WorksheetId = 'week6_day5_nezoufej';

const day5WorksheetLead =
    'Teď si vyzkoušíš dovednost “neZOUFej” na konkrétní situaci, kdy někdo tlačí '
    'na tvoje hranice nebo tě kritizuje. Cílem je procvičit, jak zůstat '
    'spravedlivý/á, chránit svou sebeúctu, držet se svých hodnot a mluvit '
    'pravdu. Doplň si jednotlivé kroky podle vlastních pocitů a potřeb, aby '
    'odpovídaly tvé zkušenosti.';

/// Six steps, verbatim: heading and prompt exactly as the source writes them.
///
/// The source gives "reflexe" two questions under one heading, so they share
/// one field rather than being split into two the author did not ask for.
const day5NezoufejWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: 'situace',
    fields: [
      WorksheetField(
        id: 'situation',
        label: 'situace',
        hint: 'popiš situaci, kdy někdo tlačí na tvoje hranice nebo tě kritizuje',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Z – zásadovost',
    fields: [
      WorksheetField(
        id: 'z',
        label: 'Z – zásadovost',
        hint: 'jaké své hodnoty nebo principy chceš při této situaci dodržet?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'O – bez zbytečných Omluv',
    fields: [
      WorksheetField(
        id: 'o',
        label: 'O – bez zbytečných Omluv',
        hint: 'jak můžeš jasně chránit své potřeby a hranice, aniž by ses omlouval/a?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'U – Upřímnost',
    fields: [
      WorksheetField(
        id: 'u',
        label: 'U – Upřímnost',
        hint: 'jak můžeš upřímně a klidně vyjádřit své pocity a potřeby?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'F – Férovost',
    fields: [
      WorksheetField(
        id: 'f',
        label: 'F – Férovost',
        hint: 'jak můžeš jednat spravedlivě k sobě i druhým, aniž bys je '
            'manipuloval/a nebo obviňoval/a?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'reflexe',
    fields: [
      WorksheetField(
        id: 'reflection',
        label: 'reflexe',
        hint: 'co ti při používání “neZOUFej” přišlo snadné a co naopak těžké? '
            'jak se cítil/a, když jsi si ujasnil/a hranice a reagoval/a podle '
            '“neZOUFej”?',
      ),
    ],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/4 — completion
// ─────────────────────────────────────────────────────────────────────────────

const day5CompletionText =
    'Dneska máš za sebou velký kus práce, tak nezoufej a dopřej si odpočinek. '
    'Zasloužíš si to.';
