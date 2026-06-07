import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_education/completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_education/dbt_education_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_education/hpo_education_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_education/intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_education/skills_practice_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_education_screen.g.dart';

@TypedGoRoute<Day2EducationScreenRoute>(path: '/bpd-programme/week/1/day/2')
class Day2EducationScreenRoute extends GoRouteData with $Day2EducationScreenRoute {
  const Day2EducationScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Day2EducationScreen();
}

class Day2EducationScreen extends StatefulWidget {
  const Day2EducationScreen({super.key});

  @override
  State<Day2EducationScreen> createState() => _Day2EducationScreenState();
}

class _Day2EducationScreenState extends State<Day2EducationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 5;

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(1, 2);
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
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  IntroPage(onNext: _nextPage),
                  HpoEducationPage(onNext: _nextPage),
                  DbtEducationPage(onNext: _nextPage),
                  SkillsPracticePage(onNext: _nextPage),
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
                _previousPage();
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
                            : (isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300),
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
