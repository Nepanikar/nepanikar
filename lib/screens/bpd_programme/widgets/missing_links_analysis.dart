import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/worksheet_parts.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// One link of a [MissingLinksAnalysis] chain.
///
/// [id] is what the yes/no answer is stored under, so it must stay stable once
/// shipped — the same rule as [WorksheetField.id].
class MissingLinkStep {
  const MissingLinkStep({
    required this.id,
    required this.question,
    required this.fields,
    this.asksYesNo = true,
  });

  final String id;
  final String question;

  /// Shown when the answer is "ne" — or immediately, when [asksYesNo] is false.
  final List<WorksheetField> fields;

  /// The last step of the Week 5 chain ("Co ti zabránilo to udělat hned?") is
  /// phrased as an open question, not a yes/no one, so it renders its fields
  /// straight away and ends the chain.
  final bool asksYesNo;
}

/// "Analýza chybějících článků" — Week 5, Day 1.
///
/// A chain rather than a form: each question is asked only if the previous one
/// was answered "ano", and an "ne" opens two text fields and stops. That
/// branching is the exercise — a flat list of all seven fields would ask people
/// about obstacles they did not hit and lose the point of finding the *missing*
/// link.
///
/// Answers persist through the existing [BpdWorksheetDao]: the free text under
/// its field id, the yes/no answers under the step id as `ano`/`ne`. No new
/// store and no migration — the DAO is already a `Map<String, String>`.
///
/// Nothing is required and no answer is "wrong": the page never grades, and the
/// day's button stays enabled whatever the user does here.
class MissingLinksAnalysis extends StatefulWidget {
  const MissingLinksAnalysis({super.key, required this.worksheetId, required this.steps});

  final String worksheetId;
  final List<MissingLinkStep> steps;

  @override
  State<MissingLinksAnalysis> createState() => _MissingLinksAnalysisState();
}

class _MissingLinksAnalysisState extends State<MissingLinksAnalysis> {
  static const _yes = 'ano';
  static const _no = 'ne';

  final _controllers = <String, TextEditingController>{};
  final _answers = <String, String>{};
  final _openExamples = <String>{};

  /// Steps the user has collapsed back down after answering.
  final _expanded = <String>{};

  Timer? _saveDebounce;
  bool _isLoaded = false;

  BpdWorksheetDao get _worksheetDao => registry.get<BpdWorksheetDao>();

  @override
  void initState() {
    super.initState();
    for (final step in widget.steps) {
      for (final field in step.fields) {
        _controllers[field.id] = TextEditingController()..addListener(_scheduleSave);
      }
    }
    unawaited(_load());
  }

  @override
  void dispose() {
    _saveDebounce?.cancel();
    // Flush whatever the debounce was still holding, or the last keystrokes
    // before leaving the page are lost.
    unawaited(_save());
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final saved = await _worksheetDao.getWorksheet(widget.worksheetId);
    if (!mounted) return;
    setState(() {
      for (final step in widget.steps) {
        final answer = saved[step.id];
        if (answer == _yes || answer == _no) _answers[step.id] = answer!;
        for (final field in step.fields) {
          final text = saved[field.id];
          if (text != null) _controllers[field.id]!.text = text;
        }
      }
      _isLoaded = true;
    });
  }

  void _scheduleSave() {
    _saveDebounce?.cancel();
    _saveDebounce = Timer(const Duration(milliseconds: 500), () => unawaited(_save()));
  }

  Future<void> _save() async {
    if (!_isLoaded) return; // never overwrite stored answers with an empty form
    final answers = <String, String>{..._answers};
    _controllers.forEach((fieldId, controller) => answers[fieldId] = controller.text);
    await _worksheetDao.saveWorksheet(worksheetId: widget.worksheetId, answers: answers);
  }

  void _answer(MissingLinkStep step, String value) {
    setState(() {
      _answers[step.id] = value;
      // Switching an answer hides the branch but keeps what was written there —
      // people change their mind mid-chain and should not lose a paragraph for it.
      _expanded.remove(step.id);
    });
    unawaited(_save());
  }

