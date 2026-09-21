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

@TypedGoRoute<Week4Day7SummaryScreenRoute>(path: '/bpd-programme/week/4/day/7')
class Week4Day7SummaryScreenRoute extends GoRouteData with $Week4Day7SummaryScreenRoute {
  const Week4Day7SummaryScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week4Day7SummaryScreen();
}

/// Week 4, Day 7 — Shrnutí. Verbatim, source: tyzden-4.md §7.
///
/// Recap (chat) → three free-text questions → week congratulations. The answers
/// autosave, so leaving before the last page keeps them.
class Week4Day7SummaryScreen extends StatefulWidget {
  const Week4Day7SummaryScreen({super.key});

  @override
  State<Week4Day7SummaryScreen> createState() => _Week4Day7SummaryScreenState();
}

class _Week4Day7SummaryScreenState extends State<Week4Day7SummaryScreen>
    with ReflectionAutosave<Week4Day7SummaryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;
  static const int _weekNumber = 4;

  /// Verbatim, source §7.
  static const _praise =
      'Máme za sebou čtvrtý týden, který byl zaměřený na snášení tísně. Velké '
      'uznání za to, jak tento náročný modul zvládáš!';

  /// Ours — the source lists no recap items for this week.
  // TODO: schválit autorem
  static const _recapTopics = <ChatFeatureItem>[
    ChatFeatureItem(
      icon: Icons.bolt_outlined,
      title: 'Stres a distres',
      description: 'Kdy je stres užitečný a kdy začne ubírat síly.',
    ),
    ChatFeatureItem(
      icon: Icons.back_hand_outlined,
      title: 'STOP',
      description: 'Chvíle mezi impulsem a reakcí — a šance vybrat si jinak.',
    ),
    ChatFeatureItem(
      icon: Icons.ac_unit,
      title: 'TIPS',
      description: 'Teplota, intenzivní cvičení, dýchání a svalová relaxace.',
    ),
    ChatFeatureItem(
      icon: Icons.self_improvement,
      title: 'Všímavost u stresu',
      description: 'V daný moment i dlouhodobě, technikami z druhého týdne.',
    ),
    ChatFeatureItem(
      icon: Icons.auto_awesome_outlined,
      title: 'UZNÁVÁM',
      description: 'Sedm způsobů, jak přečkat bouři, dokud neodezní.',
    ),
  ];

  /// Verbatim, source §7 — three questions this week (Weeks 2 had four).
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
            questions: _Week4Day7SummaryScreenState.questions,
            controllers: controllers,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
