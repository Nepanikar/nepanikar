import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/day6_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day6_techniques_screen.g.dart';

@TypedGoRoute<Week2Day6TechniquesScreenRoute>(path: '/bpd-programme/week/2/day/6')
class Week2Day6TechniquesScreenRoute extends GoRouteData with $Week2Day6TechniquesScreenRoute {
  const Week2Day6TechniquesScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day6TechniquesScreen();
}

/// Week 2, Day 6 — mindfulness techniques offered as a menu: pick one to try
/// today, keep the rest for later or save them into the rescue package.
/// Source: §6.
class Week2Day6TechniquesScreen extends StatefulWidget {
  const Week2Day6TechniquesScreen({super.key});

  @override
  State<Week2Day6TechniquesScreen> createState() => _Week2Day6TechniquesScreenState();
}

class _Week2Day6TechniquesScreenState extends State<Week2Day6TechniquesScreen> {
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
    await _bpdDaysDao.markDayCompleted(2, 6);
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
                  TechniqueMenuPage(
                    title: 'Techniky všímavosti',
                    dayLabel: 'Den 6 • Týden 2',
                    leadParagraphs: const ['Dnes rozšíříme naši znalost všímavých technik.'],
                    pickLead:
                        'Můžeš si vybrat jedno cvičení z nabídky, které dnes '
                        'vyzkoušíš. Zbytek si můžeš nechat na jindy.',
                    techniques: week2Day6Techniques,
                    sourceLabel: 'Techniky všímavosti',
                    closingNote:
                        'Cvičení, které si chceš nechat po ruce, si ulož do '
                        'záchranného balíčku.',
                    onNext: _goToNextPage,
                  ),
                  DayCompletionPage(
                    dayNumber: 6,
                    summary:
                        'Máš v rukou pět technik všímavosti. Nemusíš zvládnout '
                        'všechny – stačí ta jedna, která ti dnes sedla.',
                    nextDay: const NextDayTeaser(
                      title: 'Shrnutí týdne',
                      description: 'Zítra se ohlédneme za celým týdnem všímavosti.',
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
