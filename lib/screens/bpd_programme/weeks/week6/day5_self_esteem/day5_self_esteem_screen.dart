import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day5_self_esteem/day5_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day5_self_esteem_screen.g.dart';

@TypedGoRoute<Week6Day5SelfEsteemScreenRoute>(path: '/bpd-programme/week/6/day/5')
class Week6Day5SelfEsteemScreenRoute extends GoRouteData
    with $Week6Day5SelfEsteemScreenRoute {
  const Week6Day5SelfEsteemScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week6Day5SelfEsteemScreen();
}

/// Week 6, Day 5 — sebeúcta. Verbatim, source: tyzden-6.md §5.
class Week6Day5SelfEsteemScreen extends StatefulWidget {
  const Week6Day5SelfEsteemScreen({super.key});

  @override
  State<Week6Day5SelfEsteemScreen> createState() => _Week6Day5SelfEsteemScreenState();
}

class _Week6Day5SelfEsteemScreenState extends State<Week6Day5SelfEsteemScreen> {
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
    await _bpdDaysDao.markDayCompleted(6, 5);
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
                  Week6Day5ChatPage(onNext: _goToNextPage),
                  Week6Day5NezoufejPage(onNext: _goToNextPage),
                  Week6Day5WorksheetPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 5,
                    summary: day5CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Zítra si dopřej volno a nech všechno, co se ti '
                          'povedlo, trochu doznít.',
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

/// Page 1/4 — what self-esteem is (education, chat).
class Week6Day5ChatPage extends StatelessWidget {
  const Week6Day5ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day5Opening.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day5Opening[i], showAvatar: i == 0)]),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.self_improvement,
              title: 'neZOUFej',
              text: day5SkillIntro,
            ),
          ],
          buttonLabel: 'Naučit se neZOUFej',
        ),
      ],
    );
  }
}

/// Page 2/4 — the neZOUFej acronym.
class Week6Day5NezoufejPage extends StatelessWidget {
  const Week6Day5NezoufejPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.shield_moon_outlined,
      title: 'neZOUFej',
      subtitle: 'Den 5 • Týden 6',
      letters: day5NezoufejLetters,
      rescueItem: BpdRescueItem(
        id: day5NezoufejRescueId,
        title: 'neZOUFej',
        description: day5NezoufejLetters
            .map((l) => '${l.$1} – ${l.$2}: ${l.$3}')
            .join('\n'),
        sourceLabel: 'Týden 6 • Den 5',
        savedAt: DateTime.now(),
        iconKey: 'shield',
      ),
      buttonText: 'Vyzkoušet na vlastní situaci',
      onNext: onNext,
    );
  }
}

/// Page 3/4 — the worksheet "neZOUFej – chráním své hranice".
class Week6Day5WorksheetPage extends StatelessWidget {
  const Week6Day5WorksheetPage({super.key, required this.onNext});

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
          // The source titles this "worksheet “neZOUFej” – chráním své hranice";
          // the app never puts the word "worksheet" in a header.
          const SectionHeader(
            icon: Icons.fence_outlined,
            title: 'neZOUFej – chráním své hranice',
            subtitle: 'Den 5 • Týden 6',
          ),
          const SizedBox(height: 14),
          Text(
            day5WorksheetLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
            ),
          ),
          const SizedBox(height: 18),
          const StructuredWorksheet(
            worksheetId: day5WorksheetId,
            sections: day5NezoufejWorksheet,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
