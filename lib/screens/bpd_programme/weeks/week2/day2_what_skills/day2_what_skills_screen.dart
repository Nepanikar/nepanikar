import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day2_what_skills/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day2_what_skills/intro_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/skill_practice_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_what_skills_screen.g.dart';

@TypedGoRoute<Week2Day2WhatSkillsScreenRoute>(path: '/bpd-programme/week/2/day/2')
class Week2Day2WhatSkillsScreenRoute extends GoRouteData with $Week2Day2WhatSkillsScreenRoute {
  const Week2Day2WhatSkillsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day2WhatSkillsScreen();
}

/// Week 2, Day 2 — "Co dovednosti": intro → pozorování / popisování /
/// participace, each with a pick-at-least-two exercise menu. Source: §2.
class Week2Day2WhatSkillsScreen extends StatefulWidget {
  const Week2Day2WhatSkillsScreen({super.key});

  @override
  State<Week2Day2WhatSkillsScreen> createState() => _Week2Day2WhatSkillsScreenState();
}

class _Week2Day2WhatSkillsScreenState extends State<Week2Day2WhatSkillsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  /// Intro + one page per skill + completion.
  static final int _totalPages = week2Day2Sections.length + 2;

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(2, 2);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : NepanikarColors.white,
      body: SafeArea(
        child: Column(
          children: [
            DayFlowHeader(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onBack: _goToPreviousPage,
              onClose: () => context.pop(),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Week2Day2IntroChatPage(onNext: _goToNextPage),
                  ...week2Day2Sections.map(
                    (section) => SkillPracticePage(
                      weekNumber: 2,
                      dayNumber: 2,
                      sectionKey: section.sectionKey,
                      icon: section.icon,
                      title: section.title,
                      subtitle: section.subtitle,
                      educationParagraphs: section.educationParagraphs,
                      pickLead: section.pickLead,
                      exercises: section.exercises,
                      onNext: _goToNextPage,
                    ),
                  ),
                  DayCompletionPage(
                    dayNumber: 2,
                    summary:
                        'Znáš tři CO dovednosti a vybral/a jsi si cvičení, '
                        'která dnes zkusíš. Najdeš je uložená, kdykoliv se '
                        'sem vrátíš.',
                    nextDay: const NextDayTeaser(
                      title: 'Jak dovednosti',
                      description:
                          'Jednomyslně, bez hodnocení a efektivně – jak ty '
                          'dovednosti vykonávat.',
                    ),
                    onComplete: _completeDay,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
