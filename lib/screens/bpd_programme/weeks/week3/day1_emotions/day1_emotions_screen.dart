import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/dictionary_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/intro_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/myth_busting_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/myths_list_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/obstacles_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_emotions_screen.g.dart';

@TypedGoRoute<Week3Day1EmotionsScreenRoute>(path: '/bpd-programme/week/3/day/1')
class Week3Day1EmotionsScreenRoute extends GoRouteData with $Week3Day1EmotionsScreenRoute {
  const Week3Day1EmotionsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day1EmotionsScreen();
}

/// Week 3, Day 1 — Edukace o emocích. Verbatim, source: tyzden-3.md §1.
///
/// What regulation is (chat) → emotion dictionary → why regulation is hard →
/// the twenty myths in two halves → busting them → completion.
class Week3Day1EmotionsScreen extends StatefulWidget {
  const Week3Day1EmotionsScreen({super.key});

  @override
  State<Week3Day1EmotionsScreen> createState() => _Week3Day1EmotionsScreenState();
}

class _Week3Day1EmotionsScreenState extends State<Week3Day1EmotionsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 7;

  /// Where the list of myths splits across the two pages.
  static final int _mythsPerPage = day1Myths.length ~/ 2;

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
    await _bpdDaysDao.markDayCompleted(3, 1);
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
                  Week3IntroChatPage(onNext: _goToNextPage),
                  Week3DictionaryPage(onNext: _goToNextPage),
                  Week3ObstaclesPage(onNext: _goToNextPage),
                  Week3MythsListPage(
                    startIndex: 0,
                    endIndex: _mythsPerPage,
                    isFirstHalf: true,
                    onNext: _goToNextPage,
                  ),
                  Week3MythsListPage(
                    startIndex: _mythsPerPage,
                    endIndex: day1Myths.length,
                    isFirstHalf: false,
                    onNext: _goToNextPage,
                  ),
                  Week3MythBustingPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Validace a popis emocí',
                      description:
                          'Jak emoci pojmenovat, rozebrat ji jako ve '
                          'zpomaleném filmu — a proč pomáhá uznat, že ji '
                          'máme právo cítit.',
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
