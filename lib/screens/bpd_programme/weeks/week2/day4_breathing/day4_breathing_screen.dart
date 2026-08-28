import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/day4_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/intro_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/reminder_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day4_breathing_screen.g.dart';

@TypedGoRoute<Week2Day4BreathingScreenRoute>(path: '/bpd-programme/week/2/day/4')
class Week2Day4BreathingScreenRoute extends GoRouteData with $Week2Day4BreathingScreenRoute {
  const Week2Day4BreathingScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week2Day4BreathingScreen();
}

/// Week 2, Day 4 — mindful breathing offered as a menu (each option can launch
/// the app's breathing exercise or its guided video and be saved into the rescue
/// package), plus the daily mindfulness reminder. Source: §4.
class Week2Day4BreathingScreen extends StatefulWidget {
  const Week2Day4BreathingScreen({super.key});

  @override
  State<Week2Day4BreathingScreen> createState() => _Week2Day4BreathingScreenState();
}

class _Week2Day4BreathingScreenState extends State<Week2Day4BreathingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 4;

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
    await _bpdDaysDao.markDayCompleted(2, 4);
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
                  Week2Day4IntroChatPage(onNext: _goToNextPage),
                  TechniqueMenuPage(
                    title: 'Všímavé dýchání',
                    dayLabel: 'Den 4 • Týden 2',
                    pickLead: 'Teď si můžeš vybrat z několika možností dechových cvičení.',
                    techniques: week2Day4Techniques,
                    sourceLabel: 'Všímavé dýchání',
                    closingNote:
                        'Ke zbylým cvičením se můžeš kdykoliv vrátit nebo si je '
                        'uložit do záchranného balíčku.',
                    onNext: _goToNextPage,
                  ),
                  ReminderPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 4,
                    summary:
                        'Vyzkoušel/a jsi dechové cvičení a víš, kde ho najdeš '
                        'příště. Dech máš u sebe vždycky – i ve chvílích, kdy '
                        'se toho děje moc.',
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Zítra si dáme od programu pauzu. Stačí zaznamenat '
                          'náladu a načerpat síly.',
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
