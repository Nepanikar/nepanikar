// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/skill_practice_page.dart';

/// The day's opening lesson, delivered as chat (§2, first bullet).
const week2Day2IntroLead =
    'Jedná se o dovednosti, které popisují, co vlastně dělám, když praktikuji '
    'všímavost. Jedná se o tyto tři body:';

/// One-line summaries of the three skills. Ours, condensed from the source's
/// full definitions, which the user reads in full on each skill's own page.
const week2Day2Previews = <ChatFeatureItem>[
  ChatFeatureItem(
    icon: Icons.visibility,
    title: 'Pozorování',
    description: 'Jen si všímám toho, co se děje – jako fotograf.',
  ),
  ChatFeatureItem(
    icon: Icons.chat_bubble_outline,
    title: 'Popisování',
    description: 'Tomu, co si všimnu, dám slova.',
  ),
  ChatFeatureItem(
    icon: Icons.volunteer_activism_outlined,
    title: 'Participace',
    description: 'Do toho, co dělám, se ponořím naplno.',
  ),
];

/// §2, closing bullet of the education part.
const week2Day2IntroClosing =
    'CO dovednosti jsou tedy tři: pozorování, popisování a participace. Pojďme '
    'si to teď prakticky vyzkoušet.';

/// Week 2, Day 2 — the three "Co" skills and their exercise menus.
///
/// All copy verbatim from docs/hpo/source/tyzden-2.md §2.
const week2Day2Sections = <SkillSectionData>[
  SkillSectionData(
    sectionKey: 'pozorovani',
    icon: Icons.visibility,
    title: 'Pozorování',
    subtitle: 'Co dovednost 1/3',
    educationParagraphs: [
      'Jen si všímám toho, co se děje. To může být dech, tělesný pocit, '
          'myšlenka nebo něco kolem mě. Nehodnotím to, jen to zaznamenám, jako '
          'bych byl třeba fotograf.',
    ],
    pickLead:
        'Vyber si alespoň dvě krátká cvičení z nabídky pro trénink pozorování. '
        'Nemusí to být dnes. Úplně stačí kdykoliv během dnešního dne.',
    exercises: [
      PracticeExercise(
        title: 'Očima',
        description:
            'Zastav se a věnuj pozornost tomu, co vidíš. Můžeš se dívat na '
            'oblohu, stromy nebo na nějaký drobný detail (list, květ, kámen) a '
            'vnímat ho opravdu pozorně.',
        icon: Icons.remove_red_eye_outlined,
      ),
      PracticeExercise(
        title: 'Ušima',
        description:
            'Jen naslouchej. Soustřeď se na zvuky kolem sebe – jejich rytmus, '
            'výšku nebo pauzy mezi nimi. Můžeš to zkusit i u hudby.',
        icon: Icons.hearing,
      ),
      PracticeExercise(
        title: 'Čichem',
        description:
            'Vnímej vůně ve svém okolí – jídlo, nápoje, květiny nebo jen '
            'vzduch venku.',
        icon: Icons.local_florist_outlined,
      ),
      PracticeExercise(
        title: 'Chuť',
        description:
            'Jez vědomě. Zkus si dát sousto a všímat si každé chuti a změny, '
            'jak se vyvíjí v ústech.',
        icon: Icons.restaurant,
      ),
      PracticeExercise(
        title: 'Tělem',
        description:
            'Když máš nutkání něco udělat, zastav se a všimni si, jak se to '
            'nutkání projevuje v těle. Zkus to jen pozorovat, aniž bys hned '
            'jednal/a.',
        icon: Icons.accessibility_new,
      ),
      PracticeExercise(
        title: 'Dotek',
        description:
            'Vnímej, jaké to je, když se chodidla dotýkají země při chůzi, když '
            'sedíš na židli nebo když se tě oblečení dotýká na kůži. Můžeš se '
            'dotknout něčeho a zkusit vnímat strukturu a pocit na kůži.',
        icon: Icons.touch_app_outlined,
      ),
      PracticeExercise(
        title: 'Napětí',
        description:
            'Zastav se a věnuj pozornost místu, kde cítíš v těle napětí (např. '
            'ramena, břicho). Jen to sleduj, bez hodnocení.',
        icon: Icons.compress,
      ),
      PracticeExercise(
        title: 'Dech',
        description:
            'Soustřeď se na svůj dech – jak se při nádechu zvedá břicho a '
            'hrudník a jak při výdechu klesají. Můžeš si všimnout i krátkých '
            'pauz mezi nádechem a výdechem.',
        icon: Icons.air,
      ),
      PracticeExercise(
        title: 'Myšlenky',
        description:
            'Jen si všimni, jak přicházejí a odcházejí. Zkus si představit, že '
            'myšlenky jsou mraky na obloze nebo listy plující po řece, které '
            'jenom sleduješ.',
        icon: Icons.cloud_outlined,
      ),
    ],
  ),
  SkillSectionData(
    sectionKey: 'popisovani',
    icon: Icons.chat_bubble_outline,
    title: 'Popisování',
    subtitle: 'Co dovednost 2/3',
    educationParagraphs: [
      'Když si něčeho všimnu, dám tomu slova. Například: „Teď cítím napětí v '
          'ramenou.“ nebo „Objevila se myšlenka, že to nezvládnu.“ Dávání slov '
          'pomáhá získat odstup a vyjasnit si, co se děje.',
    ],
    pickLead:
        'Během dneška si vyzkoušíme i popisování. Zkus si vybrat minimálně dvě '
        'cvičení z nabídky.',
    exercises: [
      PracticeExercise(
        title: 'Popisuj okolí',
        description:
            'Podívej se na oblohu, list nebo na člověka kolem sebe a zkus ho '
            'popsat co nejpřesněji – barvy, tvary, pohyby. Vyhýbej se odhadům '
            'nebo hodnocení.',
        icon: Icons.landscape_outlined,
      ),
      PracticeExercise(
        title: 'Popisuj řeč a chování',
        description:
            'Když s někým mluvíš, zopakuj si přesně, co řekl. Nebo popiš '
            'konkrétně, co člověk dělá – bez domýšlení jeho záměrů.',
        icon: Icons.record_voice_over_outlined,
      ),
      PracticeExercise(
        title: 'Popisuj emoce',
        description:
            'Když přijde emoce, pojmenuj ji: „Cítím vztek“ nebo „Teď se '
            'objevuje smutek“.',
        icon: Icons.favorite_border,
      ),
      PracticeExercise(
        title: 'Popisuj myšlenky',
        description:
            'Když tě zaplaví silná emoce, všimni si svých myšlenek: např. '
            '„Cítím smutek a moje myšlenky jsou, že bych se potřeboval/a '
            'někomu svěřit“.',
        icon: Icons.psychology_outlined,
      ),
      PracticeExercise(
        title: 'Popisuj dech',
        description:
            'Sleduj svůj nádech a výdech. Můžeš si v duchu říkat „nadechuji '
            'se, vydechuji“ nebo počítat dechové cykly od 1 do 10.',
        icon: Icons.air,
      ),
    ],
  ),
  SkillSectionData(
    sectionKey: 'participace',
    icon: Icons.volunteer_activism_outlined,
    title: 'Participace',
    subtitle: 'Co dovednost 3/3',
    educationParagraphs: [
      'Když něco dělám, snažím se být do toho naplno ponořený. Ne napůl myslet '
          'na něco jiného, ale věnovat pozornost aktivitě, ve které právě jsem.',
    ],
    pickLead:
        'I u této dovednosti pro sebe na dnešní den vyber minimálně dvě '
        'cvičení, která vyzkoušíš.',
    exercises: [
      PracticeExercise(
        title: 'Zapojení se u běžných aktivit',
        description:
            'Vnímej, jak si čistíš zuby, zamykáš dveře, skládáš věci do tašky, '
            'jdeš na zastávku… Většinou všechno tohle děláme automaticky. '
            'Vyzkoušej si opravdu vědomě všímat i těchto momentů.',
        icon: Icons.checklist_rtl,
      ),
      PracticeExercise(
        title: 'Prožij spojení s okolím',
        description:
            'Vnímej, jak tě drží zem pod nohama, jak tě podpírá židle nebo jak '
            'tě zahřívají přikrývky. Uvědom si, že jsi propojený/á se světem '
            'kolem sebe.',
        icon: Icons.public,
      ),
      PracticeExercise(
        title: 'Hudba a pohyb',
        description: 'Tanči, zpívej nebo se jen hýbej do rytmu oblíbené hudby.',
        icon: Icons.music_note,
      ),
      PracticeExercise(
        title: 'Aktivity s druhými',
        description:
            'Když ti někdo něco vypráví, zkus se do toho plně ponořit a '
            'naslouchat naplno. Nebo se zapoj do sportu, hry či skupinové '
            'činnosti.',
        icon: Icons.people_outline,
      ),
      PracticeExercise(
        title: 'Tělesné aktivity',
        description:
            'Jdi běhat, cvičit nebo cokoliv jiného a zkus se soustředit jen na '
            'pohyb, bez myšlenek na něco jiného.',
        icon: Icons.directions_run,
      ),
      PracticeExercise(
        title: 'Slova a dech',
        description: 'Zkus se plně soustředit na jedno slovo nebo na počítání dechu.',
        icon: Icons.spa_outlined,
      ),
    ],
  ),
];
