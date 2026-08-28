import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/day5_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/uznavam_checklist_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day5_uznavam_screen.g.dart';

@TypedGoRoute<Week4Day5UznavamScreenRoute>(path: '/bpd-programme/week/4/day/5')
class Week4Day5UznavamScreenRoute extends GoRouteData with $Week4Day5UznavamScreenRoute {
  const Week4Day5UznavamScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week4Day5UznavamScreen();
}

/// Week 4, Day 5 — techniky pro zvládnutí okamžiku krize. Source: tyzden-4.md §5.
///
/// Chat intro → the seven tricks → the 22-item checklist over two pages →
/// completion.
class Week4Day5UznavamScreen extends StatefulWidget {
  const Week4Day5UznavamScreen({super.key});

  @override
  State<Week4Day5UznavamScreen> createState() => _Week4Day5UznavamScreenState();
}

class _Week4Day5UznavamScreenState extends State<Week4Day5UznavamScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 5;

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
    await _bpdDaysDao.markDayCompleted(4, 5);
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
                  Week4Day5IntroChatPage(onNext: _goToNextPage),
                  AcronymSkillPage(
                    icon: Icons.auto_awesome_outlined,
                    title: 'UZNÁVÁM',
                    subtitle: 'Den 5 • Týden 4',
                    letters: day5Letters,
                    rescueItem: BpdRescueItem(
                      id: 'week4_uznavam',
                      title: 'UZNÁVÁM',
                      description: day5Letters.map((l) => '${l.$1} – ${l.$2}: ${l.$3}').join('\n'),
                      sourceLabel: 'Týden 4 • Den 5',
                      savedAt: DateTime.now(),
                      iconKey: 'sparkle',
                    ),
                    buttonText: 'Přejít na cvičení',
                    onNext: _goToNextPage,
                  ),
                  UznavamChecklistPage(
                    title: 'Cvičení UZNÁVÁM',
                    groups: day5GroupsPart1,
                    onNext: _goToNextPage,
                  ),
                  UznavamChecklistPage(
                    title: 'Cvičení UZNÁVÁM',
                    groups: day5GroupsPart2,
                    showLead: false,
                    onNext: _goToNextPage,
                  ),
                  DayCompletionPage(
                    dayNumber: 5,
                    summary: day5CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Zítra volnější den bez programu — máš za sebou '
                          'opravdu velký kus práce.',
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

/// Page 1/5 — why distraction is a legitimate move, not avoidance.
class Week4Day5IntroChatPage extends StatelessWidget {
  const Week4Day5IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final (index, message) in day5IntroChat.indexed)
          ChatStep(
            messages: [ChatBotBubble(text: message, showAvatar: true)],
            buttonLabel: index == day5IntroChat.length - 1 ? 'Ukázat UZNÁVÁM' : null,
          ),
      ],
    );
  }
}
