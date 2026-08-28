import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day4_opposite_action/day4_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day4_opposite_action_screen.g.dart';

@TypedGoRoute<Week3Day4OppositeActionScreenRoute>(path: '/bpd-programme/week/3/day/4')
class Week3Day4OppositeActionScreenRoute extends GoRouteData
    with $Week3Day4OppositeActionScreenRoute {
  const Week3Day4OppositeActionScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day4OppositeActionScreen();
}

/// Week 3, Day 4 — opačná akce. Verbatim, source: tyzden-3.md §4.
///
/// A reading-only day, so the whole thing is one chat flow: the technique, the
/// boundary on when *not* to use it, the three levels, and practising in small
/// steps. Two pages only — the chat and the closing page.
class Week3Day4OppositeActionScreen extends StatefulWidget {
  const Week3Day4OppositeActionScreen({super.key});

  @override
  State<Week3Day4OppositeActionScreen> createState() => _Week3Day4OppositeActionScreenState();
}

class _Week3Day4OppositeActionScreenState extends State<Week3Day4OppositeActionScreen> {
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
    await _bpdDaysDao.markDayCompleted(3, 4);
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
                  Day4ChatPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 4,
                    summary: day4CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Když to, co děláte, nefunguje',
                      description:
                          'Návrat k základům — připomeneme si SPOKO '
                          'dovednosti z prvního týdne.',
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

/// Page 1/2 — the whole day as one chat flow.
class Day4ChatPage extends StatelessWidget {
  const Day4ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in day4IntroChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        // The boundary comes immediately after the technique is named, never
        // after the three levels — by then the user may already be planning
        // to override a fear that is doing its job.
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.shield_outlined,
              title: day4WarningTitle,
              text: day4WarningBody,
            ),
          ],
          buttonLabel: 'Tři roviny',
        ),
        for (final (title, body) in day4Levels)
          ChatStep(
            messages: [ChatConceptCard(badge: 'ROVINA', title: title, body: body)],
          ),
        const ChatStep(
          messages: [
            ChatInfoCard(icon: Icons.flag_outlined, title: 'Cíl', text: day4GoalNote),
          ],
        ),
        const ChatStep(
          messages: [
            ChatConceptCard(
              badge: 'JAK NA TO',
              title: day4SmallStepsTitle,
              body: day4SmallStepsBody,
            ),
          ],
          buttonLabel: 'Dokončit čtení',
        ),
      ],
    );
  }
}
