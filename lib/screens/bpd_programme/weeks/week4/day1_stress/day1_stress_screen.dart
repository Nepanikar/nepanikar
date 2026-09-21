import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day1_stress/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_stress_screen.g.dart';

@TypedGoRoute<Week4Day1StressScreenRoute>(path: '/bpd-programme/week/4/day/1')
class Week4Day1StressScreenRoute extends GoRouteData with $Week4Day1StressScreenRoute {
  const Week4Day1StressScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week4Day1StressScreen();
}

/// Week 4, Day 1 — edukace o stresu. Verbatim, source: tyzden-4.md §1.
///
/// Education only, so the whole day is one chat flow plus the closing page.
class Week4Day1StressScreen extends StatefulWidget {
  const Week4Day1StressScreen({super.key});

  @override
  State<Week4Day1StressScreen> createState() => _Week4Day1StressScreenState();
}

class _Week4Day1StressScreenState extends State<Week4Day1StressScreen> {
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
    await _bpdDaysDao.markDayCompleted(4, 1);
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
                  Week4Day1ChatPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Dovednosti pro překonání krize',
                      description:
                          'Dva nástroje, které se dají použít hned, když je '
                          'toho moc — STOP a TIPS.',
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

/// Page 1/2 — the whole lesson as one chat flow.
class Week4Day1ChatPage extends StatelessWidget {
  const Week4Day1ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in day1OpeningChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.bolt_outlined,
              title: day1DistressTitle,
              text: day1DistressBody,
            ),
          ],
        ),
        // Normalisation before definition: the source puts "this is human"
        // straight after naming distress, and that order is the point.
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.favorite_outline,
              title: day1NotWeaknessTitle,
              text: day1NotWeaknessBody,
            ),
          ],
        ),
        for (final message in day1ClosingChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatLinksCard(
              caption: 'Chci vědět víc',
              links: [
                ChatLink(
                  label: 'Video o stresu',
                  url: day1VideoUrl,
                  icon: Icons.play_circle_outline,
                ),
              ],
            ),
          ],
          buttonLabel: 'Dokončit čtení',
        ),
      ],
    );
  }
}
