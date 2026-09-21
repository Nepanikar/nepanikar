import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_footers.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/intro_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/skill_practice_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day3_how_skills_screen.g.dart';

@TypedGoRoute<Week2Day3HowSkillsScreenRoute>(path: '/bpd-programme/week/2/day/3')
class Week2Day3HowSkillsScreenRoute extends GoRouteData with $Week2Day3HowSkillsScreenRoute {
  const Week2Day3HowSkillsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day3HowSkillsScreen();
}

/// Week 2, Day 3 — "Jak dovednosti": intro → jednomyslně / bez hodnocení (with
/// example pairs) / efektivně (with the Week 1 SMART goal). Source: §3.
class Week2Day3HowSkillsScreen extends StatefulWidget {
  const Week2Day3HowSkillsScreen({super.key});

  @override
  State<Week2Day3HowSkillsScreen> createState() => _Week2Day3HowSkillsScreenState();
}

class _Week2Day3HowSkillsScreenState extends State<Week2Day3HowSkillsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  /// Intro + one page per skill + completion.
  static final int _totalPages = week2Day3Sections.length + 2;

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
    await _bpdDaysDao.markDayCompleted(2, 3);
    if (mounted) context.pop();
  }

  /// Extra content under a section's pick-list, where the source adds some.
  Widget? _footerFor(String sectionKey) {
    switch (sectionKey) {
      case 'bez_hodnoceni':
        return const NonJudgmentalExamples();
      case 'efektivne':
        return const SmartGoalReminder();
      default:
        return null;
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
                  Week2Day3IntroChatPage(onNext: _goToNextPage),
                  ...week2Day3Sections.map(
                    (section) => SkillPracticePage(
                      weekNumber: 2,
                      dayNumber: 3,
                      sectionKey: section.sectionKey,
                      icon: section.icon,
                      title: section.title,
                      subtitle: section.subtitle,
                      educationParagraphs: section.educationParagraphs,
                      pickLead: section.pickLead,
                      exercises: section.exercises,
                      footer: _footerFor(section.sectionKey),
                      onNext: _goToNextPage,
                    ),
                  ),
                  DayCompletionPage(
                    dayNumber: 3,
                    summary:
                        'Včera a dnes jsme se naučili základy pro všímavost. '
                        'Zkus zítra být všímavý/á alespoň v jedné situaci '
                        '(např. při snídani, procházce, poslechu hudby) a snaž '
                        'se uplatnit všechny co i jak dovednosti.',
                    nextDay: const NextDayTeaser(
                      title: 'Všímavé dýchání',
                      description:
                          'Dech jako způsob, jak se zastavit a ukotvit v '
                          'přítomném okamžiku.',
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
