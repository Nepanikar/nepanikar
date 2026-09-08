import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week5/day4_prevention/day4_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day4_prevention_screen.g.dart';

@TypedGoRoute<Week5Day4PreventionScreenRoute>(path: '/bpd-programme/week/5/day/4')
class Week5Day4PreventionScreenRoute extends GoRouteData
    with $Week5Day4PreventionScreenRoute {
  const Week5Day4PreventionScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week5Day4PreventionScreen();
}

/// Week 5, Day 4 — plánování a prevence. Verbatim, source: tyzden-5.md §4.
///
/// Ten fields, the most in the programme, so they arrive two sections at a time.
class Week5Day4PreventionScreen extends StatefulWidget {
  const Week5Day4PreventionScreen({super.key});

  @override
  State<Week5Day4PreventionScreen> createState() => _Week5Day4PreventionScreenState();
}

class _Week5Day4PreventionScreenState extends State<Week5Day4PreventionScreen> {
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
    await _bpdDaysDao.markDayCompleted(5, 4);
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
                  Week5Day4WorksheetPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 4,
                    summary: day4CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Všímavost',
                      description:
                          'Jak všímavost pomáhá zastavit se dřív, než impulz '
                          'převezme řízení. Na konci si techniku vylosuješ.',
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

/// Page 1/2 — the five-section prevention plan.
class Week5Day4WorksheetPage extends StatefulWidget {
  const Week5Day4WorksheetPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<Week5Day4WorksheetPage> createState() => _Week5Day4WorksheetPageState();
}

class _Week5Day4WorksheetPageState extends State<Week5Day4WorksheetPage> {
  BpdWorksheetDao get _worksheetDao => registry.get<BpdWorksheetDao>();
  BpdRescuePackageDao get _rescueDao => registry.get<BpdRescuePackageDao>();

  /// Section 2 is a safety plan — what to do and whom to call when the urge
  /// hits. It is the one part of this worksheet that gets read in a crisis, so
  /// it goes where a crisis can reach it rather than staying inside Day 4.
  Future<void> _saveAndContinue() async {
    final answers = await _worksheetDao.getWorksheet(day4WorksheetId);
    final steps = answers['safety_steps']?.trim() ?? '';
    final contacts = answers['safety_contacts']?.trim() ?? '';

    if (steps.isNotEmpty || contacts.isNotEmpty) {
      await _rescueDao.save(
        BpdRescueItem(
          id: 'week5_safety_plan',
          title: 'Můj bezpečnostní plán',
          description: [
            if (steps.isNotEmpty) 'Co udělám: $steps',
            if (contacts.isNotEmpty) 'Komu zavolám: $contacts',
          ].join('\n'),
          sourceLabel: 'Týden 5 • Den 4',
          savedAt: DateTime.now(),
          iconKey: 'list',
        ),
      );
    }
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: _saveAndContinue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.shield_outlined,
            title: 'Plánování a prevence',
            subtitle: 'Den 4 • Týden 5',
          ),
          const SizedBox(height: 14),
          // TODO: schválit autorem — the source opens this day with no
          // introduction at all (OQ-6).
          const InfoBox(
            icon: Icons.schedule_outlined,
            title: 'Klidně po částech',
            text: day4Intro,
          ),
          const SizedBox(height: 20),
          const StructuredWorksheet(
            worksheetId: day4WorksheetId,
            sections: day4PreventionWorksheet,
            visibleSectionLimit: 2,
            revealMoreLabel: 'Zobrazit další sekce',
          ),
          const SizedBox(height: 16),
          // The source names the "krabička první psychické pomoci" itself; the
          // app's rescue package is that box, so the link is hers, not ours.
          _RescuePackageLink(onTap: () => const RescuePackageRoute().push<void>(context)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _RescuePackageLink extends StatelessWidget {
  const _RescuePackageLink({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : NepanikarColors.purple200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: 19,
              color: isDarkMode ? Colors.white : primaryColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Techniky i bezpečnostní plán najdeš v záchranném balíčku.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDarkMode ? Colors.white70 : primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
