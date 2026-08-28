import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day3_check_facts/day3_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day3_check_facts_screen.g.dart';

@TypedGoRoute<Week3Day3CheckFactsScreenRoute>(path: '/bpd-programme/week/3/day/3')
class Week3Day3CheckFactsScreenRoute extends GoRouteData with $Week3Day3CheckFactsScreenRoute {
  const Week3Day3CheckFactsScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day3CheckFactsScreen();
}

/// Week 3, Day 3 — ověřování faktů. Verbatim, source: tyzden-3.md §3.
class Week3Day3CheckFactsScreen extends StatefulWidget {
  const Week3Day3CheckFactsScreen({super.key});

  @override
  State<Week3Day3CheckFactsScreen> createState() => _Week3Day3CheckFactsScreenState();
}

class _Week3Day3CheckFactsScreenState extends State<Week3Day3CheckFactsScreen> {
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
    await _bpdDaysDao.markDayCompleted(3, 3);
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
                  Day3IntroChatPage(onNext: _goToNextPage),
                  Day3StepsPage(onNext: _goToNextPage),
                  Day3WorksheetPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 3,
                    summary: day3CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Opačná akce',
                      description:
                          'Jednat opačně, než by nás emoce nutila — a kdy '
                          'to naopak nedělat.',
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

/// Page 1/4 — the event → thought → emotion chain.
class Day3IntroChatPage extends StatelessWidget {
  const Day3IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in day3IntroChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatConceptCard(
              badge: 'JAK TO JDE ZA SEBOU',
              title: day3ChainTitle,
              body: day3ChainBody,
            ),
          ],
          buttonLabel: 'Jak ověřovat fakta',
        ),
      ],
    );
  }
}

/// Page 2/4 — the six steps.
class Day3StepsPage extends StatelessWidget {
  const Day3StepsPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return DayPageBase(
      buttonText: 'Vyplnit worksheet',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.fact_check_outlined,
            title: 'Jak ověřovat fakta',
            subtitle: 'a měnit odezvu na emoce',
          ),
          const SizedBox(height: 16),
          ...List.generate(day3Steps.length, (i) {
            final (title, description) = day3Steps[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NumberedBenefit(
                number: '${i + 1}',
                title: title,
                description: description,
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 3/4 — the OVĚŘOVÁNÍ FAKTŮ worksheet: seven sections, ten fields.
class Day3WorksheetPage extends StatelessWidget {
  const Day3WorksheetPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const worksheetId = 'week3_day3_facts';

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
          const SectionHeader(icon: Icons.checklist_outlined, title: day3WorksheetTitle),
          const SizedBox(height: 12),
          Text(
            day3WorksheetLead,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Je to nejdelší cvičení v programu. Nemusíš ho zvládnout '
            'najednou — co napíšeš, zůstane uložené.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 16),
          StructuredWorksheet(
            worksheetId: worksheetId,
            example: day3WorksheetExample,
            exampleNote: 'Příklad je ilustrativní, tvoje situace může vypadat úplně jinak.',
            sections: day3WorksheetSections
                .map(
                  (section) => WorksheetSection(
                    title: section.$1,
                    fields: section.$2
                        .map((field) => WorksheetField(id: field.$1, label: field.$2))
                        .toList(),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
