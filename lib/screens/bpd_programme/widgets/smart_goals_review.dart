import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goal_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Shows the SMART goals the user wrote in Week 1 and asks what to do with each
/// of them now — the "first week vs last week" loop the programme promises
/// (`docs/hpo/TODO.md` → GEN-02).
///
/// Unlike [StructuredWorksheet] the sections are not known at compile time:
/// there may be no goals at all, or several. Answers are keyed by the goal's
/// own record key, so a review stays attached to the goal it belongs to even if
/// the user later adds more.
///
/// Nothing here grades the user. The source asks them to look at what worked
/// and what did not, and explicitly says that not meeting a goal is fine — so
/// there is no done/not-done control, only an open field.
class SmartGoalsReview extends StatefulWidget {
  const SmartGoalsReview({
    super.key,
    required this.worksheetId,
    required this.fieldLabel,
    required this.emptyTitle,
    required this.emptyText,
  });

  final String worksheetId;
  final String fieldLabel;

  /// Shown when Week 1 left no goals behind.
  final String emptyTitle;
  final String emptyText;

  @override
  State<SmartGoalsReview> createState() => _SmartGoalsReviewState();
}

class _SmartGoalsReviewState extends State<SmartGoalsReview> {
  final _controllers = <String, TextEditingController>{};

  Map<String, BpdSmartGoal> _goals = const {};
  bool _isLoaded = false;
  Timer? _saveDebounce;

  BpdSmartGoalsDao get _goalsDao => registry.get<BpdSmartGoalsDao>();

  BpdWorksheetDao get _worksheetDao => registry.get<BpdWorksheetDao>();

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _saveDebounce?.cancel();
    // Flush whatever the debounce still held — people leave mid-sentence.
    unawaited(_save());
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final goals = await _goalsDao.getAllGoals();
    final saved = await _worksheetDao.getWorksheet(widget.worksheetId);
    if (!mounted) return;
    setState(() {
      _goals = goals;
      for (final key in goals.keys) {
        final controller = TextEditingController(text: saved[_fieldId(key)] ?? '')
          ..addListener(_scheduleSave);
        _controllers[key] = controller;
      }
      _isLoaded = true;
    });
  }

  String _fieldId(String goalKey) => 'goal_$goalKey';

  void _scheduleSave() {
    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(milliseconds: 500), () => unawaited(_save()));
  }

  Future<void> _save() async {
    if (!_isLoaded) return; // never overwrite stored answers with an empty form
    final answers = <String, String>{};
    _controllers.forEach((key, controller) => answers[_fieldId(key)] = controller.text);
    await _worksheetDao.saveWorksheet(worksheetId: widget.worksheetId, answers: answers);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_goals.isEmpty) {
      return InfoBox(
        icon: Icons.flag_outlined,
        title: widget.emptyTitle,
        text: widget.emptyText,
      );
    }

    final keys = _goals.keys.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < keys.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i == keys.length - 1 ? 0 : 20),
            child: _GoalCard(
              number: i + 1,
              goal: _goals[keys[i]]!,
              controller: _controllers[keys[i]]!,
              fieldLabel: widget.fieldLabel,
            ),
          ),
      ],
    );
  }
}

/// One goal from Week 1, with its five SMART lines and a field for what to do
/// with it now.
class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.number,
    required this.goal,
    required this.controller,
    required this.fieldLabel,
  });

  final int number;
  final BpdSmartGoal goal;
  final TextEditingController controller;
  final String fieldLabel;

  /// Letter, label and the value the user wrote in Week 1.
  ///
  /// The labels are copied from `week1/day1_onboarding/smart_intro_page.dart`
  /// on purpose — the user met "Adekvátní" and "Termínovaný" there, so calling
  /// the same fields "Dosažitelný" and "Časově ohraničený" here would read as a
  /// different model rather than their own goal coming back.
  List<(String, String, String)> get _lines => [
    ('S', 'Specifický', goal.specific),
    ('M', 'Měřitelný', goal.measurable),
    ('A', 'Adekvátní', goal.achievable),
    ('R', 'Relevantní', goal.relevant),
    ('T', 'Termínovaný', goal.timeBound),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    // Lines the user left blank in Week 1 are simply not shown — an empty row
    // under a letter reads as something the app lost.
    final filled = _lines.where((line) => line.$3.trim().isNotEmpty).toList();

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? Colors.white24 : NepanikarColors.purple200,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CÍL $number',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.7,
              color: isDarkMode ? Colors.white38 : NepanikarColors.dark.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 10),
          for (final line in filled)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(isDarkMode ? 0.3 : 0.12),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      line.$1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: isDarkMode ? Colors.white : primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.$2,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? Colors.white60
                                : NepanikarColors.dark.withOpacity(0.55),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          line.$3,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.45,
                            color: isDarkMode ? Colors.white : NepanikarColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 6),
          Text(
            fieldLabel,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 6),
          ReflectionField(controller: controller),
        ],
      ),
    );
  }
}
