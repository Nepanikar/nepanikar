import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week6/day1_relationships/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_relationships_screen.g.dart';

@TypedGoRoute<Week6Day1RelationshipsScreenRoute>(path: '/bpd-programme/week/6/day/1')
class Week6Day1RelationshipsScreenRoute extends GoRouteData
    with $Week6Day1RelationshipsScreenRoute {
  const Week6Day1RelationshipsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week6Day1RelationshipsScreen();
}

/// Week 6, Day 1 — edukace o vztazích. Verbatim, source: tyzden-6.md §1.
///
/// Education, then the author's two groups of twelve myths. The groups are two
/// pages rather than one: twenty-four negative statements about yourself in a
/// single scroll is a lot to sit with.
class Week6Day1RelationshipsScreen extends StatefulWidget {
  const Week6Day1RelationshipsScreen({super.key});

  @override
  State<Week6Day1RelationshipsScreen> createState() =>
      _Week6Day1RelationshipsScreenState();
}

class _Week6Day1RelationshipsScreenState extends State<Week6Day1RelationshipsScreen> {
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
    await _bpdDaysDao.markDayCompleted(6, 1);
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
                  Week6Day1EducationPage(onNext: _goToNextPage),
                  Week6MythsPage(
                    title: day1NeedsMythsTitle,
                    worksheetId: day1NeedsWorksheetId,
                    myths: day1NeedsMyths,
                    onNext: _goToNextPage,
                  ),
                  Week6MythsPage(
                    title: day1RelationshipsMythsTitle,
                    worksheetId: day1RelationshipsWorksheetId,
                    myths: day1RelationshipsMyths,
                    onNext: _goToNextPage,
                  ),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Dovednosti pro komunikaci s druhými',
                      description:
                          'PSANÍČKo — postup, jak říct co potřebuješ tak, aby '
                          'to druhý slyšel.',
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

/// Page 1/4 — why relationships, and why myths get in the way.
class Week6Day1EducationPage extends StatelessWidget {
  const Week6Day1EducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day1Opening.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day1Opening[i], showAvatar: i == 0)]),
        for (var i = 0; i < day1Effectiveness.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: day1Effectiveness[i], showAvatar: i == 0)],
          ),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.psychology_alt_outlined,
              title: day1MythsBridgeTitle,
              text: day1MythsBridge,
            ),
          ],
        ),
        const ChatStep(
          messages: [ChatBotBubble(text: day1MythsInvitation, showAvatar: true)],
          buttonLabel: 'Podívat se na mýty',
        ),
      ],
    );
  }
}

/// Pages 2/4 and 3/4 — one of the author's two myth groups.
///
/// The myths render through [WorksheetSectionStyle.myth]: a muted, quoted card
/// under a "MÝTUS" label, so nothing about the page reads as the app agreeing
/// with statements like "Jen slaboši mají hodnoty".
class Week6MythsPage extends StatelessWidget {
  const Week6MythsPage({
    super.key,
    required this.title,
    required this.worksheetId,
    required this.myths,
    required this.onNext,
  });

  final String title;
  final String worksheetId;
  final List<String> myths;
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
            icon: Icons.construction_outlined,
            title: 'Boření mýtů',
            subtitle: 'Den 1 • Týden 6',
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.4,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 18),
          StructuredWorksheet(
            worksheetId: worksheetId,
            visibleSectionLimit: day1MythsOfferedCount,
            revealMoreLabel: day1MythsRevealLabel,
            sections: [
              for (var i = 0; i < myths.length; i++)
                WorksheetSection(
                  title: myths[i],
                  style: WorksheetSectionStyle.myth,
                  fields: [WorksheetField(id: 'myth_$i', label: day1MythFieldLabel)],
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
