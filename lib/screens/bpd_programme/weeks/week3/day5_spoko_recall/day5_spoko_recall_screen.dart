import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/spoko_recall.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day5_spoko_recall_screen.g.dart';

@TypedGoRoute<Week3Day5SpokoRecallScreenRoute>(path: '/bpd-programme/week/3/day/5')
class Week3Day5SpokoRecallScreenRoute extends GoRouteData with $Week3Day5SpokoRecallScreenRoute {
  const Week3Day5SpokoRecallScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day5SpokoRecallScreen();
}

/// Week 3, Day 5 — "Když to, co děláte, nefunguje". Source: tyzden-3.md §5.
///
/// The source is one line: remind yourself of your SPOKO skills. Confirmed with
/// the author (2026-08-06) that this is deliberately short, so the day reuses
/// the Week 1 recall exercise and links to the challenges the user already set
/// themselves rather than inventing new content.
class Week3Day5SpokoRecallScreen extends StatefulWidget {
  const Week3Day5SpokoRecallScreen({super.key});

  @override
  State<Week3Day5SpokoRecallScreen> createState() => _Week3Day5SpokoRecallScreenState();
}

class _Week3Day5SpokoRecallScreenState extends State<Week3Day5SpokoRecallScreen> {
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
    await _bpdDaysDao.markDayCompleted(3, 5);
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
                  Day5RecallPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 5,
                    // TODO: schválit autorem — zdroj u Dne 5 závěrečnou větu nemá.
                    summary:
                        'Když dovednosti nezabírají, bývá to tělo, ne slabá '
                        'vůle. Spánek, jídlo, pohyb a léčba jsou základ, na '
                        'kterém všechno ostatní stojí.',
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description: 'Zítra program vynecháme. Zasloužíš si chvilku odpočinku.',
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

/// Page 1/2 — recall the SPOKO areas, then jump to your own challenges.
class Day5RecallPage extends StatelessWidget {
  const Day5RecallPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.health_and_safety_outlined,
            title: 'Když to, co děláš, nefunguje',
          ),
          const SizedBox(height: 12),
          Text(
            'Někdy dovednosti prostě nezabírají. Nebývá to proto, že bys je '
            'dělal/a špatně — často je pod tím tělo, které nemá základy. '
            'Zkusíš si připomenout svoje SPOKO dovednosti z prvního týdne?',
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 18),
          const SpokoRecallList(),
          const SizedBox(height: 12),
          const InfoBox(
            icon: Icons.flag_outlined,
            title: 'Tvoje výzvy',
            text:
                'V Mých záznamech máš uložené výzvy, které sis k jednotlivým '
                'oblastem zadal/a v prvním týdnu. Mrkni, jak na tom jsou.',
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.push(const MyChallengesRoute().location),
              icon: const Icon(Icons.flag_outlined, size: 18),
              label: const Text('Otevřít Moje výzvy'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.4)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
