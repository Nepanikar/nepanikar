import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day2_communication/day2_content.dart';
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

part 'day2_communication_screen.g.dart';

@TypedGoRoute<Week6Day2CommunicationScreenRoute>(path: '/bpd-programme/week/6/day/2')
class Week6Day2CommunicationScreenRoute extends GoRouteData
    with $Week6Day2CommunicationScreenRoute {
  const Week6Day2CommunicationScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week6Day2CommunicationScreen();
}

/// Week 6, Day 2 — dovednosti pro komunikaci. Verbatim, source: tyzden-6.md §2.
class Week6Day2CommunicationScreen extends StatefulWidget {
  const Week6Day2CommunicationScreen({super.key});

  @override
  State<Week6Day2CommunicationScreen> createState() =>
      _Week6Day2CommunicationScreenState();
}

class _Week6Day2CommunicationScreenState extends State<Week6Day2CommunicationScreen> {
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
    await _bpdDaysDao.markDayCompleted(6, 2);
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
                  Week6Day2ChatPage(onNext: _goToNextPage),
                  Week6Day2PsanickoPage(onNext: _goToNextPage),
                  Week6Day2WorksheetPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 2,
                    summary: day2CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Je VýZVa a všímavost ve vztazích',
                      description:
                          'Jak zůstat laskavý/á a pozorný/á i ve chvíli, kdy '
                          'jsi rozrušený/á.',
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

/// Page 1/4 — why communication skills (education, chat).
class Week6Day2ChatPage extends StatelessWidget {
  const Week6Day2ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day2Opening.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day2Opening[i], showAvatar: i == 0)]),
        for (var i = 0; i < day2Intro.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: day2Intro[i], showAvatar: i == 0)],
            buttonLabel: i == day2Intro.length - 1 ? 'Naučit se PSANÍČKo' : null,
          ),
      ],
    );
  }
}

/// Page 2/4 — the acronym itself.
class Week6Day2PsanickoPage extends StatelessWidget {
  const Week6Day2PsanickoPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.forum_outlined,
      title: 'PSANÍČKo',
      subtitle: 'Den 2 • Týden 6',
      letters: day2PsanickoLetters,
      // The source's closing sentence belongs under the last letter, not above
      // the first — it summarises what the whole acronym is for.
      afterLetter: {'Ko': const _ClosingNote(text: day2PsanickoClosing)},
      rescueItem: BpdRescueItem(
        id: day2PsanickoRescueId,
        title: 'PSANÍČKo',
        description: day2PsanickoLetters.map((l) => '${l.$1} – ${l.$2}: ${l.$3}').join('\n'),
        sourceLabel: 'Týden 6 • Den 2',
        savedAt: DateTime.now(),
        iconKey: 'talk',
      ),
      buttonText: 'Vyzkoušet na vlastní situaci',
      onNext: onNext,
    );
  }
}

/// Page 3/4 — the worksheet, with the author's worked example.
class Week6Day2WorksheetPage extends StatelessWidget {
  const Week6Day2WorksheetPage({super.key, required this.onNext});

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
          // Not "Worksheet PSANÍČKo": the app never puts the word worksheet in
          // a header (Day 5 drops it too), and "v praxi" also keeps this page
          // distinct from the acronym page, which is titled just "PSANÍČKo".
          const SectionHeader(
            icon: Icons.edit_note_outlined,
            title: 'PSANÍČKo v praxi',
            subtitle: 'Den 2 • Týden 6',
          ),
          const SizedBox(height: 14),
          Text(
            day2WorksheetLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
            ),
          ),
          const SizedBox(height: 18),
          const StructuredWorksheet(
            worksheetId: day2WorksheetId,
            sections: day2PsanickoWorksheet,
            example: day2PsanickoExample,
            exampleTitle: 'Zobrazit vzor',
            // No exampleNote: this example is the author's, not ours.
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// The sentence the source hangs under the acronym.
class _ClosingNote extends StatelessWidget {
  const _ClosingNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
      ),
    );
  }
}
