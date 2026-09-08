// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_mindfulness_stress_screen.dart'
    show week4DrawPool;
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_randomiser.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day5_mindfulness_screen.g.dart';

@TypedGoRoute<Week5Day5MindfulnessScreenRoute>(path: '/bpd-programme/week/5/day/5')
class Week5Day5MindfulnessScreenRoute extends GoRouteData
    with $Week5Day5MindfulnessScreenRoute {
  const Week5Day5MindfulnessScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week5Day5MindfulnessScreen();
}

/// Week 5, Day 5 — všímavost. Verbatim, source: tyzden-5.md §5.
///
/// Structurally the same day as Week 4 Day 4: three education bullets, then one
/// of Week 2's eight named techniques. The pool, the detail sheet and the
/// rescue-package ids are reused unchanged, so a drawn technique behaves exactly
/// as it did when the user first met it.
class Week5Day5MindfulnessScreen extends StatefulWidget {
  const Week5Day5MindfulnessScreen({super.key});

  @override
  State<Week5Day5MindfulnessScreen> createState() => _Week5Day5MindfulnessScreenState();
}

class _Week5Day5MindfulnessScreenState extends State<Week5Day5MindfulnessScreen> {
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
    await _bpdDaysDao.markDayCompleted(5, 5);
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
                  Week5Day5ChatPage(onNext: _goToNextPage),
                  Week5Day5PracticePage(onNext: _goToNextPage),
                  DayCompletionPage(
                    dayNumber: 5,
                    summary: day5CompletionText,
                    nextDay: const NextDayTeaser(
                      title: 'Pauza',
                      description:
                          'Zítra je den odpočinku. I pauza je součástí cesty '
                          'vpřed.',
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

/// Bullets 1–3, verbatim.
const day5OpeningChat =
    'Všímavost může v impulzivitě pomoci tím, že nám umožní zastavit se v '
    'okamžiku, kdy cítíme silnou emoci, místo aby nás přemohla a vedla k '
    'rychlé, nepromýšlené reakci.';

const day5SpaceTitle = 'Prostor rozhodnout se';
const day5SpaceBody =
    'Když se naučíme vědomě sledovat své myšlenky, pocity a tělesné signály, '
    'můžeme si všimnout prvních známek impulzivního chování. Díky tomu získáme '
    'prostor rozhodnout se, jak reagovat, místo aby emoce řídily naše jednání '
    'automaticky.';

const day5FewerUrgesTitle = 'Míň impulzů';
const day5FewerUrgesBody =
    'Všímavost také pomáhá snižovat celkovou úroveň stresu a napětí, takže se '
    'impulzy objevují méně často a snáze je zvládáme.';

const day5PracticeInvitation = 'Pojďme si teď jednu z technik vyzkoušet';

/// Ours — the source closes with "To je pro dnešek vše!", which is a sign-off
/// rather than a summary, so it stays as the completion line unchanged.
const day5CompletionText = 'To je pro dnešek vše!';

/// Page 1/3 — how mindfulness helps with impulsivity.
class Week5Day5ChatPage extends StatelessWidget {
  const Week5Day5ChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: day5OpeningChat, showAvatar: true)]),
        ChatStep(
          messages: [
            ChatFeatureList(
              caption: 'Jak všímavost pomáhá',
              items: [
                ChatFeatureItem(
                  icon: Icons.pause_circle_outline,
                  title: day5SpaceTitle,
                  description: day5SpaceBody,
                ),
                ChatFeatureItem(
                  icon: Icons.trending_down,
                  title: day5FewerUrgesTitle,
                  description: day5FewerUrgesBody,
                ),
              ],
            ),
          ],
          buttonLabel: 'Vyzkoušet techniku',
        ),
      ],
    );
  }
}

/// Page 2/3 — draw a technique, or pick one.
///
/// The source asks for both: "prostor vybrat si z všímavých technik" (a menu)
/// and "kolo štěstí" (a draw). The draw is primary because that is what was
/// decided for the same request in Week 4; picking is one tap away for anyone
/// who already knows what they want (WEEK5_SCREEN_PLAN.md → OQ-9).
class Week5Day5PracticePage extends StatelessWidget {
  const Week5Day5PracticePage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75);

    return DayPageBase(
      // Not "Hotovo" — the day is complete whether or not the technique was
      // actually done.
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(
            icon: Icons.self_improvement,
            title: 'Vyzkoušej si techniku',
            subtitle: 'Den 5 • Týden 5',
          ),
          const SizedBox(height: 18),
          Text(
            day5PracticeInvitation,
            style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
          ),
          const SizedBox(height: 20),
          TechniqueRandomiser(
            techniques: week4DrawPool,
            sourceLabel: 'Týden 2 • připomenuto v 5. týdnu',
          ),
          const SizedBox(height: 20),
          _PickYourselfButton(
            onTap: () => _showPicker(context),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => _TechniquePickerSheet(
        onPick: (technique) {
          Navigator.of(sheetContext).pop();
          showTechniqueDetailSheet(
            context,
            technique: technique,
            sourceLabel: 'Týden 2 • připomenuto v 5. týdnu',
          );
        },
      ),
    );
  }
}

class _PickYourselfButton extends StatelessWidget {
  const _PickYourselfButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? Colors.white24 : primaryColor.withOpacity(0.35),
            width: 1.5,
          ),
        ),
        child: Text(
          'Vybrat si sám/sama',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: isDarkMode ? Colors.white : primaryColor,
          ),
        ),
      ),
    );
  }
}

class _TechniquePickerSheet extends StatelessWidget {
  const _TechniquePickerSheet({required this.onPick});

  final void Function(TechniqueData technique) onPick;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
      decoration: BoxDecoration(
        color: isDarkMode ? NepanikarColors.containerColor(primaryColor) : NepanikarColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white24 : NepanikarColors.purple200,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Vyber si techniku',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                itemCount: week4DrawPool.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final technique = week4DrawPool[index];
                  return InkWell(
                    onTap: () => onPick(technique),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode ? Colors.white24 : NepanikarColors.purple200,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            technique.icon,
                            size: 22,
                            color: isDarkMode ? Colors.white : primaryColor,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              technique.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: isDarkMode ? Colors.white : NepanikarColors.dark,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
