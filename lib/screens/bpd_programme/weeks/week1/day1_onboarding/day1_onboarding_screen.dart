import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/day1_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/education_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/goals_expectations_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/mood_checkin_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/smart_intro_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/smart_worksheet_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/welcome_chat_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_expectations_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_onboarding_screen.g.dart';

@TypedGoRoute<Day1OnboardingScreenRoute>(path: '/bpd-programme/day-onboarding')
class Day1OnboardingScreenRoute extends GoRouteData with $Day1OnboardingScreenRoute {
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
  static const int _totalPages = 7;

  /// Index of the SMART worksheet page (the "enter your goal" step).
  static const int _smartWorksheetPage = 5;

  /// True once Day 1 has been completed before; enables the quick jump to the
  /// SMART goal so a returning user doesn't have to re-read the intro pages.
  bool _alreadyCompleted = false;

  // Free-text inputs persisted across the flow.
  final _expectationsController = TextEditingController();
  final _goalsController = TextEditingController();
  final _smartControllers = List.generate(5, (_) => TextEditingController());

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();
  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();
  BpdExpectationsDao get _expectationsDao => registry.get<BpdExpectationsDao>();
  BpdSmartGoalsDao get _smartGoalsDao => registry.get<BpdSmartGoalsDao>();

  @override
  void initState() {
    super.initState();
    _prefillSavedAnswers();
    _checkAlreadyCompleted();
  }

  /// Re-surfaces previously saved expectations + goals when the user re-walks
  /// the flow, so their earlier answers show up in the text fields again.
  Future<void> _prefillSavedAnswers() async {
    final saved = await _expectationsDao.getExpectationsAndGoals();
    if (saved == null) return;
    if (_expectationsController.text.isEmpty) {
      _expectationsController.text = saved.expectations;
    }
    if (_goalsController.text.isEmpty) {
      _goalsController.text = saved.goals;
    }
  }

  Future<void> _checkAlreadyCompleted() async {
    final dayProgress = await _bpdDaysDao.getDayProgress(1, 1);
    if (!mounted) return;
    if (dayProgress?.isCompleted ?? false) {
      setState(() => _alreadyCompleted = true);
    }
  }

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
    final values = _smartControllers.map((c) => c.text.trim()).toList();
    final hasContent = values.any((v) => v.isNotEmpty);
    if (hasContent) {
      // Re-walking the flow must not duplicate a goal that is already saved.
      final existing = await _smartGoalsDao.getAllGoals(includeArchived: true);
      final alreadySaved = existing.values.any(
        (g) =>
            g.specific == values[0] &&
            g.measurable == values[1] &&
            g.achievable == values[2] &&
            g.relevant == values[3] &&
            g.timeBound == values[4],
      );
      if (!alreadySaved) {
        await _smartGoalsDao.createGoal(
          specific: values[0],
          measurable: values[1],
          achievable: values[2],
          relevant: values[3],
          timeBound: values[4],
        );
      }
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
            if (_alreadyCompleted && _currentPage < _smartWorksheetPage)
              _buildSkipToGoalBanner(primaryColor, isDarkMode),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Day1WelcomeChatPage(onNext: _saveProfileAndNext),
                  Day1EducationChatPage(onNext: _nextPage),
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

  Widget _buildSkipToGoalBanner(Color primaryColor, bool isDarkMode) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 2, 16, 8),
      padding: const EdgeInsets.fromLTRB(14, 8, 6, 8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 18, color: primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Tento den už máš hotový.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () => _pageController.jumpToPage(_smartWorksheetPage),
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: const Size(0, 36),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Rovnou k cíli',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
                            : (isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300),
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
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
