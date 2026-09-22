import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_research.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week7/day7_conclusion/day7_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/week_completion_page.dart';
import 'package:nepanikar/screens/contacts/region_contacts_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day7_conclusion_screen.g.dart';

@TypedGoRoute<Week7Day7ConclusionScreenRoute>(path: '/bpd-programme/week/7/day/7')
class Week7Day7ConclusionScreenRoute extends GoRouteData with $Week7Day7ConclusionScreenRoute {
  const Week7Day7ConclusionScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week7Day7ConclusionScreen();
}

/// Week 7, Day 7 — shrnutí a ohlédnutí. Verbatim, source: tyzden-7.md §7.
///
/// The last screen of the seven-week programme. Five pages rather than three:
/// the source closes with two written exercises and a hand-off to the crisis
/// contacts, and none of that should be crammed under a farewell.
class Week7Day7ConclusionScreen extends StatefulWidget {
  const Week7Day7ConclusionScreen({super.key});

  @override
  State<Week7Day7ConclusionScreen> createState() => _Week7Day7ConclusionScreenState();
}

class _Week7Day7ConclusionScreenState extends State<Week7Day7ConclusionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 6;

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  BpdWorksheetDao get _worksheetDao => registry.get<BpdWorksheetDao>();

  BpdRescuePackageDao get _rescueDao => registry.get<BpdRescuePackageDao>();

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

  /// The three skills are what the user takes out of the programme, so they are
  /// copied into the rescue package — findable from Mé záznamy months later,
  /// without opening the programme at all.
  Future<void> _saveThreeSkillsAndContinue() async {
    final answers = await _worksheetDao.getWorksheet(day7SkillsWorksheetId);
    final filled = day7SkillsWorksheet
        .expand((section) => section.fields)
        .map((field) => answers[field.id]?.trim() ?? '')
        .where((text) => text.isNotEmpty)
        .toList();

    if (filled.isNotEmpty) {
      await _rescueDao.save(
        BpdRescueItem(
          id: day7SkillsRescueId,
          title: day7SkillsRescueTitle,
          description: filled.join('\n'),
          sourceLabel: 'Týden 7 • Den 7',
          savedAt: DateTime.now(),
          iconKey: 'list',
        ),
      );
    }
    _goToNextPage();
  }

  /// Marks the programme done and moves on to the study's closing ask, rather
  /// than leaving: the questionnaire is the one thing the pilot cannot get
  /// afterwards, and nobody comes back to a programme they have finished.
  Future<void> _completeProgramme() async {
    await _bpdDaysDao.markDayCompleted(7, 7);
    if (mounted) _goToNextPage();
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
                  Week7Day7OpeningPage(onNext: _goToNextPage),
                  Week7Day7ThreeSkillsPage(onNext: _saveThreeSkillsAndContinue),
                  Week7Day7SupportPage(onNext: _goToNextPage),
                  Week7Day7ClosingWritingPage(onNext: _goToNextPage),
                  WeekCompletionPage(
                    weekNumber: 7,
                    eyebrow: 'PROGRAM DOKONČEN',
                    heading: day7FinalHeading,
                    praise: day7FinalPraise,
                    buttonText: day7FinalButton,
                    onComplete: _completeProgramme,
                  ),
                  Week7Day7StudyPage(onClose: () => context.pop()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Page 1/5 — you made it here.
class Week7Day7OpeningPage extends StatelessWidget {
  const Week7Day7OpeningPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day7Opening.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: day7Opening[i], showAvatar: i == 0)],
            buttonLabel: i == day7Opening.length - 1 ? context.l10n.dbt_continue : null,
          ),
      ],
    );
  }
}

