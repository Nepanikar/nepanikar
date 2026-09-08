import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week7/day1_appreciation/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/smart_goals_review.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_appreciation_screen.g.dart';

@TypedGoRoute<Week7Day1AppreciationScreenRoute>(path: '/bpd-programme/week/7/day/1')
class Week7Day1AppreciationScreenRoute extends GoRouteData
    with $Week7Day1AppreciationScreenRoute {
  const Week7Day1AppreciationScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week7Day1AppreciationScreen();
}

/// Week 7, Day 1 — ocenění. Verbatim, source: tyzden-7.md §1.
///
/// The only day in the programme that reads back what the user wrote six weeks
/// earlier: their SMART goals from Week 1 (GEN-02).
class Week7Day1AppreciationScreen extends StatefulWidget {
  const Week7Day1AppreciationScreen({super.key});

  @override
  State<Week7Day1AppreciationScreen> createState() =>
      _Week7Day1AppreciationScreenState();
}

class _Week7Day1AppreciationScreenState extends State<Week7Day1AppreciationScreen> {
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
    await _bpdDaysDao.markDayCompleted(7, 1);
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
                  Week7Day1ChatPage(onNext: _goToNextPage),
                  Week7Day1ProudPage(onNext: _goToNextPage),
                  Week7Day1SmartReviewPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Všímavost',
                      description:
                          'Vybereš si cvičení, které ti během programu '
                          'nejvíc sedlo, a zopakuješ si ho.',
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

/// Page 1/4 — the final week begins (education, chat).
class Week7Day1ChatPage extends StatelessWidget {
  const Week7Day1ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day1Opening.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: day1Opening[i], showAvatar: i == 0)],
            buttonLabel: i == day1Opening.length - 1 ? 'Pokračovat' : null,
          ),
      ],
    );
  }
}

/// Page 2/4 — three to five things to be proud of.
class Week7Day1ProudPage extends StatelessWidget {
  const Week7Day1ProudPage({super.key, required this.onNext});

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
            icon: Icons.emoji_events_outlined,
            title: 'Na co jsem pyšný/á',
            subtitle: 'Den 1 • Týden 7',
          ),
          const SizedBox(height: 14),
          Text(
            day1ProudLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
            ),
          ),
          const SizedBox(height: 18),
          const StructuredWorksheet(
            worksheetId: day1ProudWorksheetId,
            sections: day1ProudWorksheet,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 3/4 — the SMART goals from Week 1, six weeks on.
class Week7Day1SmartReviewPage extends StatelessWidget {
  const Week7Day1SmartReviewPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondary = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78);

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.flag_outlined,
            title: 'Moje SMART cíle',
            subtitle: 'Den 1 • Týden 7',
          ),
          const SizedBox(height: 14),
          Text(
            day1SmartLead,
            style: TextStyle(fontSize: 14, height: 1.55, color: secondary),
          ),
          const SizedBox(height: 14),
          // The author's reassurance sits above the goals, not below them: this
          // is the one page where someone meets what they promised themselves
          // and did not do.
          const InfoBox(
            icon: Icons.favorite_outline,
            title: day1SmartReassuranceTitle,
            text: day1SmartReassurance,
          ),
          const SizedBox(height: 14),
          Text(
            day1SmartTask,
            style: TextStyle(fontSize: 14, height: 1.55, color: secondary),
          ),
          const SizedBox(height: 18),
          const SmartGoalsReview(
            worksheetId: day1SmartWorksheetId,
            fieldLabel: day1SmartFieldLabel,
            emptyTitle: day1SmartEmptyTitle,
            emptyText: day1SmartEmpty,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
