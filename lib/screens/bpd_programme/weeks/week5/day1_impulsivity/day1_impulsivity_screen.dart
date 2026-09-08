import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week5/day1_impulsivity/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/missing_links_analysis.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day1_impulsivity_screen.g.dart';

@TypedGoRoute<Week5Day1ImpulsivityScreenRoute>(path: '/bpd-programme/week/5/day/1')
class Week5Day1ImpulsivityScreenRoute extends GoRouteData
    with $Week5Day1ImpulsivityScreenRoute {
  const Week5Day1ImpulsivityScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week5Day1ImpulsivityScreen();
}

/// Week 5, Day 1 — edukace o impulzivitě. Verbatim, source: tyzden-5.md §1.
///
/// The densest day of the programme: ten education bullets, a six-step model, a
/// seven-field worksheet and a branching analysis. Five pages, so no single one
/// is a wall of text.
class Week5Day1ImpulsivityScreen extends StatefulWidget {
  const Week5Day1ImpulsivityScreen({super.key});

  @override
  State<Week5Day1ImpulsivityScreen> createState() => _Week5Day1ImpulsivityScreenState();
}

class _Week5Day1ImpulsivityScreenState extends State<Week5Day1ImpulsivityScreen> {
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
    await _bpdDaysDao.markDayCompleted(5, 1);
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
                  Week5Day1EducationPage(onNext: _goToNextPage),
                  Week5Day1AnalysisPage(onNext: _goToNextPage),
                  Week5Day1ChainWorksheetPage(onNext: _goToNextPage),
                  Week5Day1MissingLinksPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 1,
                    summary: day1CompletionText,
                    nextDay: const NextDayTeaser(
                      // Ours. The day's own title is "Život ohrožující chování",
                      // which is a hard thing to meet as a teaser with no context
                      // — so the teaser leads with the fact that it is optional
                      // (WEEK5_SCREEN_PLAN.md → OQ-12).
                      // TODO: schválit autorem
                      title: 'Citlivé téma — dobrovolně',
                      description:
                          'Zítřek je o život ohrožujícím chování. Je dobrovolný '
                          'a můžeš ho kdykoliv přeskočit.',
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

/// Page 1/5 — what impulsivity is (education, chat).
class Week5Day1EducationPage extends StatelessWidget {
  const Week5Day1EducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day1Opening.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day1Opening[i], showAvatar: i == 0)]),
        for (final message in day1Causes)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatBotBubble(text: day1BrainLead, showAvatar: true),
            ChatFeatureList(
              caption: 'Dvě části mozku',
              items: [
                ChatFeatureItem(
                  icon: Icons.psychology_outlined,
                  title: day1PrefrontalCortex,
                  description: day1PrefrontalCortexBody,
                ),
                ChatFeatureItem(
                  icon: Icons.warning_amber_outlined,
                  title: day1Amygdala,
                  description: day1AmygdalaBody,
                ),
              ],
            ),
          ],
        ),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.favorite_outline,
              title: day1NotWeaknessTitle,
              text: day1NotWeakness,
            ),
          ],
        ),
        const ChatStep(
          messages: [ChatBotBubble(text: day1UnderstandingTriggers, showAvatar: true)],
          buttonLabel: 'Pokračovat',
        ),
      ],
    );
  }
}

/// Page 2/5 — behaviour analysis and the challenge (education, chat).
class Week5Day1AnalysisPage extends StatelessWidget {
  const Week5Day1AnalysisPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day1AnalysisIntro.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day1AnalysisIntro[i], showAvatar: i == 0)]),
        // The six steps arrive numbered because the worksheet on the next page
        // asks for them in exactly this order.
        const ChatStep(
          messages: [ChatNumberedList(caption: 'Analýza chování', items: day1AnalysisSteps)],
        ),
        const ChatStep(messages: [ChatBotBubble(text: day1AnalysisGoal, showAvatar: true)]),
        const ChatStep(
          messages: [ChatInfoCard(icon: Icons.flag_outlined, title: 'Výzva', text: day1Challenge)],
          buttonLabel: 'Otevřít worksheet',
        ),
      ],
    );
  }
}

/// Page 3/5 — the seven-step chain analysis (worksheet).
class Week5Day1ChainWorksheetPage extends StatelessWidget {
  const Week5Day1ChainWorksheetPage({super.key, required this.onNext});

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
            icon: Icons.timeline_outlined,
            title: 'Řetězová analýza',
            subtitle: 'Den 1 • Týden 5',
          ),
          const SizedBox(height: 14),
          const InfoBox(
            icon: Icons.schedule_outlined,
            title: 'Klidně po částech',
            text: day1WorksheetPermission,
          ),
          const SizedBox(height: 20),
          const StructuredWorksheet(
            worksheetId: day1WorksheetId,
            sections: day1ChainWorksheet,
            // Seven open fields at once reads as a questionnaire; the rest are
            // one tap away and are saved either way.
            visibleSectionLimit: 3,
            revealMoreLabel: 'Zobrazit zbývající kroky',
          ),
          const SizedBox(height: 20),
          Text(
            day1WorksheetClosing,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 4/5 — the branching missing-links analysis.
class Week5Day1MissingLinksPage extends StatelessWidget {
  const Week5Day1MissingLinksPage({super.key, required this.onNext});

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
            icon: Icons.link_outlined,
            title: 'Analýza chybějících článků',
            subtitle: 'Den 1 • Týden 5',
          ),
          const SizedBox(height: 14),
          Text(
            day1MissingLinksIntro,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 6),
          const MissingLinksAnalysis(
            worksheetId: day1MissingLinksId,
            steps: day1MissingLinks,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