/// Page 2/5 — the three skills to take away.
class Week7Day7ThreeSkillsPage extends StatelessWidget {
  const Week7Day7ThreeSkillsPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: context.l10n.dbt_continue,
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.workspace_premium_outlined,
            title: 'Tři dovednosti do života',
            subtitle: 'Den 7 • Týden 7',
          ),
          const SizedBox(height: 14),
          Text(
            day7SkillsLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
            ),
          ),
          const SizedBox(height: 18),
          const StructuredWorksheet(
            worksheetId: day7SkillsWorksheetId,
            sections: day7SkillsWorksheet,
          ),
          const SizedBox(height: 16),
          const InfoBox(
            icon: Icons.medical_services_outlined,
            title: 'Zůstanou ti po ruce',
            text:
                'Tvoje tři dovednosti se uloží do záchranného balíčku, kde je '
                'najdeš i po skončení průvodce.',
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 3/5 — where to come back to, including the crisis contacts.
class Week7Day7SupportPage extends StatelessWidget {
  const Week7Day7SupportPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        const ChatStep(messages: [ChatBotBubble(text: day7MindfulnessReminder, showAvatar: true)]),
        ChatStep(
          messages: [
            const ChatBotBubble(text: day7SupportText, showAvatar: true),
            // The contacts card sits with the sentence that offers it, not at
            // the foot of the last page of the programme.
            ChatRichMessage(
              child: _ContactsCard(
                onTap: () => const CrisisCenterContactsRoute().push<void>(context),
              ),
            ),
          ],
        ),
        ChatStep(
          messages: [const ChatBotBubble(text: day7JustTheBeginning, showAvatar: true)],
          buttonLabel: context.l10n.dbt_continue,
        ),
      ],
    );
  }
}

/// Page 4/5 — what I take away from the programme.
class Week7Day7ClosingWritingPage extends StatelessWidget {
  const Week7Day7ClosingWritingPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: context.l10n.dbt_continue,
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.auto_stories_outlined,
            title: 'Co si odnáším',
            subtitle: 'Den 7 • Týden 7',
          ),
          const SizedBox(height: 14),
          Text(
            day7ClosingLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
            ),
          ),
          const SizedBox(height: 18),
          const StructuredWorksheet(
            worksheetId: day7ClosingWorksheetId,
            sections: day7ClosingWorksheet,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 6/6 — the pilot study's closing ask.
///
/// Deliberately after the celebration, not instead of it: the programme is the
/// thing the person came for, and the questionnaire is what we need from them.
/// The order says which is which.
///
/// Nothing on this page collects anything. The questionnaire is a Microsoft
/// Form on the university's tenant and this is a link to it, which is the whole
/// of the app's part in the study.
class Week7Day7StudyPage extends StatelessWidget {
  const Week7Day7StudyPage({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bodyColor = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78);

    return DayPageBase(
      buttonText: context.l10n.dbt_close,
      onButtonPressed: onClose,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            day7StudyHeading,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              height: 1.3,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          Text(day7StudyThanks, style: TextStyle(fontSize: 14, height: 1.55, color: bodyColor)),
          if (hasBpdResearchExitForm) ...[
            const SizedBox(height: 22),
            const SectionHeader(
              icon: Icons.assignment_turned_in_outlined,
              title: day7StudyStepLabel,
            ),
            const SizedBox(height: 12),
            Text(day7StudyAsk, style: TextStyle(fontSize: 14, height: 1.55, color: bodyColor)),
            const SizedBox(height: 16),
            Text(
              day7StudyFormIntro,
              style: TextStyle(fontSize: 14, height: 1.55, color: bodyColor),
            ),
            const SizedBox(height: 10),
            const ExternalLinkButton(
              label: day7StudyFormButton,
              url: bpdResearchExitFormUrl,
              icon: Icons.assignment_outlined,
            ),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ContactsCard extends StatelessWidget {
  const _ContactsCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: NepanikarColors.secondary.withOpacity(isDarkMode ? 0.22 : 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: NepanikarColors.secondary.withOpacity(0.4)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.support_agent_outlined,
              size: 19,
              color: isDarkMode ? Colors.white : NepanikarColors.secondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                day7ContactsLinkLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : NepanikarColors.secondary,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDarkMode ? Colors.white70 : NepanikarColors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
