// ignore_for_file: no_adjacent_strings_in_list

/// Week 5, Day 1 — edukace o impulzivitě.
///
/// Copy verbatim from `docs/hpo/source/tyzden-5.md` §1. The source's typos and
/// spacing are left exactly as written (see WEEK5_SCREEN_PLAN.md → OQ-4) — the
/// author corrects her own text, we never do it silently. Notably: the double
/// spaces in "Jeden z  DBT nástrojů", the unpaired quote in "průběh událostí“",
/// "apod" without a period, and "zaátek" in the closing line.
library;

import 'package:nepanikar/screens/bpd_programme/widgets/missing_links_analysis.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1/5 — what impulsivity is
// ─────────────────────────────────────────────────────────────────────────────

/// Bullet 1, split into two bubbles. One bubble of four sentences is a wall of
/// text on the first screen of the week; the split changes nothing in the copy.
const day1Opening = <String>[
  'V tomto týdnu se budeme věnovat impulzivnímu chování – jednání, ke kterému '
      'dochází rychle, bez dlouhého přemýšlení o důsledcích. Impulzivní reakce '
      'může být někdy užitečná, například při rychlém rozhodnutí v krizové '
      'situaci, ale často může vést k problémům ve vztazích nebo se sebou samým.',
  'Ne všechno chování je tedy nežádoucí. V tomto týdnu se budeme zaměřovat jen '
      'na to chování, které negativně ovlivňuje život a kterého později třeba '
      'litujeme.',
];

/// Bullets 2–4.
const day1Causes = <String>[
  'Každý člověk je impulzivní do různé míry - někdy míň, někdo víc. Částečně to '
      'ovlivňuje biologie, například genetické predispozice, rozdíly v mozkové '
      'aktivitě a funkci neurotransmiterů, které regulují kontrolu impulzů a emoce.',
  'Dále hraje roli životní zkušenost, stres, únava a návyky. Porozumění tomu, '
      'proč jsme někdy impulzivní, je prvním krokem k tomu, abychom se naučili '
      'své impulzy rozpoznat a vědomě zvládat.',
  'Impulzivní chování je často reakce na silné emoce. Čím intenzivnější emoce, '
      'tím těžší je ji kontrolovat.',
];

/// Bullet 5 — the only bullet that names two things at once, so it becomes a
/// two-item feature list rather than another bubble.
const day1BrainLead =
    'Mozek má dvě hlavní části, které se podílejí na impulzivitě: prefrontální '
    'kortex (řídí plánování a sebeovládání) a amygdala (rychle vyhodnocuje '
    'hrozby a spouští emocionální reakce). U některých lidí je aktivita těchto '
    'oblastí odlišná, což ovlivňuje, jak snadno podléhají impulsům.';

const day1PrefrontalCortex = 'prefrontální kortex';
const day1PrefrontalCortexBody = 'řídí plánování a sebeovládání';
const day1Amygdala = 'amygdala';
const day1AmygdalaBody = 'rychle vyhodnocuje hrozby a spouští emocionální reakce';

/// Bullet 6 — the destigmatising line of the day, so it gets its own card.
const day1NotWeaknessTitle = 'Není to slabá vůle';
const day1NotWeakness =
    'Impulzivita není znak slabé vůle – je to kombinace biologických, '
    'psychologických a environmentálních faktorů.';

/// Bullet 7.
const day1UnderstandingTriggers =
    'Porozumění svým spouštěčům a tělesným projevům impulzivních reakcí je '
    'klíčové k tomu, aby člověk mohl své jednání vědomě zastavit nebo změnit.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 2/5 — behaviour analysis
// ─────────────────────────────────────────────────────────────────────────────

/// Bullets 8–9.
const day1AnalysisIntro = <String>[
  'Jeden z  DBT nástrojů pro porozumění impulzivního a neefektivního chování '
      'je  analýza chování.',
  'Princip je jednoduchý: sledujeme průběh událostí“, které vedly k určité '
      'reakci nebo chování. Pomáhá identifikovat:',
];

