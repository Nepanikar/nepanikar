// ignore_for_file: no_adjacent_strings_in_list

/// Week 7, Day 1 — ocenění.
///
/// Copy verbatim from `docs/hpo/source/tyzden-7.md` §1.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/4 — the final week
// ─────────────────────────────────────────────────────────────────────────────

/// Bullet 1, split in two: it is one long sentence plus one longer one.
const day1Opening = <String>[
  'Dnes začínáme závěrečný týden programu, který je věnovaný shrnutí, reflexi a '
      'ocenění toho, co ses během předchozích týdnů naučil/a.',
  'Bude to příležitost se zastavit, podívat se zpět na své pokroky a uvědomit '
      'si, co ti fungovalo nejlépe, co tě posunulo dál a co chceš dál používat '
      've svém každodenním životě.',
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/4 — what I am proud of
// ─────────────────────────────────────────────────────────────────────────────

const day1ProudWorksheetId = 'week7_day1_proud';

const day1ProudLead =
    'Teď si najdi chvíli a zamysli se nad tím, co se ti během programu podařilo '
    'nebo co ses naučil/a. Napiš 3–5 věcí, na které jsi pyšný/á. U každé věci '
    'napiš, proč je pro tebe důležitá a jak ti pomáhá v každodenním životě. '
    'Tento krok ti pomůže uvědomit si své pokroky a posílit motivaci pokračovat '
    'v praxi, kterou ses naučil/a.';

/// The source asks for "3–5 věcí", so there are five places and none is
/// required — someone who writes three is finished.
///
/// One field per item rather than three (what / why / how it helps): fifteen
/// boxes would turn a moment of appreciation into paperwork, so the author's
/// three questions ride in the hint instead.
const day1ProudHint = 'Co to je, proč je to pro tebe důležité a jak ti to pomáhá?';

const day1ProudWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: '1.',
    fields: [WorksheetField(id: 'proud_1', label: '1.', hint: day1ProudHint)],
  ),
  WorksheetSection(
    title: '2.',
    fields: [WorksheetField(id: 'proud_2', label: '2.', hint: day1ProudHint)],
  ),
  WorksheetSection(
    title: '3.',
    fields: [WorksheetField(id: 'proud_3', label: '3.', hint: day1ProudHint)],
  ),
  WorksheetSection(
    title: '4.',
    fields: [WorksheetField(id: 'proud_4', label: '4.', hint: day1ProudHint)],
  ),
  WorksheetSection(
    title: '5.',
    fields: [WorksheetField(id: 'proud_5', label: '5.', hint: day1ProudHint)],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/4 — reviewing the SMART goals from Week 1
// ─────────────────────────────────────────────────────────────────────────────

const day1SmartWorksheetId = 'week7_day1_smart_review';

/// The author's instruction, split so her reassurance can stand on its own card
/// above the list of goals rather than being buried under it.
const day1SmartLead =
    'Teď si otevři své SMART cíle, které jsi si stanovil/a na začátku programu. '
    'Podívej se na každý cíl a zhodnoť, co se ti podařilo splnit, co jen '
    'částečně a co se nepodařilo.';

const day1SmartReassuranceTitle = 'I nesplněný cíl se počítá';
const day1SmartReassurance =
    'Pamatuj, že i když se některý cíl nebo klidně žádný nesplnil, je to úplně '
    'v pořádku – i to znamená, že jsi udělal/a obrovský kus práce a posunul/a '
    'se dál.';

const day1SmartTask =
    'Zamysli se, co ti pomohlo a co tě brzdilo, a u každého cíle si napiš, jak '
    'ho chceš dál využívat nebo případně upravit, aby ti sloužil i po skončení '
    'programu.';

const day1SmartFieldLabel = 'Jak ho chceš dál využívat nebo upravit?';

/// Shown when Week 1 left no goals behind — someone who skipped that page, or
/// who joined the programme later. An empty screen would read as a bug, and
/// worse, as if their work had been lost.
// TODO: schválit autorem (WEEK7_SCREEN_PLAN.md → OQ-5)
const day1SmartEmptyTitle = 'Žádné cíle tu zatím nejsou';
const day1SmartEmpty =
    'Vypadá to, že sis v prvním týdnu SMART cíl nezapsal/a — a to je v pořádku. '
    'Můžeš si ho stanovit i teď, na konci programu; poslouží ti stejně dobře.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/4 — completion
// ─────────────────────────────────────────────────────────────────────────────

const day1CompletionText =
    'Na další část se zaměříme zítra :) Program už se pomalu blíží ke konci, tak '
    'zkus ještě vytrvat';
