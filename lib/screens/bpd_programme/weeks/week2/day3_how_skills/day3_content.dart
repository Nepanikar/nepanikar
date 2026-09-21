// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/skill_practice_page.dart';

/// The day's opening lesson, delivered as chat (§3, first two bullets).
const week2Day3IntroChat = <String>[
  'Jsou to způsoby, jak vykonávat dříve zmíněné dovednosti.',
  'Jak to teda dle DBT dělat? Jednomyslně, bez hodnocení a efektivně. Ale co je '
      'tím myšleno?',
];

/// One-line summaries of the three skills. Ours, condensed from the source's
/// full definitions, which the user reads in full on each skill's own page.
const week2Day3Previews = <ChatFeatureItem>[
  ChatFeatureItem(
    icon: Icons.center_focus_strong,
    title: 'Jednomyslně',
    description: 'Jedna věc najednou, plně přítomný/á.',
  ),
  ChatFeatureItem(
    icon: Icons.balance_outlined,
    title: 'Bez hodnocení',
    description: 'Neutrálně, bez „dobré / špatné“.',
  ),
  ChatFeatureItem(
    icon: Icons.trending_up,
    title: 'Efektivně',
    description: 'To, co vede k cíli – ne emoce nebo tvrdohlavost.',
  ),
];

