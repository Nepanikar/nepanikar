import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_mindfulness_stress_screen.dart'
    show week4DrawPool;
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day3_je_vyzva/day3_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day3_je_vyzva_screen.g.dart';

@TypedGoRoute<Week6Day3JeVyzvaScreenRoute>(path: '/bpd-programme/week/6/day/3')
class Week6Day3JeVyzvaScreenRoute extends GoRouteData with $Week6Day3JeVyzvaScreenRoute {
  const Week6Day3JeVyzvaScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week6Day3JeVyzvaScreen();
}

/// Week 6, Day 3 — Je VýZVa a všímavost ve vztazích. Source: tyzden-6.md §3.
///
/// Two topics in one day, so two content pages: the acronym first, then
/// mindfulness applied to relationships and a menu of Week 2's techniques.
class Week6Day3JeVyzvaScreen extends StatefulWidget {
  const Week6Day3JeVyzvaScreen({super.key});

  @override
  State<Week6Day3JeVyzvaScreen> createState() => _Week6Day3JeVyzvaScreenState();
}

class _Week6Day3JeVyzvaScreenState extends State<Week6Day3JeVyzvaScreen> {
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
    await _bpdDaysDao.markDayCompleted(6, 3);
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
                  Week6Day3JeVyzvaPage(onNext: _goToNextPage),
                  Week6Day3MindfulnessChatPage(onNext: _goToNextPage),
                  // The source says "vybrat z nabídky" and "Vyber to, které ti
                  // nejvíc vyhovuje" — a menu, not the draw Week 5 asked for.
                  TechniqueMenuPage(
                    title: 'Všímavost ve vztazích',
                    dayLabel: 'Den 3 • Týden 6',
                    pickLead: day3PickInvitation,
                    techniques: week4DrawPool,
                    sourceLabel: 'Týden 2 • připomenuto v 6. týdnu',
                    onNext: _goToNextPage,
                  ),
                  DayCompletionPage(
                    dayNumber: 3,
                    summary: day3CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description: 'Zítra si dáme od programu volno.',
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

/// Page 1/4 — the Je VýZVa acronym.
class Week6Day3JeVyzvaPage extends StatelessWidget {
  const Week6Day3JeVyzvaPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.volunteer_activism_outlined,
      title: 'Je VýZVa',
      subtitle: 'Den 3 • Týden 6',
      leadParagraphs: day3JeVyzvaIntro,
      letters: day3JeVyzvaLetters,
      rescueItem: BpdRescueItem(
        id: day3JeVyzvaRescueId,
        title: 'Je VýZVa',
        description: day3JeVyzvaLetters
            .map((l) => '${l.$1} – ${l.$2}: ${l.$3}')
            .join('\n'),
        sourceLabel: 'Týden 6 • Den 3',
        savedAt: DateTime.now(),
        iconKey: 'heart',
      ),
      onNext: onNext,
    );
  }
}

/// Page 2/4 — mindfulness in relationships (education, chat).
class Week6Day3MindfulnessChatPage extends StatelessWidget {
  const Week6Day3MindfulnessChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day3MindfulnessIntro.length; i++)
          ChatStep(
            messages: [
              ChatBotBubble(text: day3MindfulnessIntro[i], showAvatar: i == 0),
            ],
            buttonLabel: i == day3MindfulnessIntro.length - 1 ? 'Vybrat cvičení' : null,
          ),
      ],
    );
  }
}
