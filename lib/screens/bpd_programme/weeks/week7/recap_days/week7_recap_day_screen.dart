import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week7/recap_days/recap_day_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'week7_recap_day_screen.g.dart';

// Days 2–6 of Week 7 are one screen with five sets of data, not five screens:
// they differ only in the recap text and which skills the menu offers. Same
// approach as Week 1's SPOKO days.

@TypedGoRoute<Week7Day2MindfulnessScreenRoute>(path: '/bpd-programme/week/7/day/2')
class Week7Day2MindfulnessScreenRoute extends GoRouteData
    with $Week7Day2MindfulnessScreenRoute {
  const Week7Day2MindfulnessScreenRoute();

  @override
  Widget build(BuildContext context, _) => Week7RecapDayScreen(data: week7Day2);
}

@TypedGoRoute<Week7Day3EmotionsScreenRoute>(path: '/bpd-programme/week/7/day/3')
class Week7Day3EmotionsScreenRoute extends GoRouteData
    with $Week7Day3EmotionsScreenRoute {
  const Week7Day3EmotionsScreenRoute();

  @override
  Widget build(BuildContext context, _) => Week7RecapDayScreen(data: week7Day3);
}

@TypedGoRoute<Week7Day4DistressScreenRoute>(path: '/bpd-programme/week/7/day/4')
class Week7Day4DistressScreenRoute extends GoRouteData
    with $Week7Day4DistressScreenRoute {
  const Week7Day4DistressScreenRoute();

  @override
  Widget build(BuildContext context, _) => Week7RecapDayScreen(data: week7Day4);
}

@TypedGoRoute<Week7Day5ImpulsivityScreenRoute>(path: '/bpd-programme/week/7/day/5')
class Week7Day5ImpulsivityScreenRoute extends GoRouteData
    with $Week7Day5ImpulsivityScreenRoute {
  const Week7Day5ImpulsivityScreenRoute();

  @override
  Widget build(BuildContext context, _) => Week7RecapDayScreen(data: week7Day5);
}

@TypedGoRoute<Week7Day6RelationshipsScreenRoute>(path: '/bpd-programme/week/7/day/6')
class Week7Day6RelationshipsScreenRoute extends GoRouteData
    with $Week7Day6RelationshipsScreenRoute {
  const Week7Day6RelationshipsScreenRoute();

  @override
  Widget build(BuildContext context, _) => Week7RecapDayScreen(data: week7Day6);
}

/// Week 7, Days 2–6 — look back at one module, then pick something to practise.
///
/// Source: tyzden-7.md §2–§6.
class Week7RecapDayScreen extends StatefulWidget {
  const Week7RecapDayScreen({super.key, required this.data});

  final Week7RecapDay data;

  @override
  State<Week7RecapDayScreen> createState() => _Week7RecapDayScreenState();
}

class _Week7RecapDayScreenState extends State<Week7RecapDayScreen> {
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
    await _bpdDaysDao.markDayCompleted(7, widget.data.dayNumber);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final data = widget.data;

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
                  ChatDayPage(
                    onCompleted: _goToNextPage,
                    steps: [
                      for (var i = 0; i < data.recapParagraphs.length; i++)
                        ChatStep(
                          messages: [
                            ChatBotBubble(
                              text: data.recapParagraphs[i],
                              showAvatar: i == 0,
                            ),
                          ],
                          buttonLabel: i == data.recapParagraphs.length - 1
                              ? 'Vybrat si nástroj'
                              : null,
                        ),
                    ],
                  ),
                  TechniqueMenuPage(
                    title: data.title,
                    dayLabel: data.dayLabel,
                    pickLead: data.pickLead,
                    techniques: data.techniques,
                    sourceLabel: data.sourceLabel,
                    onNext: _goToNextPage,
                  ),
                  DayCompletionPage(
                    dayNumber: data.dayNumber,
                    summary: data.completionText,
                    nextDay: data.nextDay,
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
