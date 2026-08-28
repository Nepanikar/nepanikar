import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/worksheet_parts.dart';
import 'package:nepanikar/services/db/bpd/bpd_worksheet_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// One input of a [StructuredWorksheet].
///
/// [id] is what the answer is stored under, so it must stay stable once the
/// worksheet has shipped — renaming it orphans whatever the user already wrote.
class WorksheetField {
  const WorksheetField({required this.id, required this.label, this.hint, this.example});

  final String id;
  final String label;
  final String? hint;

  /// Per-field worked example, revealed on tap. Day 1's myth-busting exercise
  /// uses this: the author wrote a counter-statement for every myth.
  final String? example;
}

/// How a section is presented.
enum WorksheetSectionStyle {
  /// Numbered step — the default, used by the Day 2 and Day 3 worksheets.
  numbered,

  /// A quoted, muted card. Used for the myths so the app never looks like it
  /// endorses the statement the user is asked to argue against.
  myth,
}

/// A numbered block of a worksheet. A block can hold several fields, which is
/// how the source writes steps like "Předpokládám nějakou hrozbu?" — one
/// heading followed by three questions.
class WorksheetSection {
  const WorksheetSection({
    required this.title,
    required this.fields,
    this.intro,
    this.style = WorksheetSectionStyle.numbered,
  });

  final String title;
  final WorksheetSectionStyle style;

  /// Optional sentence between the heading and the fields (e.g. the guidance
  /// "Soustřeď se na fakta, která jsi opravdu pozoroval/a").
  final String? intro;

  final List<WorksheetField> fields;
}

/// The programme's long-form worksheets (Week 3 Day 2 and Day 3).
///
/// Autosaves edits within half a second and reloads on open, because these are
/// the two biggest forms in the programme and nobody fills ten fields about a
/// painful situation in one sitting. [exampleTitle]/[example] render a
/// collapsible worked example — the source supplies one for Day 2.
class StructuredWorksheet extends StatefulWidget {
  const StructuredWorksheet({
    super.key,
    required this.worksheetId,
    required this.sections,
    this.example,
    this.exampleTitle = 'Zobrazit příklad',
    this.exampleNote,
    this.visibleSectionLimit,
    this.revealMoreLabel,
  });

  final String worksheetId;
  final List<WorksheetSection> sections;

  /// Show only the first N sections, with a button to reveal the rest.
  ///
  /// Day 1 has twenty myths; asking for twenty written answers in one sitting
  /// blows past the "5–20 minutes a day" the programme promises, so the user is
  /// offered a handful and can opt into the remainder. Answers to hidden
  /// sections are still loaded and saved, so nothing is lost either way.
  final int? visibleSectionLimit;
  final String? revealMoreLabel;

  /// Worked example as (label, text) pairs, revealed on tap.
  final List<(String, String)>? example;
  final String exampleTitle;

  /// Shown under the example — used to mark copy that the author has not
  /// approved yet.
  final String? exampleNote;

  @override
  State<StructuredWorksheet> createState() => _StructuredWorksheetState();
}

class _StructuredWorksheetState extends State<StructuredWorksheet> {
  final _controllers = <String, TextEditingController>{};
  final _openFieldExamples = <String>{};
  bool _isExampleOpen = false;
  bool _isFullListRevealed = false;

  BpdWorksheetDao get _dao => registry.get<BpdWorksheetDao>();

  @override
  void initState() {
    super.initState();
    for (final section in widget.sections) {
      for (final field in section.fields) {
        _controllers[field.id] = TextEditingController();
      }
    }
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final saved = await _dao.getWorksheet(widget.worksheetId);
    if (!mounted) return;
    saved.forEach((fieldId, text) {
      final controller = _controllers[fieldId];
      // Never clobber something the user already started typing — the read is
      // async, so on a slow device they can beat it to the field.
      if (controller != null && controller.text.isEmpty) controller.text = text;
    });
    for (final controller in _controllers.values) {
      controller.addListener(_scheduleSave);
    }
  }

  void _scheduleSave() => _saveDebounce.run(_save);
  final _saveDebounce = _Debouncer(const Duration(milliseconds: 500));

  Future<void> _save() => _dao.saveWorksheet(
    worksheetId: widget.worksheetId,
    answers: _controllers.map((id, controller) => MapEntry(id, controller.text)),
  );

  @override
  void dispose() {
    _saveDebounce.cancel();
    for (final controller in _controllers.values) {
      controller.removeListener(_scheduleSave);
    }
    // Fire and forget — the DAO outlives this widget, and the user may be
    // leaving mid-sentence.
    _save();
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  /// How many sections to render right now.
  int get _visibleCount {
    final limit = widget.visibleSectionLimit;
    if (limit == null || _isFullListRevealed) return widget.sections.length;
    return limit.clamp(0, widget.sections.length);
  }

  @override
  Widget build(BuildContext context) {
    final visibleCount = _visibleCount;
    final hiddenCount = widget.sections.length - visibleCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.example != null) ...[_buildExample(), const SizedBox(height: 20)],
        ...List.generate(visibleCount, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: _buildSection(widget.sections[i], i + 1),
          );
        }),
        if (hiddenCount > 0) _buildRevealMore(hiddenCount),
      ],
    );
  }

  Widget _buildRevealMore(int hiddenCount) {
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => setState(() => _isFullListRevealed = true),
        icon: const Icon(Icons.add, size: 18),
        label: Text(widget.revealMoreLabel ?? 'Chci pokračovat (dalších $hiddenCount)'),
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor.withOpacity(0.4)),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildSection(WorksheetSection section, int number) {
    final isOpen = _openFieldExamples.contains;
    void toggle(String fieldId) => setState(() {
      _openFieldExamples.contains(fieldId)
          ? _openFieldExamples.remove(fieldId)
          : _openFieldExamples.add(fieldId);
    });

    return switch (section.style) {
      WorksheetSectionStyle.myth => WorksheetMythSection(
        section: section,
        controllers: _controllers,
        isExampleOpen: isOpen,
        onToggleExample: toggle,
      ),
      WorksheetSectionStyle.numbered => WorksheetNumberedSection(
        section: section,
        number: number,
        controllers: _controllers,
        isExampleOpen: isOpen,
        onToggleExample: toggle,
      ),
    };
  }

  Widget _buildExample() => WorksheetExampleCard(
    title: widget.exampleTitle,
    entries: widget.example!,
    note: widget.exampleNote,
    isOpen: _isExampleOpen,
    onToggle: () => setState(() => _isExampleOpen = !_isExampleOpen),
  );
}

/// Collapses a burst of keystrokes into a single write.
///
/// Throttle rather than debounce on purpose: the first keystroke opens a window
/// and the write happens when it closes, reading whatever is in the fields at
/// that moment. Any keystroke after a window closes opens a new one, so the
/// user's last edit is always written within [delay] — a true debounce would
/// keep postponing the write for as long as they keep typing.
class _Debouncer {
  _Debouncer(this.delay);

  final Duration delay;
  Future<void>? _pending;
  bool _isCancelled = false;

  void run(Future<void> Function() action) {
    if (_pending != null) return;
    _pending = Future<void>.delayed(delay).then((_) {
      _pending = null;
      if (!_isCancelled) return action();
    });
  }

  void cancel() => _isCancelled = true;
}
