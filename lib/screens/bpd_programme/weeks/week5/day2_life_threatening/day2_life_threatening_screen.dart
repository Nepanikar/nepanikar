import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week5/day2_life_threatening/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/screens/contacts/region_contacts_screen.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_life_threatening_screen.g.dart';

@TypedGoRoute<Week5Day2LifeThreateningScreenRoute>(path: '/bpd-programme/week/5/day/2')
class Week5Day2LifeThreateningScreenRoute extends GoRouteData
    with $Week5Day2LifeThreateningScreenRoute {
  const Week5Day2LifeThreateningScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week5Day2LifeThreateningScreen();
}

/// Week 5, Day 2 — život ohrožující chování. Verbatim, source: tyzden-5.md §2.
///
/// The one day the source itself declares optional, so it is also the one day
/// with a way out on every screen. Skipping marks it done rather than leaving
/// the week stuck at 6/7 — see WEEK5_SCREEN_PLAN.md → OQ-1, which is still the
/// author's call.
class Week5Day2LifeThreateningScreen extends StatefulWidget {
  const Week5Day2LifeThreateningScreen({super.key});

  @override
  State<Week5Day2LifeThreateningScreen> createState() =>
      _Week5Day2LifeThreateningScreenState();
}

class _Week5Day2LifeThreateningScreenState extends State<Week5Day2LifeThreateningScreen> {
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
    await _bpdDaysDao.markDayCompleted(5, 2);
    if (mounted) context.pop();
  }

  /// Skipping counts as done. Anything else and the week can never reach 7/7,
  /// while Day 3 still opens with "Po včerejším dni…".
  Future<void> _skipDay() async {
    await _bpdDaysDao.markDayCompleted(5, 2);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text(day2SkipConfirmation)));
    context.pop();
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
                  Week5Day2WarningPage(onNext: _goToNextPage, onSkip: _skipDay),
                  Week5Day2EducationPage(onNext: _goToNextPage),
                  Week5Day2StopPage(onNext: _goToNextPage),
                  Week5Day2ReliefListPage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 2,
                    summary: day2CompletionText,
                    extraContent: const Week5Day2CareLinks(),
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Po dnešku je únava přirozená. Zítra si dáme od '
                          'programu volno.',
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

/// Page 1/5 — the warning, and a real way out.
class Week5Day2WarningPage extends StatelessWidget {
  const Week5Day2WarningPage({super.key, required this.onNext, required this.onSkip});

  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      // Deliberately not a red banner and not a modal: an alarm turns people
      // away from the one day that hands them the crisis contacts.
      secondaryAction: _SkipButton(onTap: onSkip),
      steps: [
        for (var i = 0; i < day2Warning.length; i++)
          ChatStep(messages: [ChatBotBubble(text: day2Warning[i], showAvatar: i == 0)]),
        ChatStep(
          messages: [
            ChatRichMessage(
              child: _CrisisContactsCard(
                onTap: () => const CrisisCenterContactsRoute().push<void>(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Page 2/5 — what life-threatening behaviour is (education, chat).
class Week5Day2EducationPage extends StatelessWidget {
  const Week5Day2EducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: day2WhatItIs, showAvatar: true)]),
        ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.favorite_outline,
              title: day2NotWeaknessTitle,
              text: day2NotWeakness,
            ),
          ],
          buttonLabel: 'Naučit se STOP',
        ),
      ],
    );
  }
}

/// Page 3/5 — STOP.
class Week5Day2StopPage extends StatelessWidget {
  const Week5Day2StopPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.back_hand_outlined,
      title: 'STOP',
      subtitle: 'Den 2 • Týden 5',
      leadParagraphs: day2StopLead,
      letters: day2StopLetters,
      rescueItem: BpdRescueItem(
        id: day2StopRescueId,
        title: 'STOP',
        description: day2StopLetters.map((l) => '${l.$1} – ${l.$2}: ${l.$3}').join('\n'),
        sourceLabel: 'Týden 5 • Den 2',
        savedAt: DateTime.now(),
        iconKey: 'pause',
      ),
      onNext: onNext,
    );
  }
}

/// Page 4/5 — the five things that could help, saved somewhere reachable.
class Week5Day2ReliefListPage extends StatefulWidget {
  const Week5Day2ReliefListPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<Week5Day2ReliefListPage> createState() => _Week5Day2ReliefListPageState();
}

class _Week5Day2ReliefListPageState extends State<Week5Day2ReliefListPage> {
  bool _areExamplesOpen = false;

