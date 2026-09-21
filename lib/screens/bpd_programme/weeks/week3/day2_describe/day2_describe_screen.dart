import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day2_describe/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day2_describe/day2_pages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_describe_screen.g.dart';

@TypedGoRoute<Week3Day2DescribeScreenRoute>(path: '/bpd-programme/week/3/day/2')
class Week3Day2DescribeScreenRoute extends GoRouteData with $Week3Day2DescribeScreenRoute {
  const Week3Day2DescribeScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day2DescribeScreen();
}

/// Week 3, Day 2 — Validace a popis emocí. Verbatim, source: tyzden-3.md §2.
///
/// Why naming helps (chat) → the six-step model → the model applied to the
/// user's own situation → what validation is → five sentence frames →
/// completion.
class Week3Day2DescribeScreen extends StatefulWidget {
  const Week3Day2DescribeScreen({super.key});

  @override
  State<Week3Day2DescribeScreen> createState() => _Week3Day2DescribeScreenState();
}

class _Week3Day2DescribeScreenState extends State<Week3Day2DescribeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 6;

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
    await _bpdDaysDao.markDayCompleted(3, 2);
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
                  Day2IntroChatPage(onNext: _goToNextPage),
                  Day2ModelPage(onNext: _goToNextPage),
                  Day2WorksheetPage(onNext: _goToNextPage),
                  Day2ValidationPage(onNext: _goToNextPage),
                  Day2StemsPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 2,
                    summary: day2CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Ověřování faktů',
                      description:
                          'Mezi událostí a emocí stojí myšlenka. Když ověříme '
                          'fakta, můžeme změnit i to, co cítíme.',
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
