// ignore_for_file: no_adjacent_strings_in_list

/// Week 5, Day 2 — život ohrožující chování.
///
/// Copy verbatim from `docs/hpo/source/tyzden-5.md` §2, typos included
/// ("alepsoň", "co by Ti mohli" — see WEEK5_SCREEN_PLAN.md → OQ-4).
///
/// This is the most sensitive day of the programme. The source handles that
/// itself — it warns first, makes the day optional and offers help twice — so
/// nothing here softens, reorders or adds to what she wrote; the day only wires
/// her three "proklik" notes to the app's existing crisis surfaces.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/5 — warning and voluntariness
// ─────────────────────────────────────────────────────────────────────────────

/// One paragraph in the source, delivered as four bubbles. The last sentence
/// ends in "(proklik do Nepanikař kontaktů)", which is a note to us, not copy —
/// it becomes the contact card below the message.
const day2Warning = <String>[
  'Dnešní téma může být pro někoho citlivé, na což bychom chtěli dopředu '
      'upozornit. Budeme se bavit o život ohrožujícím chování.',
  'Pro někoho to vůbec nemusí být téma, proto je dnešní sekce dobrovolná. Pro '
      'jiné to může být naopak téma nepříjemné.',
  'Máme pro to pochopení a přijde nám důležité říct, že na to nejsi sám.',
  'Pokud by ses necítil dobře a chtěl by ses se svými pocity někomu svěřit, '
      'můžeš nahlédnout do kontaktů, které jsou pro takové chvíle k dispozici.',
];

/// Ours. The source says the day is optional but never says what skipping does.
// TODO: schválit autorem (WEEK5_SCREEN_PLAN.md → OQ-1)
const day2SkipLabel = 'Přeskočit dnešek';
const day2SkipConfirmation = 'Dnešek jsme přeskočili. Zítra pokračujeme.';
const day2CrisisLinkLabel = 'Kontakty pro těžké chvíle';

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/5 — what it is
// ─────────────────────────────────────────────────────────────────────────────

const day2WhatItIs =
    'Život ohrožující chování patří mezi impulzivní reakce na silné emoce. '
    'Často se objevuje jako způsob, jak rychle ulevit intenzivnímu napětí, '
    'smutku, hněvu nebo úzkosti. I když může krátkodobě přinést pocit úlevy, '
    'dlouhodobě neřeší problémy a může vést k dalším komplikacím.';

const day2NotWeaknessTitle = 'Není to slabá vůle';
const day2NotWeakness =
    'Je důležité pochopit, že život ohrožující chování není známka slabé vůle '
    'nebo „špatného charakteru“ – jde o reakci mozku a emocí, která se u '
    'některých lidí rozvíjí častěji, zejména u těch, kdo mají intenzivní nebo '
    'těžko zvládnutelné emoce. Cílem programu je nabídnout bezpečné a efektivní '
    'alternativy, jak s těmito impulzy zacházet a zvládat je bez ubližování '
    'sobě samému.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/5 — STOP
// ─────────────────────────────────────────────────────────────────────────────

const day2StopLead = <String>[
  'STOP je krátká technika, která ti pomůže nezareagovat impulzivně',
  'STOP ti pomůže získat chvíli mezi impulsem a reakcí – a v té chvíli máš '
      'šanci vybrat si jinou cestu.',
];

/// Verbatim from **this** week's source, which words the letters in English
/// with a Czech gloss — Week 4 Day 2 words the same technique entirely in Czech
/// ("T – Tah zpátky"). That disagreement is the author's to resolve; we ship
/// her week-5 text rather than silently substituting her week-4 text.
// TODO: schválit autorem — sjednotit se zněním z týdne 4
// (WEEK5_SCREEN_PLAN.md → OQ-2)
const day2StopLetters = <AcronymLetter>[
  ('S', 'Stop (zastav se)', 'nic nedělej, nic neříkej.'),
  ('T', 'Take a step back (ustup)', 'doslova se nadechni a udělej krok zpět, dej si čas.'),
  ('O', 'Observe (pozoruj)', 'co se právě děje? jaké máš pocity, myšlenky, co říká okolí?'),
  (
    'P',
    'Proceed mindfully (pokračuj vědomě)',
    'rozhodni se, co ti v té situaci nejvíc pomůže – ne co chce emoce, ale co '
        'dává smysl.',
  ),
];

/// Same rescue-package id as Week 4 on purpose: STOP is one technique, and a
/// second entry would mean the user finds it twice in the balíček. The id keeps
/// its week-4 name because renaming it would orphan what people already saved.
const day2StopRescueId = 'week4_stop';

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/5 — five things that help
// ─────────────────────────────────────────────────────────────────────────────

const day2ReliefListId = 'week5_day2_relief_list';

const day2ReliefLead =
    'Pokud se nám povede použít techniku STOP, je dobré vědět, co chci udělat '
    'místo toho, abychom si ublížili. Zkus si teď napsat seznam 5 činností, co '
    'by Ti mohli alepsoň trochu ulevit';

/// The ten examples the source hides behind a tap, verbatim and in her order.
const day2ReliefExamples = <String>[
  'Zavolat někomu blízkému.',
  'Jít se projít.',
  'Dát si sprchu.',
  'Vytřepat se.',
  'Pustit si oblíbenou hudbu.',
  'Napsat si, co právě cítím.',
  'Dýchat pomalu a zhluboka.',
  'Nakreslit nebo něco tvořit.',
  'Podívat se na něco uklidňujícího.',
  'Dát si čaj nebo něco dobrého.',
];

/// Five fields, nothing required. Labels are ours — the source only says
/// "seznam 5 činností".
const day2ReliefFields = <WorksheetField>[
  WorksheetField(id: 'relief_1', label: '1.', hint: 'Co mi může ulevit…'),
  WorksheetField(id: 'relief_2', label: '2.', hint: 'Co mi může ulevit…'),
  WorksheetField(id: 'relief_3', label: '3.', hint: 'Co mi může ulevit…'),
  WorksheetField(id: 'relief_4', label: '4.', hint: 'Co mi může ulevit…'),
  WorksheetField(id: 'relief_5', label: '5.', hint: 'Co mi může ulevit…'),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 5/5 — completion and care
// ─────────────────────────────────────────────────────────────────────────────

/// "můžeš jej opečovat zde (odkaz na nepanikař mód Chci si ublížit a znovu na
/// kontakty)" — the parenthesis is a note to us; the two links follow the line.
const day2CareLead =
    'Pokud je pro tebe život ohrožující chování náročným tématem, můžeš jej '
    'opečovat zde';

const day2CompletionText =
    'Dnes to mohlo být náročné. Díky že se pouštíš i do takových témat, chce to '
    'velkou odvahu.';
