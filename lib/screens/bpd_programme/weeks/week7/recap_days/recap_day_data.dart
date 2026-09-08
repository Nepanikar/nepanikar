// ignore_for_file: no_adjacent_strings_in_list

/// Week 7, Days 2–6 — the four module recaps plus the mindfulness day.
///
/// Copy verbatim from `docs/hpo/source/tyzden-7.md` §2–§6.
///
/// Every one of these days has the same shape — one long recap paragraph, a
/// menu of that module's skills, a closing line — so they are one data-driven
/// screen rather than five near-identical ones (the pattern Week 1's SPOKO days
/// established).
///
/// **The menus list only skills the programme actually taught.** The author's
/// recap paragraphs also name "PODPORA", "coping ahead" and "radikální přijetí",
/// none of which appear anywhere in weeks 1–6 — offering them here would send
/// the user somewhere empty. Tracked as W7-01 → OQ-1.
///
/// Every detail text is assembled from the constants the original day already
/// ships, so the wording a user re-reads here is byte-identical to the wording
/// they learned. Only `shortDescription` is ours.
library;

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day3_check_facts/day3_content.dart'
    as w3_facts;
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day4_opposite_action/day4_content.dart'
    as w3_opposite;
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_content.dart'
    as w4_crisis;
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_mindfulness_stress_screen.dart'
    show week4DrawPool;
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/day5_content.dart'
    as w4_uznavam;
import 'package:nepanikar/screens/bpd_programme/weeks/week5/day1_impulsivity/day1_content.dart'
    as w5_chain;
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day2_communication/day2_content.dart'
    as w6_psanicko;
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day3_je_vyzva/day3_content.dart'
    as w6_jevyzva;
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day5_self_esteem/day5_content.dart'
    as w6_nezoufej;
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';

/// One of Week 7's five "look back and pick something" days.
class Week7RecapDay {
  const Week7RecapDay({
    required this.dayNumber,
    required this.title,
    required this.recapParagraphs,
    required this.pickLead,
    required this.techniques,
    required this.sourceLabel,
    required this.completionText,
    required this.nextDay,
  });

  final int dayNumber;
  final String title;

  /// The author's recap, split into bubbles. Never reworded.
  final List<String> recapParagraphs;

  /// Her closing instruction, carried above the menu.
  final String pickLead;

  final List<TechniqueData> techniques;
  final String sourceLabel;
  final String completionText;
  final NextDayTeaser? nextDay;

  String get dayLabel => 'Den $dayNumber • Týden 7';
}

/// Renders an acronym the way its own day rendered it, from that day's letters.
List<String> _acronym(List<String> lead, List<AcronymLetter> letters) => [
  ...lead,
  for (final letter in letters) '${letter.$1} – ${letter.$2}: ${letter.$3}',
];

/// Renders a step list the way its own day rendered it.
List<String> _steps(List<String> lead, List<String> steps) => [
  ...lead,
  for (final step in steps) '• $step',
];

// ─────────────────────────────────────────────────────────────────────────────
// Skill pools, one per module
// ─────────────────────────────────────────────────────────────────────────────

/// Week 3 — emoční regulace.
final _week3Skills = <TechniqueData>[
  TechniqueData(
    id: 'week3_check_facts',
    iconKey: 'facts',
    icon: Icons.fact_check_outlined,
    title: 'Ověřování faktů',
    // TODO: schválit autorem — one-line menu summaries are ours (OQ-4).
    shortDescription: 'Ověříš, jestli emoce odpovídá tomu, co se opravdu stalo',
    detailParagraphs: [w3_facts.day3ChainBody, ...w3_facts.day3IntroChat],
  ),
  TechniqueData(
    id: 'week3_opposite_action',
    iconKey: 'swap',
    icon: Icons.swap_horiz,
    title: 'Opačná akce',
    shortDescription: 'Uděláš opak toho, co emoce velí, když ti nepomáhá',
    detailParagraphs: [...w3_opposite.day4IntroChat, w3_opposite.day4GoalNote],
  ),
];

