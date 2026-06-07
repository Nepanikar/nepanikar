import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/body_scan_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/mindful_walking_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/mindful_eating_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/mindful_listening_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/five_senses_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/completion_page.dart';

part 'day6_techniques_screen.g.dart';

@TypedGoRoute<Week2Day6TechniquesScreenRoute>(
  path: '/bpd-programme/week/2/day/6',
)
class Week2Day6TechniquesScreenRoute extends GoRouteData
    with $Week2Day6TechniquesScreenRoute {
  const Week2Day6TechniquesScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day6TechniquesScreen();
}

class Week2Day6TechniquesScreen extends StatefulWidget {
  const Week2Day6TechniquesScreen({super.key});

  @override
  State<Week2Day6TechniquesScreen> createState() => _Week2Day6TechniquesScreenState();
}

class _Week2Day6TechniquesScreenState extends State<Week2Day6TechniquesScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 7;

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

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(2, 6); // Week 2, Day 6
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
                  BodyScanPage(onNext: _goToNextPage),
                  MindfulWalkingPage(onNext: _goToNextPage),
                  MindfulEatingPage(onNext: _goToNextPage),
                  MindfulListeningPage(onNext: _goToNextPage),
                  FiveSensesPage(onNext: _goToNextPage),
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
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
