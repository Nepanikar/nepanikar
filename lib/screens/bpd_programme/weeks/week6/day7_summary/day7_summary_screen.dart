import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_autosave.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/week_completion_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day7_summary_screen.g.dart';

@TypedGoRoute<Week6Day7SummaryScreenRoute>(path: '/bpd-programme/week/6/day/7')
class Week6Day7SummaryScreenRoute extends GoRouteData with $Week6Day7SummaryScreenRoute {
  const Week6Day7SummaryScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week6Day7SummaryScreen();
}

/// Week 6, Day 7 — Shrnutí. Verbatim, source: tyzden-6.md §7.
///
/// Recap (chat) → three free-text questions → week congratulations. The answers
/// autosave, so leaving before the last page keeps them.
class Week6Day7SummaryScreen extends StatefulWidget {
  const Week6Day7SummaryScreen({super.key});

  @override
  State<Week6Day7SummaryScreen> createState() => _Week6Day7SummaryScreenState();
}

class _Week6Day7SummaryScreenState extends State<Week6Day7SummaryScreen>
    with ReflectionAutosave<Week6Day7SummaryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;
  static const int _weekNumber = 6;

  /// Verbatim, source §7.
  static const _praise =
      'Máme za sebou šestý týden, který byl zaměřený na mezilidské vztahy. '
      'Vztahy s ostatními i sami se sebou bývají velkým zdrojem emocí. Chceme tě '
      'moc ocenit za to, s jakým nasazením do tohoto důležitého tématu nahlížíš!';

  /// Ours — the source lists no recap items for this week.
  // TODO: schválit autorem (WEEK6_SCREEN_PLAN.md → OQ-6)
  static const _recapTopics = <ChatFeatureItem>[
    ChatFeatureItem(
      icon: Icons.construction_outlined,
      title: 'Mýty o vztazích',
      description: 'Dvacet čtyři přesvědčení, která brání říct si o svoje.',
    ),
    ChatFeatureItem(
      icon: Icons.forum_outlined,
      title: 'PSANÍČKo',
      description: 'Jak požádat nebo odmítnout tak, aby tě druhý slyšel.',
    ),
    ChatFeatureItem(
      icon: Icons.volunteer_activism_outlined,
      title: 'Je VýZVa',
      description: 'Laskavost, zájem a validace i ve chvíli rozrušení.',
    ),
    ChatFeatureItem(
      icon: Icons.self_improvement,
      title: 'Všímavost ve vztazích',
      description: 'Vnímat sebe i druhé dřív, než zareaguje impulz.',
    ),
    ChatFeatureItem(
      icon: Icons.shield_moon_outlined,
      title: 'neZOUFej',
      description: 'Chránit hranice bez omluv — a zůstat férový/á.',
    ),
  ];

  /// Verbatim, source §7. Word for word the same three questions as Week 4 —
  /// that repetition is the author's, not a copy-paste slip on our side.
  static const questions = <String>[
    'Zkus se zamyslet, co přineslo nejvíc zajímavých momentů? Co nového se ti daří si odnášet?',
    'Máš už zkušenost s využitím nových kroků ve svém životě? Co konkrétně a v jaké situaci to bylo?',
    'Kdy přesně se nabízí příležitost tuto dovednost zapojit v dalším týdnu?',
  ];

  final _controllers = List.generate(questions.length, (_) => TextEditingController());

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void initState() {
    super.initState();
    initReflectionAutosave(weekNumber: _weekNumber, controllers: _controllers);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // Runs before the mixin's dispose, which only flushes cached strings.
    for (final controller in _controllers) {
      controller.dispose();
    }
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

  Future<void> _completeWeek() async {
    await saveReflectionNow();
    await _bpdDaysDao.markDayCompleted(_weekNumber, 7);
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
                  ChatDayPage(
                    onCompleted: _goToNextPage,
                    steps: const [
                      ChatStep(messages: [ChatBotBubble(text: _praise, showAvatar: true)]),
                      ChatStep(
                        messages: [ChatFeatureList(caption: 'Co jsme prošli', items: _recapTopics)],
                        buttonLabel: 'Reflexe týdne',
                      ),
                    ],
                  ),
                  _ReflectionPage(controllers: _controllers, onNext: _goToNextPage),
                  WeekCompletionPage(
                    weekNumber: _weekNumber,
                    praise: _praise,
                    onComplete: _completeWeek,
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

/// Page 2/3 — the week's three reflection questions (verbatim, source §7).
class _ReflectionPage extends StatelessWidget {
  const _ReflectionPage({required this.controllers, required this.onNext});

  final List<TextEditingController> controllers;
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
          const SectionHeader(icon: Icons.edit_outlined, title: 'Reflexe týdne'),
          const SizedBox(height: 12),
          Text(
            'Zkus se zamyslet — odpovědi zůstanou uložené, můžeš se k nim vrátit.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 20),
          ReflectionQuestionList(
            questions: _Week6Day7SummaryScreenState.questions,
            controllers: controllers,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
