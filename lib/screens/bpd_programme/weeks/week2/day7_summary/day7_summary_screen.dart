import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day7_summary/recap_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day7_summary/reflection_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_autosave.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/week_completion_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day7_summary_screen.g.dart';

@TypedGoRoute<Week2Day7SummaryScreenRoute>(path: '/bpd-programme/week/2/day/7')
class Week2Day7SummaryScreenRoute extends GoRouteData with $Week2Day7SummaryScreenRoute {
  const Week2Day7SummaryScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day7SummaryScreen();
}

/// Week 2, Day 7 — mindfulness week summary: recap → 4 free-text questions
/// (persisted) → week congratulations. Verbatim, source: tyzden-2.md §7.
class Week2Day7SummaryScreen extends StatefulWidget {
  const Week2Day7SummaryScreen({super.key});

  @override
  State<Week2Day7SummaryScreen> createState() => _Week2Day7SummaryScreenState();
}

class _Week2Day7SummaryScreenState extends State<Week2Day7SummaryScreen>
    with ReflectionAutosave<Week2Day7SummaryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;
  static const int _weekNumber = 2;

  static const _praise =
      'Gratulujeme k dokončení druhého týdne! Všímavost je dovednost, na které '
      'stojí všechny další — a ty už ji máš v rukou. Oceňujeme, že sis na sebe '
      'našel/a čas i ve dnech, kdy to nebylo úplně snadné. Příští týden '
      'budeme pokračovat dál.';

  final _controllers = List.generate(
    Week2ReflectionPage.questions.length,
    (_) => TextEditingController(),
  );

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void initState() {
    super.initState();
    initReflectionAutosave(weekNumber: _weekNumber, controllers: _controllers);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // Runs before the mixin's dispose, which only flushes cached strings.
    for (final c in _controllers) {
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

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _completeWeek() async {
    await saveReflectionNow();
    await _bpdDaysDao.markDayCompleted(_weekNumber, 7);
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
              onBack: _previousPage,
              onClose: () => context.pop(),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Week2RecapChatPage(onNext: _nextPage),
                  Week2ReflectionPage(controllers: _controllers, onNext: _nextPage),
                  WeekCompletionPage(
                    weekNumber: _weekNumber,
                    praise: _praise,
                    onComplete: _completeWeek,
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