/// The six steps of the analysis. They map one-to-one onto the first six fields
/// of [day1ChainWorksheet], which is the point of showing them here first.
const day1AnalysisSteps = <String>[
  'Spouštěče – co spustilo emoci nebo impulz (situace, lidé, myšlenky)',
  'Počáteční myšlenky a pocity – jaké myšlenky a emoce se objevily hned na začátku',
  'Fyzické a psychické signály – tělesné projevy, napětí, vztek, úzkost apod',
  'Impulzy – nutkání jednat určitým způsobem',
  'Chování – samotná impulzivní reakce nebo život ohrožující chování',
  'Důsledky – pozitivní a negativní následky chování.',
];

/// Bullet 10 and the challenge.
const day1AnalysisGoal =
    'Cílem je pochopit, co vede k problémovému jednání, najít body, kde lze '
    'zasáhnout a změnit reakci, a připravit alternativní strategie pro zvládnutí '
    'situace v budoucnu.';

const day1Challenge =
    'A teď výzva: vzpomeňte si na poslední situaci, kdy jste jednali impulzivně '
    'nebo se cítili, že se vaše emoce vymykají kontrole. Vaším úkolem je '
    'prozkoumat, co vedlo k této reakci, a zkusit udělat řetězovou analýzu. '
    'Pomůže vám to pochopit spouštěče, impulzy a body, kde můžete příště '
    'zasáhnout a zareagovat jinak.';

// ─────────────────────────────────────────────────────────────────────────────
// Page 3/5 — the chain-analysis worksheet
// ─────────────────────────────────────────────────────────────────────────────

const day1WorksheetId = 'week5_day1_chain';

/// The source's own permission to take it slowly. It sits *after* the seven
/// fields in the source; here it opens the page, because someone who finds this
/// hard will never scroll past field seven to be told they may go slowly
/// (WEEK5_SCREEN_PLAN.md → OQ-3).
const day1WorksheetPermission =
    'Tento worksheet můžete vyplnit pomalu, krok za krokem, a využít ho jako '
    'nástroj k uvědomění a prevenci dalších impulzivních reakcí.';

const day1WorksheetClosing =
    'Tento postup si můžete vyzkoušet i v budoucnu kdykoli, kdy pocítíte '
    'impulzivní nutkání. Řetězovou analýzu můžete použít jako nástroj, který vám '
    'pomůže rychle rozpoznat spouštěče, tělesné signály a impulzy, a naplánovat '
    'bezpečnější, uvědomělé reakce. Postupem času se díky pravidelnému používání '
    'stane přirozenou součástí vašeho zvládání emocí.';