/// Week 4 — snášení tísně.
final _week4Skills = <TechniqueData>[
  TechniqueData(
    id: 'week4_stop',
    iconKey: 'pause',
    icon: Icons.back_hand_outlined,
    title: 'STOP',
    shortDescription: 'Chvíle mezi impulsem a reakcí',
    detailParagraphs: _acronym(w4_crisis.day2StopLead, w4_crisis.day2StopLetters),
  ),
  TechniqueData(
    id: 'week4_tips',
    iconKey: 'air',
    icon: Icons.ac_unit,
    title: 'TIPS',
    shortDescription: 'Rychlé tělesné strategie, když je emoce na maximu',
    detailParagraphs: _acronym([w4_crisis.day2TipsLead], w4_crisis.day2TipsLetters),
  ),
  TechniqueData(
    id: 'week4_uznavam',
    iconKey: 'senses',
    icon: Icons.auto_awesome_outlined,
    title: 'UZNÁVÁM',
    shortDescription: 'Sedm drobných triků, než bouře odezní',
    detailParagraphs: _acronym(w4_uznavam.day5IntroChat, w4_uznavam.day5Letters),
  ),
];

/// Week 5 — impulzivita. STOP appears here too because the author's Week 5
/// taught it a second time and her Week 7 recap names it in both modules; the
/// id is shared, so the rescue package still holds one copy.
final _week5Skills = <TechniqueData>[
  TechniqueData(
    id: 'week4_stop',
    iconKey: 'pause',
    icon: Icons.back_hand_outlined,
    title: 'STOP',
    shortDescription: 'Zastavit se dřív, než zareaguje impulz',
    detailParagraphs: _acronym(w4_crisis.day2StopLead, w4_crisis.day2StopLetters),
  ),
  TechniqueData(
    id: 'week5_chain_analysis',
    iconKey: 'chain',
    icon: Icons.timeline_outlined,
    title: 'Řetězová analýza',
    shortDescription: 'Od spouštěče přes impulz až k důsledkům, krok za krokem',
    detailParagraphs: _steps(w5_chain.day1AnalysisIntro, w5_chain.day1AnalysisSteps),
  ),
];