  /// A step is asked once every step before it has been answered "ano".
  int get _visibleStepCount {
    var count = 0;
    for (final step in widget.steps) {
      count++;
      if (!step.asksYesNo) break;
      if (_answers[step.id] != _yes) break;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final visible = widget.steps.take(_visibleStepCount).toList();
    final lastId = visible.last.id;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < visible.length; i++) ...[
          if (i > 0) _ChainDivider(label: '${i + 1} ze ${widget.steps.length}'),
          _StepCard(
            step: visible[i],
            index: i,
            total: widget.steps.length,
            answer: _answers[visible[i].id],
            // Only the step being worked on stays open; earlier ones collapse to
            // a single line so the chain stays readable on a phone.
            isCollapsed:
                visible[i].id != lastId &&
                _answers[visible[i].id] != null &&
                !_expanded.contains(visible[i].id),
            onToggleCollapsed: () => setState(() {
              _expanded.contains(visible[i].id)
                  ? _expanded.remove(visible[i].id)
                  : _expanded.add(visible[i].id);
            }),
            onAnswer: (value) => _answer(visible[i], value),
            controllers: _controllers,
            isExampleOpen: _openExamples.contains,
            onToggleExample: (fieldId) => setState(() {
              _openExamples.contains(fieldId)
                  ? _openExamples.remove(fieldId)
                  : _openExamples.add(fieldId);
            }),
          ),
        ],
      ],
    );
  }
}

/// One question card: the question, an Ano/Ne switch, and the branch it opens.
class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.index,
    required this.total,
    required this.answer,
    required this.isCollapsed,
    required this.onToggleCollapsed,
    required this.onAnswer,
    required this.controllers,
    required this.isExampleOpen,
    required this.onToggleExample,
  });

  final MissingLinkStep step;
  final int index;
  final int total;
  final String? answer;
  final bool isCollapsed;
  final VoidCallback onToggleCollapsed;
  final void Function(String value) onAnswer;
  final Map<String, TextEditingController> controllers;
  final bool Function(String fieldId) isExampleOpen;
  final void Function(String fieldId) onToggleExample;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    if (isCollapsed) {
      return InkWell(
        onTap: onToggleCollapsed,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.07) : NepanikarColors.purple200,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  step.question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.4,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                answer == 'ano' ? 'Ano' : 'Ne',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: isDarkMode ? Colors.white : primaryColor,
                ),
              ),
              Icon(
                Icons.expand_more,
                size: 18,
                color: isDarkMode ? Colors.white70 : primaryColor,
              ),
            ],
          ),
        ),
      );
    }

    final showsFields = !step.asksYesNo || answer == 'ne';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? Colors.white24 : NepanikarColors.purple200,
          width: 1.5,
        ),
        boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OTÁZKA ${index + 1} Z $total',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.7,
              color: isDarkMode ? Colors.white38 : NepanikarColors.dark.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            step.question,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              height: 1.35,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          if (step.asksYesNo) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _AnswerButton(label: 'Ano', isOn: answer == 'ano', onTap: () => onAnswer('ano'))),
                const SizedBox(width: 10),
                Expanded(child: _AnswerButton(label: 'Ne', isOn: answer == 'ne', onTap: () => onAnswer('ne'))),
              ],
            ),
          ],
          if (showsFields) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.only(left: 13),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: isDarkMode ? Colors.white24 : NepanikarColors.purple200,
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final field in step.fields) ...[
                    Text(
                      field.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 6),
                    ReflectionField(
                      controller: controllers[field.id]!,
                      hintText: field.hint ?? 'Napiš sem…',
                    ),
                    // The source's "(např. …)" hints live here, not in the
                    // placeholder: a placeholder vanishes the moment someone
                    // starts typing, which is exactly when they need the list.
                    if (field.example != null)
                      WorksheetFieldExample(
                        example: field.example!,
                        isOpen: isExampleOpen(field.id),
                        onToggle: () => onToggleExample(field.id),
                      ),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({required this.label, required this.isOn, required this.onTap});

  final String label;
  final bool isOn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isOn ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: isOn
                ? primaryColor
                : (isDarkMode ? Colors.white38 : NepanikarColors.purple200),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: isOn ? Colors.white : (isDarkMode ? Colors.white : primaryColor),
          ),
        ),
      ),
    );
  }
}

/// Marks where the chain moves on, so it reads as one thread of questions
/// rather than a stack of unrelated cards.
class _ChainDivider extends StatelessWidget {
  const _ChainDivider({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final line = isDarkMode ? Colors.white24 : NepanikarColors.purple200;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: line)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white38 : NepanikarColors.dark.withOpacity(0.42),
              ),
            ),
          ),
          Expanded(child: Container(height: 1, color: line)),
        ],
      ),
    );
  }
}