/// Seven steps, verbatim: heading and question exactly as the source writes them.
const day1ChainWorksheet = <WorksheetSection>[
  WorksheetSection(
    title: 'Popiš situaci/spouštěč',
    fields: [
      WorksheetField(
        id: 'trigger',
        label: 'Popiš situaci/spouštěč',
        hint: 'Co se stalo těsně před tím, než ses cítil/a impulzivně?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Myšlenky a pocity',
    fields: [
      WorksheetField(
        id: 'thoughts',
        label: 'Myšlenky a pocity',
        hint: 'Jaké myšlenky a emoce se objevily na začátku?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Tělesné signály',
    fields: [
      WorksheetField(
        id: 'body',
        label: 'Tělesné signály',
        hint: 'Co jsi cítil/a ve svém těle (např. napětí, bušení srdce, neklid)?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Impulzy',
    fields: [
      WorksheetField(
        id: 'urges',
        label: 'Impulzy',
        hint: 'Jaké nutkání k jednání jsi cítil/a?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Chování',
    fields: [
      WorksheetField(id: 'behaviour', label: 'Chování', hint: 'Co jsi nakonec udělal/a?'),
    ],
  ),
  WorksheetSection(
    title: 'Důsledky',
    fields: [
      WorksheetField(
        id: 'consequences',
        label: 'Důsledky',
        hint: 'Jaký byl krátkodobý a dlouhodobý dopad tvého jednání?',
      ),
    ],
  ),
  WorksheetSection(
    title: 'Alternativní strategie',
    fields: [
      WorksheetField(
        id: 'alternatives',
        label: 'Alternativní strategie',
        hint: 'Co bys mohl/a příště udělat jinak, aby ses vyhnul/a impulzivní reakci?',
      ),
    ],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 4/5 — missing-links analysis
// ─────────────────────────────────────────────────────────────────────────────

const day1MissingLinksId = 'week5_day1_missing_links';

const day1MissingLinksIntro =
    'Pomocí těchto otázek můžeš zjistit, proč se ti nepodařilo použít dovednost '
    'nebo chovat se tak, jak jsi potřeboval/a.';

/// The chain, verbatim. Each question is asked only when the one before it was
/// answered "ano"; "ne" opens the two follow-ups and ends the chain.
///
/// The last step has no yes/no in the source — it is an open question with a
/// list of possible obstacles — so it renders its fields straight away
/// (WEEK5_SCREEN_PLAN.md → OQ-7).
const day1MissingLinks = <MissingLinkStep>[
  MissingLinkStep(
    id: 'q1_knew',
    question: 'Věděl/a jsi, jaké chování nebo dovednost bylo potřeba použít?',
    fields: [
      WorksheetField(
        id: 'q1_blocked',
        label: 'Co ti bránilo to vědět?',
        example: 'např. nedostatek pozornosti, nejasné instrukce, informace jsi '
            'vůbec nedostal/a, byl/a jsi příliš zahlcený/á a nedokázal/a jsi to '
            'zpracovat',
      ),
      WorksheetField(
        id: 'q1_next',
        label: 'Jak to můžeš příště vyřešit?',
        example: 'např. víc se soustředit, ptát se na upřesnění, hledat si '
            'informace, poprosit o pomoc',
      ),
    ],
  ),
  MissingLinkStep(
    id: 'q2_willing',
    question: 'Byl/a jsi ochotný/á chovat se efektivně?',
    fields: [
      WorksheetField(
        id: 'q2_blocked',
        label: 'Co ti bránilo v ochotě?',
        example: 'např. vzdorovitost, pocit, že to nezvládneš, bezmoc',
      ),
      WorksheetField(
        id: 'q2_next',
        label: 'Jak to můžeš příště vyřešit?',
        example: 'např. radikální přijetí, pro a proti, opposite action',
      ),
    ],
  ),
  MissingLinkStep(
    id: 'q3_occurred',
    question: 'Napadlo tě vůbec použít dovednost nebo chování, které bylo potřeba?',
    fields: [
      WorksheetField(
        id: 'q3_remind',
        label: 'Jak si to můžeš příště víc připomenout?',
        example: 'např. poznámka do kalendáře, nastavit si budík, mít zápisník '
            's dovednostmi po ruce, coping ahead = předem si představit, jak '
            'situaci zvládneš',
      ),
    ],
  ),
  MissingLinkStep(
    id: 'q4_immediately',
    question: 'Co ti zabránilo to udělat hned?',
    asksYesNo: false,
    fields: [
      WorksheetField(
        id: 'q4_obstacle',
        label: 'Co ti zabránilo to udělat hned?',
        example: 'Možné překážky: odkládání, nechuť, zapomněl/a jsi jak na to, '
            'pocit, že na tom nezáleží.',
      ),
      WorksheetField(
        id: 'q4_next',
        label: 'Jak to můžeš příště vyřešit?',
        example: 'např. odměnit se za splnění, opposite action, pro a proti',
      ),
    ],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page 5/5 — completion
// ─────────────────────────────────────────────────────────────────────────────

/// Verbatim, including the source's typo "zaátek" (OQ-4).
const day1CompletionText =
    'Tak a to je pro zaátek pátého týdne vše. Potkáme se zítra.';
