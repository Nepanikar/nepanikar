import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/day1_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/dbt_education_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/goals_expectations_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/how_program_works_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/hpo_education_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/mood_checkin_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/personalization_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/smart_intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/smart_worksheet_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/welcome_intro_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_expectations_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_onboarding_screen.g.dart';

@TypedGoRoute<Day1OnboardingScreenRoute>(
  path: '/bpd-programme/day-onboarding',
)
class Day1OnboardingScreenRoute extends GoRouteData
    with $Day1OnboardingScreenRoute {
  const Day1OnboardingScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Day1OnboardingScreen();
}

class Day1OnboardingScreen extends StatefulWidget {
  const Day1OnboardingScreen({super.key});

  @override
  State<Day1OnboardingScreen> createState() => _Day1OnboardingScreenState();
}

class _Day1OnboardingScreenState extends State<Day1OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 10;

  // Free-text inputs persisted across the flow.
  final _expectationsController = TextEditingController();
  final _goalsController = TextEditingController();
  final _smartControllers = List.generate(5, (_) => TextEditingController());

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();
  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();
  BpdExpectationsDao get _expectationsDao => registry.get<BpdExpectationsDao>();
  BpdSmartGoalsDao get _smartGoalsDao => registry.get<BpdSmartGoalsDao>();

  @override
  void dispose() {
    _pageController.dispose();
    _expectationsController.dispose();
    _goalsController.dispose();
    for (final c in _smartControllers) {
      c.dispose();
    }
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

  Future<void> _saveProfileAndNext(String name, BpdPronoun pronoun) async {
    await _userSettingsDao.saveBpdUserProfile(
      BpdUserProfile(name: name, pronoun: pronoun, createdAt: DateTime.now()),
    );
    _nextPage();
  }

  Future<void> _saveGoalsAndNext() async {
    await _expectationsDao.saveExpectationsAndGoals(
      expectations: _expectationsController.text.trim(),
      goals: _goalsController.text.trim(),
    );
    _nextPage();
  }

  Future<void> _saveSmartAndNext() async {
    final hasContent = _smartControllers.any((c) => c.text.trim().isNotEmpty);
    if (hasContent) {
      await _smartGoalsDao.createGoal(
        specific: _smartControllers[0].text.trim(),
        measurable: _smartControllers[1].text.trim(),
        achievable: _smartControllers[2].text.trim(),
        relevant: _smartControllers[3].text.trim(),
        timeBound: _smartControllers[4].text.trim(),
      );
    }
    _nextPage();
  }

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(1, 1);
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
            _buildHeader(primaryColor, isDarkMode),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Day1WelcomeIntroPage(onNext: _nextPage),
                  Day1HowProgramWorksPage(onNext: _nextPage),
                  Day1PersonalizationPage(onNext: _saveProfileAndNext),
                  Day1HpoEducationPage(onNext: _nextPage),
                  Day1DbtEducationPage(onNext: _nextPage),
                  Day1MoodCheckinPage(onNext: _nextPage),
                  Day1GoalsExpectationsPage(
                    onNext: _saveGoalsAndNext,
                    expectationsController: _expectationsController,
                    goalsController: _goalsController,
                  ),
                  Day1SmartIntroPage(onNext: _nextPage),
                  Day1SmartWorksheetPage(
                    onComplete: _saveSmartAndNext,
                    controllers: _smartControllers,
                  ),
                  Day1CompletionPage(onComplete: _completeDay),
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
