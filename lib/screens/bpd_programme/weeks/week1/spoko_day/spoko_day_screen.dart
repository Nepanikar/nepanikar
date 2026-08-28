import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_challenge_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_completion_page.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_data.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_education_chat_page.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'spoko_day_screen.g.dart';

@TypedGoRoute<Week1Day3PotravaScreenRoute>(path: '/bpd-programme/week/1/day/3')
class Week1Day3PotravaScreenRoute extends GoRouteData with $Week1Day3PotravaScreenRoute {
  const Week1Day3PotravaScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SpokoDayScreen(data: spokoDay3Potrava);
}

@TypedGoRoute<Week1Day4LatkyScreenRoute>(path: '/bpd-programme/week/1/day/4')
class Week1Day4LatkyScreenRoute extends GoRouteData with $Week1Day4LatkyScreenRoute {
  const Week1Day4LatkyScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SpokoDayScreen(data: spokoDay4Latky);
}

@TypedGoRoute<Week1Day5KondiceScreenRoute>(path: '/bpd-programme/week/1/day/5')
class Week1Day5KondiceScreenRoute extends GoRouteData with $Week1Day5KondiceScreenRoute {
  const Week1Day5KondiceScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SpokoDayScreen(data: spokoDay5Kondice);
}

@TypedGoRoute<Week1Day6OnemocneniScreenRoute>(path: '/bpd-programme/week/1/day/6')
class Week1Day6OnemocneniScreenRoute extends GoRouteData with $Week1Day6OnemocneniScreenRoute {
  const Week1Day6OnemocneniScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SpokoDayScreen(data: spokoDay6Onemocneni);
}

/// Reusable 3-page SPOKO day flow (Days 3–6 of Week 1): education + mapping
/// questions → challenge pick-list → completion. Content comes from [data].
class SpokoDayScreen extends StatefulWidget {
  const SpokoDayScreen({super.key, required this.data});

  final SpokoDayData data;

  @override
  State<SpokoDayScreen> createState() => _SpokoDayScreenState();
}

class _SpokoDayScreenState extends State<SpokoDayScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
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
    await _bpdDaysDao.markDayCompleted(widget.data.weekNumber, widget.data.dayNumber);
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
                  SpokoEducationChatPage(data: widget.data, onNext: _nextPage),
                  SpokoChallengePage(data: widget.data, onNext: _nextPage),
                  SpokoCompletionPage(data: widget.data, onComplete: _completeDay),
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