/// Week 6 — mezilidské vztahy a sebeúcta.
final _week6Skills = <TechniqueData>[
  TechniqueData(
    id: 'week6_psanicko',
    iconKey: 'talk',
    icon: Icons.forum_outlined,
    title: 'PSANÍČKo',
    shortDescription: 'Jak požádat nebo odmítnout tak, aby tě druhý slyšel',
    detailParagraphs: _acronym(const [], w6_psanicko.day2PsanickoLetters),
  ),
  TechniqueData(
    id: 'week6_je_vyzva',
    iconKey: 'heart',
    icon: Icons.volunteer_activism_outlined,
    title: 'Je VýZVa',
    shortDescription: 'Laskavost, zájem a validace i ve chvíli rozrušení',
    detailParagraphs: _acronym(w6_jevyzva.day3JeVyzvaIntro, w6_jevyzva.day3JeVyzvaLetters),
  ),
  TechniqueData(
    id: 'week6_nezoufej',
    iconKey: 'shield',
    icon: Icons.shield_moon_outlined,
    title: 'neZOUFej',
    shortDescription: 'Chránit hranice bez omluv — a zůstat férový/á',
    detailParagraphs: _acronym([w6_nezoufej.day5SkillIntro], w6_nezoufej.day5NezoufejLetters),
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// The five days
// ─────────────────────────────────────────────────────────────────────────────

/// Day 2 — všímavost. Same eight named techniques as Weeks 4–6 draw from.
final week7Day2 = Week7RecapDay(
  dayNumber: 2,
  title: 'Všímavost',
  recapParagraphs: const [
    'Teď přejdeme ke všímavosti. Tento den můžeš využít k tomu, aby ses '
        'zamyslel/a nad tím, co ti během programu fungovalo, co bys chtěl/a '
        'osvěžit a vyzkoušet znovu.',
    'Vyber si z nabídky všímavých cvičení to, které ti právě teď nejvíc '
        'vyhovuje, a věnuj mu chvíli pozornosti. Může to být krátká meditace, '
        'vědomý dech, body scan nebo jiné cvičení, které jsi během programu '
        'poznal/a a chceš si ho zopakovat. Důležité je, že máš možnost si '
        'vybrat a zkusit to tak, jak ti to nejvíc pomáhá.',
  ],
  pickLead: 'Vyber si z nabídky všímavých cvičení to, které ti právě teď '
      'nejvíc vyhovuje, a věnuj mu chvíli pozornosti.',
  techniques: week4DrawPool,
  sourceLabel: 'Týden 2 • připomenuto v 7. týdnu',
  completionText: 'To je pro dnešek vše, těšíme se na zítra.',
  nextDay: const NextDayTeaser(
    title: 'Emoční regulace',
    description: 'Co ti z práce s emocemi fungovalo nejlíp — a co si chceš zopakovat.',
  ),
);

/// Day 3 — emoční regulace.
final week7Day3 = Week7RecapDay(
  dayNumber: 3,
  title: 'Emoční regulace',
  recapParagraphs: const [
    'Teď se zaměříme na emoční regulaci a připomeneme si, co jsme se během '
        'programu naučili. Můžeš se zastavit a zamyslet se, které techniky ti '
        'fungovaly nejlépe, a které bys chtěl/a osvěžit nebo vyzkoušet znovu.',
    'Během programu jsme se učili, co jsou emoce a k čemu slouží, jak je '
        'pojmenovávat a přesně rozpoznávat. Naučili jsme se měnit naši reakci '
        'na emoce, například pomocí dovednosti opposite action, která pomáhá '
        'jednat opačně než emoce velí, pokud emoce není užitečná nebo '
        'odpovídající realitě, a také techniky check the facts, kdy ověřujeme, '
        'zda je naše emoce přiměřená situaci.',
    'Pro zvládání silných emocí jsme používali mindfulness, praktické nástroje '
        'pro okamžité uklidnění a manuály krok za krokem. Dále jsme se učili '
        'zmírňovat citlivost na stresory a připravovat se na náročné situace '
        'dopředu pomocí plánů coping ahead.',
  ],
  pickLead: 'Teď si vyber, co z těchto nástrojů chceš procvičit, zopakovat a '
      'posílit, podle toho, co ti právě teď nejvíc pomáhá.',
  techniques: _week3Skills,
  sourceLabel: 'Týden 3 • připomenuto v 7. týdnu',
  // Verbatim, including the missing word in "dovednosti z můžou" (OQ-2).
  completionText:
      'Díky, že stále pokračuješ! Věříme, že Ti dovednosti z můžou přinést úlevu.',
  nextDay: const NextDayTeaser(
    title: 'Snášení tísně',
    description: 'STOP, TIPS a UZNÁVÁM — co z toho si chceš připomenout.',
  ),
);

/// Day 4 — snášení tísně.
final week7Day4 = Week7RecapDay(
  dayNumber: 4,
  title: 'Snášení tísně',
  recapParagraphs: const [
    'Teď se zaměříme na zvládání stresu a připomeneme si, co jsme se během '
        'programu naučili. Můžeš se zastavit a zamyslet se, které techniky ti '
        'fungovaly nejlépe a které bys chtěl/a osvěžit nebo znovu vyzkoušet.',
    'Učili jsme se, co je stres, jak ovlivňuje tělo a mysl, a proč je normální '
        'reagovat různě na krátkodobé i dlouhodobé stresory.',
    'Připomněli jsme si TIPS techniku – rychlé fyziologické strategie ke '
        'snížení intenzivní emoční aktivace, UZNÁVÁM pro krátkodobé zvládnutí '
        'nepříjemných emocí, PODPORA pro situace, kdy nelze okamžitě změnit '
        'okolnosti, STOP techniku pro vědomé zastavení reakce a uzemňovací '
        'cvičení pomocí pěti smyslů a body scan. Dále jsme si připomněli '
        'radikální přijetí a využití všímavosti k uklidnění mysli.',
  ],
  pickLead: 'Teď si vyber, co z těchto nástrojů chceš procvičit nebo zopakovat '
      'podle toho, co ti právě teď nejvíc pomáhá.',
  techniques: _week4Skills,
  sourceLabel: 'Týden 4 • připomenuto v 7. týdnu',
  completionText: 'Skvělá práce, jen tak dál.',
  nextDay: const NextDayTeaser(
    title: 'Impulzivita',
    description: 'Řetězová analýza a STOP — co ti pomohlo zastavit impulz.',
  ),
);

/// Day 5 — impulzivita.
final week7Day5 = Week7RecapDay(
  dayNumber: 5,
  title: 'Impulzivita',
  recapParagraphs: const [
    'Dnes se zaměříme na impulzivní chování a připomeneme si, co jsme se '
        'naučili během programu. Můžeš se zastavit a zamyslet se, které '
        'strategie ti fungovaly nejlépe a které bys chtěl/a osvěžit nebo '
        'vyzkoušet znovu.',
    'Učili jsme se o biologických příčinách impulzivity, o tom, proč jsou '
        'někteří lidé impulzivnější než druzí, a jak se impulzivita projevuje '
        'v každodenním životě. Připomněli jsme si bezpečné alternativy k životu '
        'ohrožujícímu chování, krizové plány a prevenci.',
    'Naučili jsme se využívat mindfulness techniky a STOP techniku k vědomému '
        'zastavení impulzivní reakce.',
  ],
  pickLead: 'Teď si vyber, co z těchto nástrojů chceš procvičit nebo zopakovat '
      'podle toho, co ti právě teď nejvíc pomáhá.',
  techniques: _week5Skills,
  sourceLabel: 'Týden 5 • připomenuto v 7. týdnu',
  completionText: 'Dnes je to vše. Zítra naviděnou :)',
  nextDay: const NextDayTeaser(
    title: 'Mezilidské vztahy a sebeúcta',
    description: 'PSANÍČKo, Je VýZVa a neZOUFej — poslední ohlédnutí.',
  ),
);

/// Day 6 — mezilidské vztahy a sebeúcta.
final week7Day6 = Week7RecapDay(
  dayNumber: 6,
  title: 'Mezilidské vztahy a sebeúcta',
  recapParagraphs: const [
    'Teď se zaměříme na mezilidské vztahy a sebepojetí. Můžeš se zastavit a '
        'zamyslet se, co ti fungovalo nejlépe a co bys chtěl/a osvěžit nebo '
        'vyzkoušet znovu.',
    'Učili jsme se, proč jsou vztahy důležité, jaké jsou mýty a fakta, a jak je '
        'možné jasně a respektující komunikovat své potřeby. Připomněli jsme si '
        'pSANÍČKoa nenásilnou komunikaci, dovednost JeVýZVa pro udržování '
        'vztahů, neZOUFej pro ochranu sebeúcty a techniku check the facts pro '
        'ověřování negativních myšlenek o sobě.',
    'Dále jsme si připomněli řetězovou analýzu a sledování vzorců chování.',
  ],
  pickLead: 'Teď si vyber, co z těchto nástrojů chceš procvičit nebo zopakovat '
      'podle toho, co ti právě teď nejvíc pomáhá.',
  techniques: _week6Skills,
  sourceLabel: 'Týden 6 • připomenuto v 7. týdnu',
  completionText: 'Předposlední den máš za sebou, díky za Tvoji píli!',
  nextDay: const NextDayTeaser(
    title: 'Shrnutí a ohlédnutí',
    description: 'Poslední den programu. Vybereš si tři dovednosti do života.',
  ),
);
