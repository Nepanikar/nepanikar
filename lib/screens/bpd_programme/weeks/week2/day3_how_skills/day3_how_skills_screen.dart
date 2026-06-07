import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/one_mindfully_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/non_judgmentally_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/effectively_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/completion_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day3_how_skills_screen.g.dart';

@TypedGoRoute<Week2Day3HowSkillsScreenRoute>(
  path: '/bpd-programme/week/2/day/3',
)
class Week2Day3HowSkillsScreenRoute extends GoRouteData
    with $Week2Day3HowSkillsScreenRoute {
  const Week2Day3HowSkillsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day3HowSkillsScreen();
}

class Week2Day3HowSkillsScreen extends StatefulWidget {
  const Week2Day3HowSkillsScreen({super.key});

  @override
  State<Week2Day3HowSkillsScreen> createState() =>
      _Week2Day3HowSkillsScreenState();
}

class _Week2Day3HowSkillsScreenState extends State<Week2Day3HowSkillsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 5;

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
    await _bpdDaysDao.markDayCompleted(2, 3); // Week 2, Day 3
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
            _buildHeader(primaryColor, isDarkMode),
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
                  OneMindfullyPage(onNext: _goToNextPage),
                  NonJudgmentallyPage(onNext: _goToNextPage),
                  EffectivelyPage(onNext: _goToNextPage),
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
