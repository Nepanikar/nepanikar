// ignore_for_file: no_adjacent_strings_in_list

/// Week 6, Day 2 — dovednosti pro komunikaci s druhými.
///
/// Copy verbatim from `docs/hpo/source/tyzden-6.md` §2.
///
/// Notable: the worked example ("vzor") is the **author's** — the first one
/// since Week 3 that we did not have to invent — so unlike the Week 3 Day 3
/// example it needs no "schválit autorem" note.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/4 — why communication
// ─────────────────────────────────────────────────────────────────────────────

/// Bullet 1, split in two: three long sentences is a wall of text in a bubble.
const day2Opening = <String>[
  'Dnešní den je zaměřený na dovednosti, které ti pomohou komunikovat s druhými '
      'lidmi tak, abys dokázal jasně a s respektem vyjádřit své potřeby, a '
      'přitom udržel dobré vztahy a vlastní sebeúctu.',
  'Patří sem nástroje, které ti ukážou, jak říkat věci otevřeně a nenásilně, '
      'jak prosazovat své cíle, ale zároveň zůstat ohleduplný k ostatním. Díky '
      'tomu se můžeš cítit jistější v mezilidských situacích a postupně si '
      'budovat zdravější a stabilnější vztahy.',
];

/// Bullet 2 — introduces the acronym, likewise split.
const day2Intro = <String>[
  'Někdy je těžké jasně říct, co potřebujeme, nebo odmítnout, co nechceme – '
      'máme obavy, že budeme působit sobecky, že nás druzí odmítnou, nebo že to '
      'povede ke konfliktu.',
  'PSANÍČKo je jednoduchý postup, který ti pomůže mluvit otevřeně a přitom '
      'respektujícím způsobem. Díky němu se můžeš naučit vyjádřit své potřeby '
      'tak, aby tě druzí slyšeli, a zároveň si udržel vztahy i vlastní sebeúctu. '
      'Co znamenají jednotlivá písmena PSANÍČKo?',
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/4 — PSANÍČKo
// ─────────────────────────────────────────────────────────────────────────────

/// Seven letters, verbatim. `Í` and the two-character `Ko` both work because
/// `NumberedBenefit.number` is a `String`.
const day2PsanickoLetters = <AcronymLetter>[
  ('P', 'Popis', 'Jasně a věcně popiš situaci.'),
  ('S', 'Sdělení', 'Řekni, co cítíš a co potřebuješ.'),
  ('A', 'Asertivita', 'Otevřeně požádej nebo řekni ne.'),
  ('N', 'Nabídka', 'Vysvětli, proč se vyplatí vyhovět tvému požadavku.'),
  ('Í', 'Impozantně', 'Drž se svého cíle, nenech se odběhnout.'),
  ('Č', 'Cílevědomě', 'Vystup klidně a s jistotou.'),
  ('Ko', 'Komunikace', 'Buď připraven komunikovat a najít kompromis.'),
];

/// Closing line of the acronym page.
const day2PsanickoClosing =
    'Pomáhá to být jasný, přímý a přitom respektující – díky tomu se zvyšuje '
    'šance, že tě druzí vyslechnou a vezmou vážně.';

const day2PsanickoRescueId = 'week6_psanicko';

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/4 — the PSANÍČKo worksheet
// ─────────────────────────────────────────────────────────────────────────────

const day2WorksheetId = 'week6_day2_psanicko';

const day2WorksheetLead =
    'Vzpomněl/a ses na situaci v komunikaci, kdy bylo těžké někoho o něco '
    'žádat? Držet svoje hranice? Zkus si doplnit věty do worksheetu PSANÍČKo '
    'podle jednotlivých kroků P-S-A-N-Í-Č-Ko tak, aby odrážely tvoji vlastní '
    'zkušenost. Pomůže ti to procvičit, jak vyjádřit své pocity a potřeby '
    'uvědoměle a sebevědomě, aniž bys podlehl/a impulzivní reakci.';

/// Situation first, then one field per letter — eight in all.
///
/// No `visibleSectionLimit`: splitting the acronym across a "show more" would
/// break the very sequence the day is teaching, and the answers are short.
const day2PsanickoWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: 'Situace',
    fields: [
      WorksheetField(
        id: 'situation',
        label: 'Situace',
        hint: 'Co se stalo a s kým?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'P – Popis',
    fields: [
      WorksheetField(id: 'p', label: 'P – Popis', hint: 'Jasně a věcně popiš situaci.'),
    ],
  ),
  WorksheetSection(
    title: 'S – Sdělení',
    fields: [
      WorksheetField(id: 's', label: 'S – Sdělení', hint: 'Řekni, co cítíš a co potřebuješ.'),
    ],
  ),
  WorksheetSection(
    title: 'A – Asertivita',
    fields: [
      WorksheetField(
        id: 'a',
        label: 'A – Asertivita',
        hint: 'Otevřeně požádej nebo řekni ne.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'N – Nabídka',
    fields: [
      WorksheetField(
        id: 'n',
        label: 'N – Nabídka',
        hint: 'Vysvětli, proč se vyplatí vyhovět tvému požadavku.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Í – Impozantně',
    fields: [
      WorksheetField(
        id: 'i',
        label: 'Í – Impozantně',
        hint: 'Drž se svého cíle, nenech se odběhnout.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Č – Cílevědomě',
    fields: [
      WorksheetField(
        id: 'c',
        label: 'Č – Cílevědomě',
        hint: 'Vystup klidně a s jistotou.',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Ko – Komunikace',
    fields: [
      WorksheetField(
        id: 'ko',
        label: 'Ko – Komunikace',
        hint: 'Buď připraven komunikovat a najít kompromis.',
      ),
    ],
  ),
];

/// The author's worked example, verbatim and in her order.
///
/// One collapsible block above the fields rather than one per field: it is a
/// single continuous story about one situation, and split into eight pieces it
/// would stop making sense.
const day2PsanickoExample = <(String, String)>[
  ('Situace', 'Známý ti opakovaně píše nebo říká urážlivé věci, když se neshodnete.'),
  (
    'P - popis',
    '„Všiml/a jsem si, že když se neshodneme, začneš mi psát nebo říkat urážlivé věci.“',
  ),
  ('S - sdělení', '„Cítím se zraněný/á a smutný/á, když se mnou takhle mluvíš.“'),
  ('A - Asertivita', '„Prosím, přestaň mi nadávat a urážet mě, když spolu nesouhlasíme.“'),
  (
    'N - Nabídka',
    '„Když se budeme bavit bez urážek, bude se mi s tebou mnohem lépe komunikovat '
        'a řešit věci.“',
  ),
  ('í - impozantně', 'Drž se svého sdělení, nenech se vtáhnout do hádky nebo obhajování.'),
  (
    'Č - cílevědomě',
    'Mluv klidně, dívej se druhému do očí, nezvyšuj hlas, aby bylo jasné, že to '
        'myslíš vážně.',
  ),
  (
    'Ko - komunikace',
    '„Pokud jsi rozrušený/á, můžeme rozhovor přerušit a vrátit se k němu později, '
        'až se uklidníme.“',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/4 — completion
// ─────────────────────────────────────────────────────────────────────────────

const day2CompletionText =
    'Skvěle, že se do programu pořád pouštíš. Pro dnešní den je to všechno.';
