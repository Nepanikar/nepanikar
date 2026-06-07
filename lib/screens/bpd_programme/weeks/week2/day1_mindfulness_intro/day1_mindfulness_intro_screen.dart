import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/benefits_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/dbt_context_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/reflection_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/completion_page.dart';

part 'day1_mindfulness_intro_screen.g.dart';

@TypedGoRoute<Week2Day1MindfulnessIntroScreenRoute>(
  path: '/bpd-programme/week/2/day/1',
)
class Week2Day1MindfulnessIntroScreenRoute extends GoRouteData
    with $Week2Day1MindfulnessIntroScreenRoute {
  const Week2Day1MindfulnessIntroScreenRoute();

  @override
  Widget build(BuildContext context, _) =>
      const Week2Day1MindfulnessIntroScreen();
}

class Week2Day1MindfulnessIntroScreen extends StatefulWidget {
  const Week2Day1MindfulnessIntroScreen({super.key});

  @override
  State<Week2Day1MindfulnessIntroScreen> createState() =>
      _Week2Day1MindfulnessIntroScreenState();
}

class _Week2Day1MindfulnessIntroScreenState
    extends State<Week2Day1MindfulnessIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 5;

  // Text controller for reflection page
  final TextEditingController _reflectionController = TextEditingController();

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void dispose() {
    _pageController.dispose();
    _reflectionController.dispose();
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

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(2, 1); // Week 2, Day 1
    if (mounted) {
      context.pop();
    }
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
            // Header with progress
            _buildHeader(primaryColor, isDarkMode),

            // Page content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  IntroPage(onNext: _goToNextPage),
                  BenefitsPage(onNext: _goToNextPage),
                  DbtContextPage(onNext: _goToNextPage),
                  ReflectionPage(
                    onNext: _goToNextPage,
                    controller: _reflectionController,
                  ),
                  CompletionPage(onComplete: _completeDay),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          // Back button
          IconButton(
            icon: Icon(
              _currentPage == 0 ? Icons.close : Icons.arrow_back,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () {
              if (_currentPage == 0) {
                context.pop();
              } else {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),

          // Progress indicator
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_totalPages, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? primaryColor
                            : (isDarkMode
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Page counter
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              '${_currentPage + 1}/$_totalPages',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDarkMode
                    ? Colors.white70
                    : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
