import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_result_screen.dart';
import 'package:nepanikar/services/db/tests/test_results_dao.dart';
import 'package:nepanikar/services/db/tests/test_results_models.dart';
import 'package:nepanikar/utils/registry.dart';

part 'test_screen.g.dart';

// ----- DATA MODELS --------
class Answer {
  const Answer({required this.id, required this.text, required this.score});
  final String id;
  final String text;
  final int score;
}

class Question {
  const Question({required this.id, required this.text, required this.answers});
  final String id;
  final String text;
  final List<Answer> answers;
}

@TypedGoRoute<TestScreenRoute>(path: '/home/my-records/tests/:testId')
class TestScreenRoute extends GoRouteData with $TestScreenRoute {
  const TestScreenRoute({required this.testId});

  final String testId;

  @override
  Widget build(BuildContext context, _) => TestScreen(testId: testId);
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.testId});

  final String testId;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question>? _questions;
  int _currentQuestionIndex = 0;
  final Map<String, String> _selectedAnswers = {};
  int _totalQuestions = 0;

  Question get _currentQuestion => _questions![_currentQuestionIndex];

  @override
  void initState() {
    super.initState();
    _loadTestData();
  }

  Future<void> _saveTestResult() async {
    int totalScore = 0;
    for (final entry in _selectedAnswers.entries) {
      final question = _questions!.firstWhere((q) => q.id == entry.key);
      final answer = question.answers.firstWhere((a) => a.id == entry.value);
      totalScore += answer.score;
    }

    final testResult = TestResult(
      testId: widget.testId,
      completedAt: DateTime.now(),
      totalScore: totalScore,
      answers: _selectedAnswers,
    );

    final dao = registry.get<TestResultsDao>();
    await dao.saveTestResult(testResult);
  }

  Future<void> _loadTestData() async {
    final String path = 'assets/tests/${widget.testId}.csv';
    final List<Question> loadedQuestions = [];

    try {
      final String csvData = await rootBundle.loadString(path);

      final List<List<dynamic>> csvTable = const CsvToListConverter().convert(
        csvData,
      );

      final dataRows = csvTable.skip(1);

      final groupedByQuestion = groupBy(dataRows, (row) => row[0].toString());

      for (final entry in groupedByQuestion.entries) {
        final String questionId = entry.key;
        final List<List<dynamic>> rows = entry.value;

        final String questionText = rows.first[1].toString();

        final List<Answer> answers = rows.map((row) {
          return Answer(
            id: row[2].toString(),
            text: row[3].toString(),
            score: int.tryParse(row[4].toString()) ?? 0,
          );
        }).toList();

        loadedQuestions.add(
          Question(id: questionId, text: questionText, answers: answers),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading or parsing CSV for testId ${widget.testId}: $e');
      }
    }

    setState(() {
      _questions = loadedQuestions;
      _totalQuestions = loadedQuestions.length;
      _currentQuestionIndex = 0;
    });
  }

  void _handleAnswerSelection(String? answerId) {
    if (answerId == null) return;
    setState(() {
      _selectedAnswers[_currentQuestion.id] = answerId;
    });
  }

  Future<void> _handleNext() async {
    if (_selectedAnswers.containsKey(_currentQuestion.id)) {
      if (_currentQuestionIndex < _questions!.length - 1) {
        setState(() {
          _currentQuestionIndex++;
        });
      } else {
        // Save the test result before navigating
        await _saveTestResult();

        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Test completed!')));
          context.go(
            TestResultScreenRoute(
              testId: widget.testId,
              completedAt: DateTime.now().millisecondsSinceEpoch,
            ).location,
          );
        }
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an answer.')));
    }
  }

  void _handleBack() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  // --- WIDGET BUILDERS ---

  PreferredSizeWidget _buildAppBarBottom() {
    if (_totalQuestions == 0) {
      return const PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: SizedBox.shrink(),
      );
    }

    final double progress = (_currentQuestionIndex + 1) / _totalQuestions;
    const padding = 24.0;

    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: Container(
        color: NepanikarColors.defaultPrimary,
        padding: const EdgeInsets.fromLTRB(padding, 8.0, padding, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // TODO: Lokalizovať Questions
              'Questions ${_currentQuestionIndex + 1} of $_totalQuestions',
              style: TextStyle(
                color: NepanikarColors.white.withValues(alpha: 0.9),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: NepanikarColors.white.withValues(alpha: 0.9),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFB794F6),
              ),
              minHeight: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizContent() {
    if (_questions == null || _currentQuestionIndex >= _questions!.length) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _currentQuestion.text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: NepanikarColors.dark,
          ),
        ),
        const SizedBox(height: 32),

        ..._currentQuestion.answers.map((answer) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AnswerOption(
              answerText: answer.text,
              isSelected: _selectedAnswers[_currentQuestion.id] == answer.id,
              onTap: () => _handleAnswerSelection(answer.id),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildFixedBottomButton(BuildContext context) {
    final bool isLastQuestion = _currentQuestionIndex == _totalQuestions - 1;
    final String buttonText = isLastQuestion
        ? 'Finish'
        : 'Next'; // TODO: Localize this
    final bool isFirstQuestion = _currentQuestionIndex == 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
      child: Row(
        children: [
          if (!isFirstQuestion)
            OutlinedButton(
              onPressed: _handleBack,
              style: OutlinedButton.styleFrom(
                foregroundColor: NepanikarColors.defaultPrimary,
                side: BorderSide(
                  color: NepanikarColors.defaultPrimary.withValues(alpha: 0.5),
                  width: 1.5,
                ),
                minimumSize: const Size(110, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // TODO: Localize
            ),

          if (!isFirstQuestion) const SizedBox(width: 16),

          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: _handleNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: NepanikarColors.defaultPrimary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Localize this
    if (_questions == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: NepanikarColors.defaultPrimary,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.testId, style: const TextStyle(color: Colors.white)),
        backgroundColor: NepanikarColors.defaultPrimary,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        elevation: 0,
        bottom: _buildAppBarBottom(),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 88.0),
              child: _buildQuizContent(),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFixedBottomButton(context),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.answerText,
    required this.isSelected,
    required this.onTap,
  });

  final String answerText;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected
              ? NepanikarColors.defaultPrimary.withValues(alpha: 0.05)
              : NepanikarColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? NepanikarColors.defaultPrimary
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? NepanikarColors.defaultPrimary
                      : Colors.grey.shade400,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: NepanikarColors.defaultPrimary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                answerText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? NepanikarColors.defaultPrimary
                      : NepanikarColors.dark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
