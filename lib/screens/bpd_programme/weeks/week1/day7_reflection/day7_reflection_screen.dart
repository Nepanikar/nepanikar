import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day7_reflection/completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day7_reflection/recall_chat_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day7_reflection/reflection_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_autosave.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day7_reflection_screen.g.dart';

@TypedGoRoute<Week1Day7ReflexeScreenRoute>(path: '/bpd-programme/week/1/day/7')
class Week1Day7ReflexeScreenRoute extends GoRouteData with $Week1Day7ReflexeScreenRoute {
  const Week1Day7ReflexeScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week1Day7ReflectionScreen();
}

/// Week 1, Day 7 — SPOKO reflection: recall (reveal-on-tap) → 4 free-text
/// questions (persisted) → week congratulations. Verbatim, source: §7.
class Week1Day7ReflectionScreen extends StatefulWidget {
  const Week1Day7ReflectionScreen({super.key});

  @override
  State<Week1Day7ReflectionScreen> createState() => _Week1Day7ReflectionScreenState();
}

class _Week1Day7ReflectionScreenState extends State<Week1Day7ReflectionScreen>
    with ReflectionAutosave<Week1Day7ReflectionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 3;
  static const int _weekNumber = 1;

  final _controllers = List.generate(4, (_) => TextEditingController());

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
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
            _buildHeader(primaryColor, isDarkMode),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  Day7RecallChatPage(onNext: _nextPage),
                  Day7ReflectionPage(controllers: _controllers, onNext: _nextPage),
                  Day7CompletionPage(onComplete: _completeWeek),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _currentPage == 0 ? Icons.close : Icons.arrow_back,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () {
              if (_currentPage == 0) {
                context.pop();
              } else {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_totalPages, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? primaryColor
                            : (isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              '${_currentPage + 1}/$_totalPages',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
