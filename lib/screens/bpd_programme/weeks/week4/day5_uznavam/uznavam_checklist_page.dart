import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/day5_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/selectable_exercise_tile.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenges_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// A page of the UZNÁVÁM checklist — several lettered groups, each persisted
/// under its own section key.
///
/// Not `SkillPracticePage`: that one teaches a single skill and then asks the
/// user to pick at least two exercises *to do*. This is the other way round —
/// several groups at once, and the ticks record what the user has **already
/// tried**. So there is no minimum, no counter target, and ticking nothing is
/// a perfectly good answer.
class UznavamChecklistPage extends StatefulWidget {
  const UznavamChecklistPage({
    super.key,
    required this.title,
    required this.groups,
    required this.onNext,
    this.showLead = true,
  });

  final String title;
  final List<UznavamGroup> groups;

  /// The lead sentence only makes sense above the first page.
  final bool showLead;

  final VoidCallback onNext;

  @override
  State<UznavamChecklistPage> createState() => _UznavamChecklistPageState();
}

class _UznavamChecklistPageState extends State<UznavamChecklistPage> {
  /// Ticked items per section key.
  final Map<String, Set<String>> _selected = {};

  BpdChallengesDao get _challengesDao => registry.get<BpdChallengesDao>();

  @override
  void initState() {
    super.initState();
    for (final group in widget.groups) {
      _selected[group.sectionKey] = <String>{};
    }
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    for (final group in widget.groups) {
      final saved = await _challengesDao.getSelectedChallenges(
        weekNumber: 4,
        dayNumber: 5,
        section: group.sectionKey,
      );
      if (!mounted) return;
      if (saved.isNotEmpty) {
        setState(() => _selected[group.sectionKey]!.addAll(saved));
      }
    }
  }

  void _toggle(String sectionKey, String item) {
    setState(() {
      final set = _selected[sectionKey]!;
      if (!set.remove(item)) set.add(item);
    });
    // Write straight away rather than only on Pokračovat: a checklist people
    // come back to during the day must not lose ticks when they close the app
    // mid-list.
    _save(sectionKey);
  }

  Future<void> _save(String sectionKey) => _challengesDao.saveSelectedChallenges(
    weekNumber: 4,
    dayNumber: 5,
    section: sectionKey,
    items: _selected[sectionKey]!.toList(),
  );

  Future<void> _onContinue() async {
    for (final group in widget.groups) {
      await _save(group.sectionKey);
    }
    widget.onNext();
  }

  int get _tickedCount => _selected.values.fold(0, (sum, set) => sum + set.length);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: _onContinue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SectionHeader(
            icon: Icons.checklist_rtl,
            title: widget.title,
            subtitle: 'Den 5 • Týden 4',
          ),
          if (widget.showLead) ...[
            const SizedBox(height: 16),
            Text(
              day5ChecklistLead,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ],
          const SizedBox(height: 12),
          PickCounterHint(picked: _tickedCount, minimum: 0, label: 'Označeno:'),
          ...widget.groups.map(_buildGroup),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildGroup(UznavamGroup group) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final selected = _selected[group.sectionKey]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                group.letter,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                group.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...group.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SelectableExerciseTile(
              title: item,
              selected: selected.contains(item),
              onTap: () => _toggle(group.sectionKey, item),
            ),
          ),
        ),
      ],
    );
  }
}
