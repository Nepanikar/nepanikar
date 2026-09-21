import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/education_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_mindfulness_intro_screen.g.dart';

@TypedGoRoute<Week2Day1MindfulnessIntroScreenRoute>(path: '/bpd-programme/week/2/day/1')
class Week2Day1MindfulnessIntroScreenRoute extends GoRouteData
    with $Week2Day1MindfulnessIntroScreenRoute {
  const Week2Day1MindfulnessIntroScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day1MindfulnessIntroScreen();
}

/// Week 2, Day 1 — mindfulness education: what it is → why it helps → why DBT
/// treats it as the foundational skill. Education only, per source §1, so the
/// whole lesson is one chat flow followed by the closing page.
class Week2Day1MindfulnessIntroScreen extends StatefulWidget {
  const Week2Day1MindfulnessIntroScreen({super.key});

  @override
  State<Week2Day1MindfulnessIntroScreen> createState() => _Week2Day1MindfulnessIntroScreenState();
}

class _Week2Day1MindfulnessIntroScreenState extends State<Week2Day1MindfulnessIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 2;

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
    await _bpdDaysDao.markDayCompleted(2, 1);
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
                  Week2Day1EducationChatPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Co dovednosti',
                      description:
                          'Pozorování, popisování a participace – co vlastně '
                          'děláš, když praktikuješ všímavost.',
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
