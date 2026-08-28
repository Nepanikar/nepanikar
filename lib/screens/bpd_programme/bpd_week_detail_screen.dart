import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/day1_onboarding_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_spoko/day2_spoko_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day7_reflection/day7_reflection_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_screen.dart';
import 'package:nepanikar/screens/bpd_programme/shared/day_pause_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/day1_mindfulness_intro_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day2_what_skills/day2_what_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_how_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/day4_breathing_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/day6_techniques_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_emotions_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day2_describe/day2_describe_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day3_check_facts/day3_check_facts_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day4_opposite_action/day4_opposite_action_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day5_spoko_recall/day5_spoko_recall_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day1_stress/day1_stress_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_crisis_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_mindfulness_stress_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/day5_uznavam_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/home/my_records/dbt/dbt_records_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_day_models.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_preview_sheet.dart';

part 'bpd_week_detail_screen.g.dart';

/// Weeks that already have implemented day content. The weeks skill tree
/// unlocks only these; the rest stay locked until their content is built
/// (keep in sync with `_weekDaysContent` below).
const Set<int> kImplementedBpdWeeks = {1, 2, 3, 4};

/// Route type for different day content screens
enum _DayRouteType {
  regular,
  onboarding,
  pause,
  week1Day2Spoko,
  week1Day3Potrava,
  week1Day4Latky,
  week1Day5Kondice,
  week1Day6Onemocneni,
  week1Day7Reflexe,
  // Week 2 - Mindfulness
  week2Day1MindfulnessIntro,
  week2Day2WhatSkills,
  week2Day3HowSkills,
  week2Day4Breathing,
  week2Day6Techniques,
  week2Day7Summary,
  // Week 3 - Emoční regulace
  week3Day1Emotions,
  week3Day2Describe,
  week3Day3CheckFacts,
  week3Day4OppositeAction,
  week3Day5SpokoRecall,
  week3Day7Summary,
  // Week 4 - Snášení tísně
  week4Day1Stress,
  week4Day2CrisisSkills,
  week4Day4Mindfulness,
  week4Day5Uznavam,
  week4Day7Summary,
}

@TypedGoRoute<BpdWeekDetailScreenRoute>(path: '/bpd-programme/week/:weekNumber')
class BpdWeekDetailScreenRoute extends GoRouteData with $BpdWeekDetailScreenRoute {
  const BpdWeekDetailScreenRoute({required this.weekNumber});

  final int weekNumber;

  @override
  Widget build(BuildContext context, _) => BpdWeekDetailScreen(weekNumber: weekNumber);
}

class BpdWeekDetailScreen extends StatefulWidget {
  const BpdWeekDetailScreen({super.key, required this.weekNumber});

  final int weekNumber;

  @override
  State<BpdWeekDetailScreen> createState() => _BpdWeekDetailScreenState();
}

class _BpdWeekDetailScreenState extends State<BpdWeekDetailScreen> {
  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  List<BpdDayProgress> _daysProgress = [];
  bool _isLoading = true;
  Timer? _timer;

