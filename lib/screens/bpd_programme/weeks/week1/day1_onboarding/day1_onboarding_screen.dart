import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/bpd_onboarding/onboarding_disclaimer_page.dart';
import 'package:nepanikar/widgets/bpd_onboarding/onboarding_how_it_works_page.dart';
import 'package:nepanikar/widgets/bpd_onboarding/onboarding_personalization_page.dart';
import 'package:nepanikar/widgets/bpd_onboarding/onboarding_program_areas_page.dart';
import 'package:nepanikar/widgets/bpd_onboarding/onboarding_welcome_page.dart';

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
  static const int _totalPages = 5;

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();
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

  Future<void> _completeOnboarding(String name, BpdPronoun pronoun) async {
    // Save user profile
    final userProfile = BpdUserProfile(
      name: name,
      pronoun: pronoun,
      createdAt: DateTime.now(),
    );
    await _userSettingsDao.saveBpdUserProfile(userProfile);

    // Mark Day 1 of Week 1 as completed
    await _bpdDaysDao.markDayCompleted(1, 1);

    // Navigate back
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
            // Header with close button and progress
            _buildHeader(primaryColor, isDarkMode),

            // Page content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  OnboardingWelcomePage(onNext: _nextPage),
                  OnboardingHowItWorksPage(onNext: _nextPage),
                  OnboardingProgramAreasPage(onNext: _nextPage),
                  OnboardingDisclaimerPage(onNext: _nextPage),
                  OnboardingPersonalizationPage(
                    onComplete: _completeOnboarding,
                  ),
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
          // Back/close button
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
