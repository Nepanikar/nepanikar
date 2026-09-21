import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_flow_header.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_autosave.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/week_completion_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day7_summary_screen.g.dart';

@TypedGoRoute<Week3Day7SummaryScreenRoute>(path: '/bpd-programme/week/3/day/7')
class Week3Day7SummaryScreenRoute extends GoRouteData with $Week3Day7SummaryScreenRoute {
  const Week3Day7SummaryScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week3Day7SummaryScreen();
}

/// Week 3, Day 7 — Shrnutí. Verbatim, source: tyzden-3.md §7.
///
/// Recap (chat) → three free-text questions → week congratulations. The answers
/// autosave, so leaving before the last page keeps them.
class Week3Day7SummaryScreen extends StatefulWidget {
  const Week3Day7SummaryScreen({super.key});

  @override
  State<Week3Day7SummaryScreen> createState() => _Week3Day7SummaryScreenState();
}

class _Week3Day7SummaryScreenState extends State<Week3Day7SummaryScreen>
    with ReflectionAutosave<Week3Day7SummaryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;
  static const int _weekNumber = 3;

  /// Verbatim, source §7.
  static const _praise =
      'Úspěšně uzavíráme třetí týden zaměřený na emoční regulaci. Sledovat '
      'a mírnit intenzivní emoční vlny stojí spoustu energie, takže ti patří '
      'obrovské uznání za celou tvou týdenní práci.';

  static const _recapTopics = <String>[
    'Slovník emocí — k čemu každá emoce slouží',
    'Popis a validace emocí',
    'Ověřování faktů',
    'Opačná akce',
    'SPOKO jako základ, když nic nefunguje',
  ];

  static const questions = <String>[
    'Co pro tebe bylo v tomto týdnu klíčové? Jaké nové poznatky se ti podařilo získat?',
    'Podařilo se ti už něco z nové inspirace uvést do praxe? Co přesně a jak to probíhalo?',
    'Ve kterých situacích v nadcházejícím týdnu vidíš pro tuto dovednost největší využití?',
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
                        messages: [
                          ChatNumberedList(caption: 'Co jsme prošli', items: _recapTopics),
                        ],
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
            questions: _Week3Day7SummaryScreenState.questions,
            controllers: controllers,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
