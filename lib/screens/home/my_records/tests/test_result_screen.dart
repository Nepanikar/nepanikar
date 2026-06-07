import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/tests/test_results_dao.dart';
import 'package:nepanikar/services/db/tests/test_results_models.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar/widgets/test/test_score_widget.dart';

part 'test_result_screen.g.dart';

@TypedGoRoute<TestResultScreenRoute>(
  path: '/home/my-records/test-result/:testId/:completedAt',
)
class TestResultScreenRoute extends GoRouteData with $TestResultScreenRoute {
  const TestResultScreenRoute({
    required this.testId,
    required this.completedAt,
  });

  final String testId;
  final int completedAt;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TestResultScreen(testId: testId, completedAt: completedAt);
}

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({
    super.key,
    required this.testId,
    required this.completedAt,
  });

  final String testId;
  final int completedAt;

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  TestResult? _currentResult;
  List<TestResult> _allResults = [];
  bool _isLoading = true;

  TestResultsDao get _testResultsDao => registry.get<TestResultsDao>();

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      // Load all results for this test
      final allResults = await _testResultsDao.getTestResults(widget.testId);

      // Find the current result by completedAt timestamp
      final currentResult = allResults.firstWhere(
        (r) => r.completedAt.millisecondsSinceEpoch == widget.completedAt,
        orElse: () => allResults.first,
      );

      setState(() {
        _currentResult = currentResult;
        _allResults = allResults;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading test results: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  int? _getPreviousScore() {
    if (_allResults.length < 2) return null;
    // Find the result before the current one
    final previousResults = _allResults
        .where((r) => r.completedAt.isBefore(_currentResult!.completedAt))
        .toList();
    return previousResults.isNotEmpty ? previousResults.first.totalScore : null;
  }

  double _getAverageScore() {
    if (_allResults.isEmpty) return 0;
    final total = _allResults.fold<int>(
      0,
      (sum, result) => sum + result.totalScore,
    );
    return total / _allResults.length;
  }

  String _getScoreLabel(int score) {
    // TODO: Make this configurable per test type
    if (score <= 5) return 'Low Anxiety';
    if (score <= 10) return 'Mild Anxiety';
    if (score <= 15) return 'Moderate Anxiety';
    return 'Severe Anxiety';
  }

  @override
  Widget build(BuildContext context) {
    final colors = longTileColorBasedOnDarkMode(context);

    if (_isLoading) {
      return const NepanikarScreenWrapper(
        appBarTitle: 'Výsledok testu',
        children: [Center(child: CircularProgressIndicator())],
      );
    }

    if (_currentResult == null) {
      return const NepanikarScreenWrapper(
        appBarTitle: 'Výsledok testu',
        children: [Center(child: Text('Výsledok sa nenašiel'))],
      );
    }

    final previousScore = _getPreviousScore();
    final averageScore = _getAverageScore();

    return NepanikarScreenWrapper(
      appBarTitle: 'Výsledok testu', // TODO: Localize
      children: [
        const SizedBox(height: 20),
        StaticScoreWidget(
          score: _currentResult!.totalScore,
          label: _getScoreLabel(_currentResult!.totalScore),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "A Moment of Clarity",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: NepanikarColors.defaultPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Your score is ${_currentResult!.totalScore}. "
                "This is a snapshot in time and can fluctuate. "
                "Keep track of your progress by taking tests regularly.",
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: NepanikarColors.defaultPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // --- SCORE CARDS ROW ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              // Previous Score
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: NepanikarColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Previous Score",
                        style: TextStyle(
                          fontSize: 14,
                          color: NepanikarColors.defaultPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        previousScore?.toString() ?? '-',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9D4EDD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Average Score
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: NepanikarColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Average",
                        style: TextStyle(
                          fontSize: 14,
                          color: NepanikarColors.defaultPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        averageScore.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9D4EDD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