/// Week 2, Day 3 — the three "Jak" skills and their exercise menus.
///
/// All copy verbatim from docs/hpo/source/tyzden-2.md §3.
const week2Day3Sections = <SkillSectionData>[
  SkillSectionData(
    sectionKey: 'jednomyslne',
    icon: Icons.center_focus_strong,
    title: 'Jednomyslně',
    subtitle: 'Jak dovednost 1/3',
    educationParagraphs: [
      'Buď plně přítomný a dělej vždy jen jednu věc najednou, soustřeď se na '
          'aktuální moment a úkol, aniž bys byl/a rozptylován/a minulostí nebo '
          'budoucností.',
    ],
    pickLead:
        'Podobně jako včera si v praxi vyzkoušíme všechny „jak“ dovednosti. '
        'Vyber si z následující nabídky tréninku dovednosti vnímat jednomyslně.',
    exercises: [
      PracticeExercise(
        title: 'Příprava čaje nebo kávy',
        description:
            'Soustřeď se na každý krok – jak bereš konvici, liješ vodu, vnímáš '
            'vůni a teplo. Pokud utečou myšlenky, jemně se vrať.',
        icon: Icons.emoji_food_beverage_outlined,
      ),
      PracticeExercise(
        title: 'Mytí nádobí',
        description:
            'Myj nádobí pomalu, jako by každá sklenička byla důležitá. Vnímej '
            'dotyk vody, pěnu, zvuk. Nesnaž se pospíchat.',
        icon: Icons.local_drink_outlined,
      ),
      PracticeExercise(
        title: 'Umývání rukou',
        description:
            'Sleduj každý pohyb – jak se ruce dotýkají vody, jak pění mýdlo. '
            'Drž si pozornost u této činnosti.',
        icon: Icons.wash_outlined,
      ),
      PracticeExercise(
        title: 'Úklid',
        description:
            'Postupuj krok po kroku – když ukládáš knihu, uvědom si, že držíš '
            'právě tu konkrétní knihu a pokládáš ji na určité místo. Pohybuj '
            'se pomaleji než obvykle, a vnímej dech.',
        icon: Icons.cleaning_services_outlined,
      ),
      PracticeExercise(
        title: 'Koupel',
        description:
            'Dopřej si čas – soustřeď se na každý dotek vody na těle, na '
            'teplo, vůni. Vnímej, jak se uvolňuje mysl spolu s tělem.',
        icon: Icons.bathtub_outlined,
      ),
      PracticeExercise(
        title: 'Meditace',
        description:
            'Seď pohodlně, sleduj dech a s každým nádechem i výdechem si v '
            'duchu řekni „jedna“. Pokud se objeví touha pohnout se nebo '
            'přestat, jen si jí všimni a zůstaň přítomný.',
        icon: Icons.self_improvement,
      ),
    ],
  ),
  SkillSectionData(
    sectionKey: 'bez_hodnoceni',
    icon: Icons.balance_outlined,
    title: 'Bez hodnocení',
    subtitle: 'Jak dovednost 2/3',
    educationParagraphs: [
      'Sleduj své myšlenky, pocity a prožitky neutrálně, bez snahy je hodnotit '
          'jako dobré nebo špatné, správné či nesprávné.',
    ],
    pickLead: 'Zkus si vybrat minimálně dvě cvičení odsud a dnes je vyzkoušej.',
    exercises: [
      PracticeExercise(
        title: 'Všimni si hodnotící myšlenky',
        description:
            'Zkus si všimnout, když ti v hlavě naskočí hodnotící myšlenka, a '
            'jen si řekni: „To je hodnotící myšlenka.“',
        icon: Icons.notifications_none,
      ),
      PracticeExercise(
        title: 'Počítej je',
        description: 'Počítej, kolikrát za den tě takové myšlenky napadnou.',
        icon: Icons.tag,
      ),
      PracticeExercise(
        title: 'Popiš jen fakta',
        description:
            'Když hodnotíš, zkus místo toho popsat jen fakta: co se opravdu '
            'stalo, co vidíš, slyšíš nebo cítíš.',
        icon: Icons.fact_check_outlined,
      ),
      PracticeExercise(
        title: 'Emoce bez nálepek',
        description:
            'Popiš, jak se cítíš, ale bez nálepek typu „dobré/špatné“ – jen '
            'čistě emoce.',
        icon: Icons.favorite_border,
      ),
      PracticeExercise(
        title: 'Změň tón a postoj',
        description:
            'Vyzkoušej změnit tón hlasu, výraz tváře nebo postoj těla, když si '
            'uvědomíš, že hodnotíš.',
        icon: Icons.record_voice_over_outlined,
      ),
      PracticeExercise(
        title: 'Vyprávěj den jako fakta',
        description:
            'Vyprávěj někomu svůj den tak, že popíšeš jen konkrétní události a '
            'reakce – žádné soudy ani domněnky.',
        icon: Icons.forum_outlined,
      ),
      PracticeExercise(
        title: 'Napiš popis situace',
        description:
            'Napiš si krátký popis situace, která tě rozrušila, čistě podle '
            'faktů: co se stalo, co jsi cítil/a, co jsi udělal/a.',
        icon: Icons.edit_note,
      ),
    ],
  ),
  SkillSectionData(
    sectionKey: 'efektivne',
    icon: Icons.trending_up,
    title: 'Efektivně',
    subtitle: 'Jak dovednost 3/3',
    educationParagraphs: [
      'Soustřeď se na to, co je potřeba k dosažení cíle v dané situaci, místo '
          'aby tě ovládaly emoce nebo tvrdohlavost.',
    ],
    pickLead: 'Nakonec si vyber minimálně dvě aktivity odsud.',
    exercises: [
      PracticeExercise(
        title: 'Je to opravdu účinné?',
        description:
            'Když cítíš vztek nebo napětí vůči někomu, zeptej se sám sebe: „Je '
            'to, co chci udělat, opravdu účinné?“',
        icon: Icons.help_outline,
      ),
      PracticeExercise(
        title: 'Pusť potřebu mít pravdu',
        description:
            'Všimni si, kdy máš potřebu „mít pravdu“ za každou cenu. Zkus '
            'místo toho dát přednost tomu, co je účelné a pomůže situaci.',
        icon: Icons.handshake_outlined,
      ),
      PracticeExercise(
        title: 'Pomáhá mi to teď?',
        description:
            'Sleduj, kdy se v tobě objevuje zatvrzelost nebo neochota něco '
            'udělat. Polož si otázku: „Pomáhá mi to teď?“',
        icon: Icons.psychology_outlined,
      ),
      PracticeExercise(
        title: 'Zkus, co funguje',
        description:
            'Zkus pustit svéhlavost a vyzkoušet přístup, který je funkční. '
            'Všímej si rozdílu, který to přinese.',
        icon: Icons.alt_route,
      ),
    ],
  ),
];

/// Judgmental → non-judgmental rephrasings shown on the "Bez hodnocení" page
/// (verbatim, source: §3).
const week2NonJudgmentalExamples = <({String judging, String describing})>[
  (
    judging: 'Jsem úplný neschopný idiot, zase jsem to zkazil.',
    describing: 'Udělal jsem v tom úkolu tři chyby, protože jsem byl unavený.',
  ),
  (
    judging: 'Je hrozné a trapné, že se takhle bojím mluvit před lidmi.',
    describing:
        'Cítím, jak se mi klepou ruce a srdce mi buší rychleji, když mám '
        'začít mluvit.',
  ),
  (
    judging: 'Můj spolužák je sebecký arogantní kretén.',
    describing: 'Spolužák mi dnes ráno neodpověděl na pozdrav.',
  ),
];
