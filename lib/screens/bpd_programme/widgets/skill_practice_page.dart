import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/selectable_exercise_tile.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenges_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// One exercise offered in a skill's practice menu.
@immutable
class PracticeExercise {
  const PracticeExercise({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;
}

/// Content of one skill section — the data behind a [SkillPracticePage].
@immutable
class SkillSectionData {
  const SkillSectionData({
    required this.sectionKey,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.educationParagraphs,
    required this.pickLead,
    required this.exercises,
  });

  final String sectionKey;
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> educationParagraphs;
  final String pickLead;
  final List<PracticeExercise> exercises;
}

/// A mindfulness skill page: short education, then a pick-list of exercises the
/// user chooses from ("Vyber si alespoň dvě cvičení z nabídky").
///
/// Shared by Week 2 Day 2 (Co dovednosti) and Day 3 (Jak dovednosti) — six pages
/// with the same shape. Picks are persisted per week + day + [sectionKey] via
/// [BpdChallengesDao], so re-opening the day shows what was already chosen.
class SkillPracticePage extends StatefulWidget {
  const SkillPracticePage({
    super.key,
    required this.weekNumber,
    required this.dayNumber,
    required this.sectionKey,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.educationParagraphs,
    required this.pickLead,
    required this.exercises,
    required this.onNext,
    this.minimumPicks = 2,
    this.footer,
  });

  final int weekNumber;
  final int dayNumber;

  /// Distinguishes this page's picks from the other sections of the same day.
  final String sectionKey;

  final IconData icon;
  final String title;

  /// e.g. "Co dovednost 1/3".
  final String subtitle;

  final List<String> educationParagraphs;

  /// Instruction above the pick-list, verbatim from the programme source.
  final String pickLead;

  final List<PracticeExercise> exercises;
  final int minimumPicks;

  /// Extra content below the pick-list (example pairs, a SMART goal reminder…).
  final Widget? footer;

  final VoidCallback onNext;

  @override
  State<SkillPracticePage> createState() => _SkillPracticePageState();
}

class _SkillPracticePageState extends State<SkillPracticePage> {
  final Set<String> _selected = {};

  BpdChallengesDao get _challengesDao => registry.get<BpdChallengesDao>();

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final saved = await _challengesDao.getSelectedChallenges(
      weekNumber: widget.weekNumber,
      dayNumber: widget.dayNumber,
      section: widget.sectionKey,
    );
    if (mounted && saved.isNotEmpty) {
      setState(() => _selected.addAll(saved));
    }
  }

  void _toggle(String title) {
    setState(() {
      if (!_selected.remove(title)) _selected.add(title);
    });
  }

  Future<void> _onContinue() async {
    await _challengesDao.saveSelectedChallenges(
      weekNumber: widget.weekNumber,
      dayNumber: widget.dayNumber,
      section: widget.sectionKey,
      items: _selected.toList(),
    );
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85);

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: _onContinue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SectionHeader(icon: widget.icon, title: widget.title, subtitle: widget.subtitle),
          const SizedBox(height: 18),
          ...widget.educationParagraphs.map(
            (paragraph) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                paragraph,
                style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.pickLead,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          PickCounterHint(picked: _selected.length, minimum: widget.minimumPicks),
          const SizedBox(height: 12),
          ...widget.exercises.map(
            (exercise) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SelectableExerciseTile(
                title: exercise.title,
                description: exercise.description,
                icon: exercise.icon,
                selected: _selected.contains(exercise.title),
                onTap: () => _toggle(exercise.title),
              ),
            ),
          ),
          if (widget.footer != null) ...[const SizedBox(height: 20), widget.footer!],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
