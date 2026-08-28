import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_pages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_crisis_skills_screen.g.dart';

@TypedGoRoute<Week4Day2CrisisSkillsScreenRoute>(path: '/bpd-programme/week/4/day/2')
class Week4Day2CrisisSkillsScreenRoute extends GoRouteData with $Week4Day2CrisisSkillsScreenRoute {
  const Week4Day2CrisisSkillsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week4Day2CrisisSkillsScreen();
}

/// Week 4, Day 2 — dovednosti pro překonání krize. Source: tyzden-4.md §2.
///
/// Six pages: the framing arrives as chat, then the two acronyms as pages the
/// user can save, then the relaxation video, then the closing page. The
/// framing comes first on purpose — a crisis tool handed over without its
/// limits is the one thing this day must not do.
class Week4Day2CrisisSkillsScreen extends StatefulWidget {
  const Week4Day2CrisisSkillsScreen({super.key});

  @override
  State<Week4Day2CrisisSkillsScreen> createState() => _Week4Day2CrisisSkillsScreenState();
}

class _Week4Day2CrisisSkillsScreenState extends State<Week4Day2CrisisSkillsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 6;

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
    await _bpdDaysDao.markDayCompleted(4, 2);
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
                  Week4Day2CrisisChatPage(onNext: _goToNextPage),
                  Week4Day2WhenChatPage(onNext: _goToNextPage),
                  Week4Day2StopPage(onNext: _goToNextPage),
                  Week4Day2TipsPage(onNext: _goToNextPage),
                  Week4Day2RelaxationPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 2,
                    summary: day2CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Zítra program vynecháme — máš za sebou náročný den '
                          'a zasloužíš si chvíli klidu.',
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