  /// Tapping an example writes it into the first empty field. Someone reaching
  /// for this page may not have the capacity to compose five activities from
  /// scratch, and the author already wrote ten good ones.
  final _insertController = WorksheetInsertController();

  BpdWorksheetDao get _worksheetDao => registry.get<BpdWorksheetDao>();
  BpdRescuePackageDao get _rescueDao => registry.get<BpdRescuePackageDao>();

  /// "uložení na dostupné místo" — the rescue package already is that place, and
  /// it is reachable from Mé záznamy without opening the programme at all. The
  /// list is copied there on the way out so it survives as one readable item.
  Future<void> _saveAndContinue() async {
    final answers = await _worksheetDao.getWorksheet(day2ReliefListId);
    final filled = day2ReliefFields
        .map((field) => answers[field.id]?.trim() ?? '')
        .where((text) => text.isNotEmpty)
        .toList();

    if (filled.isNotEmpty) {
      await _rescueDao.save(
        BpdRescueItem(
          id: 'week5_relief_list',
          title: 'Mých 5 činností',
          description: filled.join('\n'),
          sourceLabel: 'Týden 5 • Den 2',
          savedAt: DateTime.now(),
          iconKey: 'list',
        ),
      );
    }
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: _saveAndContinue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.spa_outlined,
            title: 'Co udělám místo toho',
            subtitle: 'Den 2 • Týden 5',
          ),
          const SizedBox(height: 14),
          Text(
            day2ReliefLead,
            style: TextStyle(
              fontSize: 14,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 16),
          StructuredWorksheet(
            worksheetId: day2ReliefListId,
            sections: const [
              WorksheetSection(title: 'Mých 5 činností', fields: day2ReliefFields),
            ],
            insertController: _insertController,
          ),
          const SizedBox(height: 4),
          _ExamplesToggle(
            isOpen: _areExamplesOpen,
            onToggle: () => setState(() => _areExamplesOpen = !_areExamplesOpen),
          ),
          if (_areExamplesOpen) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final example in day2ReliefExamples)
                  _ExampleChip(
                    label: example,
                    onTap: () => _insertController.insertIntoFirstEmpty(example),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 20),
          _RescueHint(onTap: () => const RescuePackageRoute().push<void>(context)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// The way out, offered without drama.
class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(foregroundColor: primaryColor),
        child: const Text(
          day2SkipLabel,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

/// "(proklik do Nepanikař kontaktů)" — the same target Week 4 Day 2 uses.
class _CrisisContactsCard extends StatelessWidget {
  const _CrisisContactsCard({required this.onTap});

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
                day2CrisisLinkLabel,
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

class _ExamplesToggle extends StatelessWidget {
  const _ExamplesToggle({required this.isOpen, required this.onToggle});

  final bool isOpen;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.white70 : NepanikarColors.secondary;

    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isOpen ? Icons.expand_less : Icons.expand_more, size: 18, color: color),
            const SizedBox(width: 6),
            Text(
              'Nevíš, co napsat?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExampleChip extends StatelessWidget {
  const _ExampleChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.08) : NepanikarColors.purple200,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: isDarkMode ? Colors.white : primaryColor,
          ),
        ),
      ),
    );
  }
}

class _RescueHint extends StatelessWidget {
  const _RescueHint({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : NepanikarColors.purple200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: 19,
              color: isDarkMode ? Colors.white : primaryColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Seznam se uloží do záchranného balíčku, kde ho najdeš i bez programu.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shown on the completion page: the source's two care links, above the thanks
/// so that someone who is leaving does not have to scroll to find them.
class Week5Day2CareLinks extends StatelessWidget {
  const Week5Day2CareLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          day2CareLead,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
            color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 14),
        _CareLink(
          icon: Icons.healing_outlined,
          label: 'Chci si ublížit',
          onTap: () => const SelfHarmRoute().push<void>(context),
        ),
        const SizedBox(height: 10),
        _CareLink(
          icon: Icons.support_agent_outlined,
          label: day2CrisisLinkLabel,
          onTap: () => const CrisisCenterContactsRoute().push<void>(context),
        ),
      ],
    );
  }
}

class _CareLink extends StatelessWidget {
  const _CareLink({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? Colors.white24 : primaryColor.withOpacity(0.35),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 19, color: isDarkMode ? Colors.white : primaryColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : primaryColor,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDarkMode ? Colors.white70 : primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
