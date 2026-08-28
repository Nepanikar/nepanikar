import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_spoko/challenge_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_spoko/completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_spoko/education_chat_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day2_spoko_screen.g.dart';

@TypedGoRoute<Week1Day2SpokoScreenRoute>(path: '/bpd-programme/week/1/day/2')
class Week1Day2SpokoScreenRoute extends GoRouteData with $Week1Day2SpokoScreenRoute {
  const Week1Day2SpokoScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Week1Day2SpokoScreen();
}

class Week1Day2SpokoScreen extends StatefulWidget {
  const Week1Day2SpokoScreen({super.key});

  @override
  State<Week1Day2SpokoScreen> createState() => _Week1Day2SpokoScreenState();
}

class _Week1Day2SpokoScreenState extends State<Week1Day2SpokoScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  // The two education pages merged into one chat page (see education_chat_page).
  static const int _totalPages = 3;

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void dispose() {
    _pageController.dispose();
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

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(1, 2);
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
                  Week1Day2EducationChatPage(onNext: _nextPage),
                  Day2ChallengePage(onNext: _nextPage),
                  Day2CompletionPage(onComplete: _completeDay),
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