  // Day content data for each week - based on the BPD program PDF
  final Map<int, List<_DayContentData>> _weekDaysContent = {
    1: [
      const _DayContentData(
        title: 'Představení programu',
        description:
            'Vítej v programu! Seznámíš se s tím, co tě čeká během následujících 7 týdnů, dozvíš se něco o HPO a DBT, zaznamenáš si svou náladu a nastavíš si první SMART cíl.',
        estimatedTime: '15-20 min',
        activityType: 'Úvod',
        routeType: _DayRouteType.onboarding,
      ),
      const _DayContentData(
        title: 'SPOKO + Spánek',
        description:
            'Seznámíš se s modelem SPOKO – základními oblastmi péče o tělo a psychickou stabilitu. Dnešní zaměření je spánek: zmapuješ si svůj současný stav a můžeš si vybrat malou výzvu, kterou dnes zkusíš.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week1Day2Spoko,
      ),
      const _DayContentData(
        title: 'Potrava',
        description:
            'Druhá oblast modelu SPOKO – potrava. Jídlo ovlivňuje nejen tělo, ale i emoce, energii a zvládání stresu. Zmapuješ si svůj současný stav a můžeš si vybrat malou výzvu.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week1Day3Potrava,
      ),
      const _DayContentData(
        title: 'Ne omamným látkám',
        description:
            'Téma omamných látek a jejich vlivu na náladu, spánek a zvládání stresu. Bez hodnocení si všimneš svého vztahu k nim a můžeš si zkusit malou výzvu.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week1Day4Latky,
      ),
      const _DayContentData(
        title: 'Kondice',
        description:
            'Pohyb a fyzická aktivita mají přímý vliv na náladu, stres i energii. Nejde o výkon, ale o to, jak se tělo cítí v pohybu. Vyber si malou pohybovou výzvu.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week1Day5Kondice,
      ),
      const _DayContentData(
        title: 'Léčba onemocnění',
        description:
            'Poslední oblast modelu SPOKO. Tělesné i psychické zdraví jsou propojené. Všimneš si, jak se staráš o své zdraví, a stanovíš si poslední výzvu tohoto týdne.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week1Day6Onemocneni,
      ),
      const _DayContentData(
        title: 'Reflexe SPOKO a týdne',
        description:
            'Máme za sebou první týden! Připomeneš si oblasti modelu SPOKO a zamyslíš se nad tím, co ti přinesly, která byla nejvíc relevantní a co si chceš odnést dál.',
        estimatedTime: '5-10 min',
        activityType: 'Reflexe',
        routeType: _DayRouteType.week1Day7Reflexe,
      ),
    ],
    // Week 2 - Všímavost
    2: [
      const _DayContentData(
        title: 'Edukace všímavosti',
        description:
            'Dozvíš se, co je všímavost a proč je v DBT považovaná za základní dovednost, na které stojí všechny ostatní.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace',
        routeType: _DayRouteType.week2Day1MindfulnessIntro,
      ),
      const _DayContentData(
        title: 'Co dovednosti',
        description:
            'Tři dovednosti, které popisují, co vlastně děláš, když praktikuješ všímavost – pozorování, popisování a participace. Z každé si vybereš aspoň dvě cvičení na dnešní den.',
        estimatedTime: '10-15 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week2Day2WhatSkills,
      ),
      const _DayContentData(
        title: 'Jak dovednosti',
        description:
            'Jak ty dovednosti vykonávat – jednomyslně, bez hodnocení a efektivně. Opět si z každé nabídky vybereš aspoň dvě cvičení.',
        estimatedTime: '10-15 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week2Day3HowSkills,
      ),
      const _DayContentData(
        title: 'Všímavé dýchání',
        description:
            'Dech pomáhá zastavit se a ukotvit v přítomném okamžiku. Vybereš si z několika dechových cvičení – zbytek si můžeš uložit do záchranného balíčku.',
        estimatedTime: '5-10 min',
        activityType: 'Cvičení',
        routeType: _DayRouteType.week2Day4Breathing,
      ),
      const _DayContentData(
        title: 'Pauza',
        description:
            'Dnešek bude ve znamení pauzy od programu. Už teď máš za sebou spoustu skvělé práce – využij dnešní den k regeneraci.',
        estimatedTime: '2 min',
        activityType: 'Odpočinek',
        routeType: _DayRouteType.pause,
      ),
      const _DayContentData(
        title: 'Techniky všímavosti',
        description:
            'Rozšíříme naši znalost všímavých technik – skenování těla, všímavá chůze, jedení, naslouchání i všech pět smyslů pohromadě. Jedno si dnes vyzkoušíš.',
        estimatedTime: '5-10 min',
        activityType: 'Cvičení',
        routeType: _DayRouteType.week2Day6Techniques,
      ),
      const _DayContentData(
        title: 'Shrnutí týdne',
        description:
            'Máme za sebou druhý týden. Zamyslíš se nad tím, co pro tebe bylo nejzajímavější, co ses naučil/a a kdy ti všímavost pomohla.',
        estimatedTime: '5-10 min',
        activityType: 'Reflexe',
        routeType: _DayRouteType.week2Day7Summary,
      ),
    ],
    3: [
      const _DayContentData(
        title: 'Edukace o emocích',
        description:
            'Co je emoční regulace, k čemu jednotlivé emoce slouží a proč je jejich zvládání někdy tak těžké. Na konci si zkusíš zbořit několik mýtů o emocích.',
        estimatedTime: '15-20 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week3Day1Emotions,
      ),
      const _DayContentData(
        title: 'Validace a popis emocí',
        description:
            'Emoce mají strukturu – rozebereme si jednu tvoji situaci jako ve zpomaleném filmu. A naučíš se uznat, že máš právo cítit to, co cítíš.',
        estimatedTime: '15-20 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week3Day2Describe,
      ),
      const _DayContentData(
        title: 'Ověřování faktů',
        description:
            'Mezi událostí a emocí stojí myšlenka. Když ověříš fakta, můžeš změnit i to, co cítíš. Čeká tě nejdelší cvičení programu – ale nemusíš ho stihnout naráz.',
        estimatedTime: '15-20 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week3Day3CheckFacts,
      ),
      const _DayContentData(
        title: 'Opačná akce',
        description:
            'Technika, kdy jednáš opačně, než by tě emoce nutila – ve třech rovinách. Dnes je to jen na čtení, žádné vyplňování.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace',
        routeType: _DayRouteType.week3Day4OppositeAction,
      ),
      const _DayContentData(
        title: 'Když to, co děláš, nefunguje',
        description:
            'Krátké připomenutí: když dovednosti nezabírají, bývá to tělo. Vrátíme se k modelu SPOKO z prvního týdne.',
        estimatedTime: '5 min',
        activityType: 'Připomenutí',
        routeType: _DayRouteType.week3Day5SpokoRecall,
      ),
      const _DayContentData(
        title: 'Pauza',
        description:
            'Dnes program vynecháme. Máš za sebou skvělý pokrok a zasloužíš si chvilku odpočinku.',
        estimatedTime: '2 min',
        activityType: 'Odpočinek',
        routeType: _DayRouteType.pause,
      ),
      const _DayContentData(
        title: 'Shrnutí týdne',
        description:
            'Uzavíráme třetí týden. Zamyslíš se nad tím, co pro tebe bylo klíčové, co se ti podařilo uvést do praxe a kde dovednost využiješ dál.',
        estimatedTime: '5-10 min',
        activityType: 'Reflexe',
        routeType: _DayRouteType.week3Day7Summary,
      ),
    ],
    4: [
      const _DayContentData(
        title: 'Edukace o stresu',
        description:
            'Kdy je stres přirozený a užitečný a kdy se mění v distres. Dnes jen čtení – tenhle týden bude o akutních chvílích.',
        estimatedTime: '5-10 min',
        activityType: 'Edukace',
        routeType: _DayRouteType.week4Day1Stress,
      ),
      const _DayContentData(
        title: 'Dovednosti pro překonání krize',
        description:
            'Dva nástroje pro nejtěžší chvíle – STOP a TIPS. Naučíš se i to, kdy je použít a kdy naopak ne. Na konci si zkusíš svalovou relaxaci.',
        estimatedTime: '15-20 min',
        activityType: 'Edukace + Technika',
        routeType: _DayRouteType.week4Day2CrisisSkills,
      ),
      const _DayContentData(
        title: 'Pauza',
        description:
            'Dnes program vynecháme. Udělal/a jsi velký pokrok a zasloužíš si chvíli klidu pro načerpání nové energie.',
        estimatedTime: '2 min',
        activityType: 'Odpočinek',
        routeType: _DayRouteType.pause,
      ),
      const _DayContentData(
        title: 'Všímavost u stresu',
        description:
            'Jak všímavost z druhého týdne pomáhá ve stresu – v daný moment i dlouhodobě. Na konci si jednu techniku vylosuješ.',
        estimatedTime: '10 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week4Day4Mindfulness,
      ),
      const _DayContentData(
        title: 'Techniky pro zvládnutí okamžiku krize',
        description:
            'UZNÁVÁM – sedm drobných triků, které odvedou pozornost, dokud bouře neodezní. Označíš si, co jsi z nich zkusil/a.',
        estimatedTime: '15 min',
        activityType: 'Edukace + Cvičení',
        routeType: _DayRouteType.week4Day5Uznavam,
      ),
      const _DayContentData(
        title: 'Pauza',
        description:
            'Dnes si dopřejeme volnější den bez programu. Máš za sebou opravdu velký kus práce.',
        estimatedTime: '2 min',
        activityType: 'Odpočinek',
        routeType: _DayRouteType.pause,
      ),
      const _DayContentData(
        title: 'Shrnutí týdne',
        description:
            'Uzavíráme čtvrtý týden. Zamyslíš se nad tím, co ti nejvíc dalo, co se ti podařilo použít a kde se dovednost nabídne dál.',
        estimatedTime: '5-10 min',
        activityType: 'Reflexe',
        routeType: _DayRouteType.week4Day7Summary,
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    _loadDaysProgress();
    // Update timer every second for countdown
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadDaysProgress() async {
    try {
      final daysProgress = await _bpdDaysDao.getWeekDaysProgress(widget.weekNumber);

      // If no days exist, initialize them
      if (daysProgress.isEmpty) {
        await _bpdDaysDao.initializeDaysForWeek(widget.weekNumber, DateTime.now());
      }

      // DEV: Unlock all days in week 1 for testing
      await _bpdDaysDao.unlockAllDaysInWeek(widget.weekNumber);

      final newDaysProgress = await _bpdDaysDao.getWeekDaysProgress(widget.weekNumber);
      if (mounted) {
        setState(() {
          _daysProgress = newDaysProgress;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading days progress: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getDayTitle(int dayNumber) {
    final content = _weekDaysContent[widget.weekNumber];
    if (content != null && dayNumber > 0 && dayNumber <= content.length) {
      return content[dayNumber - 1].title;
    }
    return 'Den $dayNumber';
  }

  _DayContentData? _getDayContent(int dayNumber) {
    final content = _weekDaysContent[widget.weekNumber];
    if (content != null && dayNumber > 0 && dayNumber <= content.length) {
      return content[dayNumber - 1];
    }
    return null;
  }

  void _handleDayTap(BpdDayProgress dayProgress) {
    if (!dayProgress.isUnlocked() && !dayProgress.isCompleted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Tento den je ještě zamčený')));
      return;
    }

    // Show Day Preview Sheet
    final dayContent = _getDayContent(dayProgress.dayNumber);
    if (dayContent == null) return;

    showDayPreviewSheet(
      context: context,
      data: DayPreviewData(
        dayNumber: dayProgress.dayNumber,
        weekNumber: widget.weekNumber,
        title: dayContent.title,
        description: dayContent.description,
        estimatedTime: dayContent.estimatedTime,
        activityType: dayContent.activityType,
        isCompleted: dayProgress.isCompleted,
      ),
      onStart: () {
        // Navigate based on route type
        switch (dayContent.routeType) {
          case _DayRouteType.onboarding:
            const Day1OnboardingScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day2Spoko:
            const Week1Day2SpokoScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day3Potrava:
            const Week1Day3PotravaScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day4Latky:
            const Week1Day4LatkyScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day5Kondice:
            const Week1Day5KondiceScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day6Onemocneni:
            const Week1Day6OnemocneniScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week1Day7Reflexe:
            const Week1Day7ReflexeScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day1MindfulnessIntro:
            const Week2Day1MindfulnessIntroScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day2WhatSkills:
            const Week2Day2WhatSkillsScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day3HowSkills:
            const Week2Day3HowSkillsScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day4Breathing:
            const Week2Day4BreathingScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day6Techniques:
            const Week2Day6TechniquesScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week2Day7Summary:
            const Week2Day7SummaryScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day1Emotions:
            const Week3Day1EmotionsScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day2Describe:
            const Week3Day2DescribeScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day3CheckFacts:
            const Week3Day3CheckFactsScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day4OppositeAction:
            const Week3Day4OppositeActionScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day5SpokoRecall:
            const Week3Day5SpokoRecallScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week3Day7Summary:
            const Week3Day7SummaryScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week4Day1Stress:
            const Week4Day1StressScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week4Day2CrisisSkills:
            const Week4Day2CrisisSkillsScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week4Day4Mindfulness:
            const Week4Day4MindfulnessScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week4Day5Uznavam:
            const Week4Day5UznavamScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.week4Day7Summary:
            const Week4Day7SummaryScreenRoute().push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.pause:
            DayPauseScreenRoute(
              weekNumber: widget.weekNumber,
              dayNumber: dayProgress.dayNumber,
            ).push(context).then((_) {
              _loadDaysProgress();
            });
          case _DayRouteType.regular:
            // TODO: Navigate to regular day content screen
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Otevírám Den ${dayProgress.dayNumber}')));
        }
      },
    );
  }

  String _formatCountdown(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String _formatUnlockDate(DateTime date) {
    final months = [
      'Január',
      'Február',
      'Marec',
      'Apríl',
      'Máj',
      'Jún',
      'Júl',
      'August',
      'September',
      'Október',
      'November',
      'December',
    ];
    final day = date.day;
    final month = months[date.month - 1];
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return 'Odomkne sa $day. $month, $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'DBT program',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.self_improvement, color: Colors.white, size: 24),
                      tooltip: 'DBT program',
                      onPressed: () => const DbtRecordsRoute().push<void>(context),
                    ),
                  ],
                ),
              ),
            ),

            // Days list
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _daysProgress.length,
                      itemBuilder: (context, index) {
                        final dayProgress = _daysProgress[index];
                        return _buildDayCard(
                          dayProgress: dayProgress,
                          nextDayProgress: index + 1 < _daysProgress.length
                              ? _daysProgress[index + 1]
                              : null,
                          primaryColor: primaryColor,
                          isDarkMode: isDarkMode,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayCard({
    required BpdDayProgress dayProgress,
    required BpdDayProgress? nextDayProgress,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    final isCompleted = dayProgress.isCompleted;
    final isActive = dayProgress.isActive();
    final isLocked = !dayProgress.isUnlocked();
    // Time left until the *following* day opens — null once it is unlocked, so
    // the banner disappears instead of promising an unlock that already
    // happened. The 1s ticker in [initState] keeps it counting down.
    final nextUnlockIn = nextDayProgress?.getRemainingTime();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _handleDayTap(dayProgress),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: isCompleted
                ? primaryColor.withOpacity(0.1)
                : (isActive
                      ? Colors.white
                      : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white)),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isActive
                  ? primaryColor
                  : (isCompleted
                        ? primaryColor.withOpacity(0.3)
                        : (isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300)),
              width: isActive ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Den ${dayProgress.dayNumber}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isLocked
                                  ? (isDarkMode ? Colors.white38 : Colors.grey.shade400)
                                  : (isDarkMode ? Colors.white70 : Colors.grey.shade600),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getDayTitle(dayProgress.dayNumber),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isLocked
                                  ? (isDarkMode ? Colors.white38 : Colors.grey.shade400)
                                  : (isCompleted
                                        ? primaryColor
                                        : (isDarkMode ? Colors.white : primaryColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Status icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? primaryColor.withOpacity(0.15)
                            : (isActive
                                  ? primaryColor
                                  : (isDarkMode
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.grey.shade200)),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isCompleted ? Icons.check : (isActive ? Icons.play_arrow : Icons.lock),
                        color: isCompleted
                            ? primaryColor
                            : (isActive
                                  ? Colors.white
                                  : (isDarkMode ? Colors.white38 : Colors.grey.shade400)),
                        size: isActive ? 24 : 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Countdown or unlock info
              if (isActive && nextUnlockIn != null && !nextUnlockIn.isNegative)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.05),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time, size: 16, color: primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Další lekce se odemkne za: ${_formatCountdown(nextUnlockIn)}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              else if (isLocked)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.03) : Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: isDarkMode ? Colors.white38 : Colors.grey.shade500,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatUnlockDate(dayProgress.unlockDate),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.white38 : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper class for day content data
class _DayContentData {
  const _DayContentData({
    required this.title,
    required this.description,
    required this.estimatedTime,
    required this.activityType,
    this.routeType = _DayRouteType.regular,
  });

  final String title;
  final String description;
  final String estimatedTime;
  final String activityType;
  final _DayRouteType routeType;
}
