// ignore_for_file: no_adjacent_strings_in_list

/// Week 7, Day 7 — shrnutí a ohlédnutí. The last screen of the programme.
///
/// Copy verbatim from `docs/hpo/source/tyzden-7.md` §7, including "Za těch sedm
/// týdnu" (WEEK7_SCREEN_PLAN.md → OQ-2).
library;

import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/5 — you made it
// ─────────────────────────────────────────────────────────────────────────────

const day7Opening = <String>[
  'Gratuluji, že jsi došel/a až sem. Absolvování celého programu je obrovský kus '
      'práce a každý krok, i ty nejmenší pokroky, mají svou hodnotu.',
  'Můžeš si na chvíli zastavit a opravdu ocenit, co vše jsi během programu '
      'zvládl/a.',
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/5 — three skills to keep
// ─────────────────────────────────────────────────────────────────────────────

const day7SkillsWorksheetId = 'week7_day7_three_skills';

const day7SkillsLead =
    'Zamysli se, které tři dovednosti nebo techniky z programu chceš odnést do '
    'svého života a pravidelně je používat. Napiš si je a přemýšlej, jak je '
    'můžeš integrovat do každodenního života. Tyto tři dovednosti ti mohou '
    'pomoci zvládat stres, emoce, impulzivitu i vztahy s ostatními.';

/// Exactly three — the source says three, not "3–5".
const day7SkillsHint = 'Která dovednost a jak ji zapojíš do běžného dne?';

const day7SkillsWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: '1.',
    fields: [WorksheetField(id: 'skill_1', label: '1.', hint: day7SkillsHint)],
  ),
  WorksheetSection(
    title: '2.',
    fields: [WorksheetField(id: 'skill_2', label: '2.', hint: day7SkillsHint)],
  ),
  WorksheetSection(
    title: '3.',
    fields: [WorksheetField(id: 'skill_3', label: '3.', hint: day7SkillsHint)],
  ),
];

/// The three skills are the single most valuable thing the user leaves the
/// programme with, so they go into the rescue package — reachable from Mé
/// záznamy long after the programme is finished (OQ-3).
const day7SkillsRescueId = 'week7_three_skills';
const day7SkillsRescueTitle = 'Mé tři dovednosti';

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/5 — where to come back to
// ─────────────────────────────────────────────────────────────────────────────

const day7MindfulnessReminder =
    'Připomeň si, že mindfulness a péče o sebe jsou základní nástroje, ke kterým '
    'se můžeš kdykoli vrátit. Když se cítíš rozptýlený/á, vystresovaný/á nebo '
    'impulzivní, vědomé zastavení, dech nebo krátká praxe mindfulness ti mohou '
    'pomoci se uklidnit a znovu se soustředit.';

/// The source ends this one with "(Odkaz na kontakty nepanikař)" — a note to us,
/// not copy. It becomes the card directly below the message, never at the foot
/// of the page: this is the last screen of the programme.
const day7SupportText =
    'Pokud bys potřeboval/a podporu i po skončení programu, můžeš využít kontakty '
    'na krizové linky, terapeuty nebo online zdroje, které jsme během programu '
    'sdíleli. Tyto zdroje jsou tu pro tebe kdykoli budeš potřebovat.';

const day7ContactsLinkLabel = 'Kontakty, když budeš potřebovat';

const day7JustTheBeginning =
    'Program je jen začátek a každý krok, který jsi udělal/a během něj, se '
    'počítá. Představ si, jak tyto tři dovednosti použiješ příští týden, příští '
    'měsíc nebo v konkrétní situaci. To ti pomůže udržet si pokrok a rozvíjet '
    'ho dál.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/5 — what I take away
// ─────────────────────────────────────────────────────────────────────────────

const day7ClosingWorksheetId = 'week7_day7_closing';

const day7ClosingLead =
    'Na závěr si můžeš krátce zaznamenat, co si z programu odnášíš, co tě '
    'nejvíce posunulo a čeho si na sobě nejvíce ceníš. Toto shrnutí ti může '
    'posloužit jako připomenutí tvých pokroků a motivace pokračovat dál.';

const day7ClosingWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: 'Co si odnáším',
    fields: [
      WorksheetField(
        id: 'takeaway',
        label: 'Co si odnáším',
        hint: 'Co si odnášíš, co tě nejvíce posunulo a čeho si na sobě nejvíce ceníš?',
      ),
    ],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 5/5 — the end of the programme
// ─────────────────────────────────────────────────────────────────────────────

/// Verbatim, including "Za těch sedm týdnu" (OQ-2).
const day7FinalPraise =
    'Na závěr Ti patří obrovské ocenění, že do programu jdeš. Za těch sedm týdnu '
    'bylo uděláno spoustu práce, která do budoucna může hodně pomoci v cestě ke '
    'spokojenému životu. Přejeme Ti hodně sil i podobného odhodlání na celé '
    'cestě životem.';

/// `WeekCompletionPage` says "Týden dokončen" by default. After seven weeks
/// that undersells the moment, so the last screen of the programme says so.
// TODO: schválit autorem (WEEK7_SCREEN_PLAN.md → OQ-6)
const day7FinalHeading = 'Program dokončen!';
const day7FinalButton = 'Dokončit program';
