import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/day4_content.dart'
    as week2_breathing;
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/day6_content.dart'
    as week2_techniques;
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_randomiser.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day4_mindfulness_stress_screen.g.dart';

@TypedGoRoute<Week4Day4MindfulnessScreenRoute>(path: '/bpd-programme/week/4/day/4')
class Week4Day4MindfulnessScreenRoute extends GoRouteData with $Week4Day4MindfulnessScreenRoute {
  const Week4Day4MindfulnessScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week4Day4MindfulnessScreen();
}

/// The eight named techniques of Week 2 — three breathing exercises (Day 4)
/// and five mindfulness techniques (Day 6). Reused verbatim, detail sheet and
/// rescue-package ids included, so a drawn technique behaves exactly as it did
/// when the user first met it.
final List<TechniqueData> week4DrawPool = [
  ...week2_breathing.week2Day4Techniques,
  ...week2_techniques.week2Day6Techniques,
];

/// Week 4, Day 4 — všímavost u stresu. Source: tyzden-4.md §4.
class Week4Day4MindfulnessScreen extends StatefulWidget {
  const Week4Day4MindfulnessScreen({super.key});

  @override
  State<Week4Day4MindfulnessScreen> createState() => _Week4Day4MindfulnessScreenState();
}

class _Week4Day4MindfulnessScreenState extends State<Week4Day4MindfulnessScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;

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
    await _bpdDaysDao.markDayCompleted(4, 4);
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
                  Week4Day4ChatPage(onNext: _goToNextPage),
                  Week4Day4DrawPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 4,
                    summary: day4CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Techniky pro zvládnutí okamžiku krize',
                      description:
                          'UZNÁVÁM — sedm drobných triků, které odvedou '
                          'pozornost, dokud bouře neodezní.',
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

/// Page 1/3 — mindfulness applied to stress.
class Week4Day4ChatPage extends StatelessWidget {
  const Week4Day4ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: day4OpeningChat, showAvatar: true)]),
        ChatStep(
          messages: [
            ChatFeatureList(
              caption: 'Jak všímavost pomáhá',
              items: [
                ChatFeatureItem(
                  icon: Icons.pause_circle_outline,
                  title: day4AcuteTitle,
                  description: day4AcuteBody,
                ),
                ChatFeatureItem(
                  icon: Icons.trending_up,
                  title: day4LongTermTitle,
                  description: day4LongTermBody,
                ),
              ],
            ),
          ],
          buttonLabel: 'Připomenout si techniku',
        ),
      ],
    );
  }
}

/// Page 2/3 — draw one Week 2 technique.
class Week4Day4DrawPage extends StatelessWidget {
  const Week4Day4DrawPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75);

    return DayPageBase(
      // Not "Hotovo" — the day is complete whether or not the drawn technique
      // was actually done.
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(
            icon: Icons.casino_outlined,
            title: 'Připomeňme si techniku',
            subtitle: 'Den 4 • Týden 4',
          ),
          const SizedBox(height: 18),
          Text(
            day4RecallInvitation,
            style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
          ),
          const SizedBox(height: 20),
          TechniqueRandomiser(
            techniques: week4DrawPool,
            sourceLabel: 'Týden 2 • připomenuto ve 4. týdnu',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
