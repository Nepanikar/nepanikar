import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/home/my_records/goals/smart_goal_form_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goal_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'my_goals_screen.g.dart';

@TypedGoRoute<MyGoalsRoute>(path: '/home/my-records/goals')
class MyGoalsRoute extends GoRouteData with $MyGoalsRoute {
  const MyGoalsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MyGoalsScreen();
}

/// "Moje cíle" — the SMART goals the user wrote down in the DBT programme
/// (Week 1 Day 1 worksheet and any later ones), read-only with removal.
class MyGoalsScreen extends StatelessWidget {
  const MyGoalsScreen({super.key});

  BpdSmartGoalsDao get _dao => registry.get<BpdSmartGoalsDao>();

  Future<void> _delete(BuildContext context, String goalKey) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.dbt_goal_remove_title),
        content: Text(context.l10n.dbt_goal_remove_description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(context.l10n.dbt_remove),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _dao.deleteGoal(goalKey);
  }

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.dbt_goals,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(const SmartGoalFormRoute().location),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.dbt_goal_new),
      ),
      children: [
        StreamBuilder<Map<String, BpdSmartGoal>>(
          stream: _dao.watchAllGoals(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final goals = snapshot.data ?? {};
            if (goals.isEmpty) return const _EmptyState();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top padding clears the 50px colored strip the wrapper
                // paints behind the page content.
                Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 14),
                  child: Text(
                    context.l10n.dbt_goals_intro,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : NepanikarColors.dark,
                    ),
                  ),
                ),
                ...goals.entries.map(
                  (e) => _GoalCard(goal: e.value, onDelete: () => _delete(context, e.key)),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal, required this.onDelete});

  final BpdSmartGoal goal;
  final VoidCallback onDelete;

  /// SMART letters with the worksheet questions they answer
  /// (kept in sync with the Day 1 SMART worksheet).
  static const _fieldLabels = <(String, String)>[
    ('S', 'Co konkrétně chci dokázat?'),
    ('M', 'Jak poznám, že je cíl splněný?'),
    ('A', 'Je to pro mě reálně zvládnutelné? Jak?'),
    ('R', 'Proč je to pro mě důležité?'),
    ('T', 'Do kdy chci cíle dosáhnout?'),
  ];

  List<String> get _fieldValues => [
    goal.specific,
    goal.measurable,
    goal.achievable,
    goal.relevant,
    goal.timeBound,
  ];

  String _createdLabel(BuildContext context) =>
      DateFormat.yMd(Localizations.localeOf(context).toString()).format(goal.createdAt);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;
    final values = _fieldValues;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : primaryColor.withOpacity(0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      context.l10n.dbt_goal_created(_createdLabel(context)),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              _CardMenu(onDelete: onDelete),
            ],
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < _fieldLabels.length; i++)
            if (values[i].isNotEmpty)
              _GoalField(
                letter: _fieldLabels[i].$1,
                label: _fieldLabels[i].$2,
                value: values[i],
                textColor: textColor,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
              ),
        ],
      ),
    );
  }
}

class _GoalField extends StatelessWidget {
  const _GoalField({
    required this.letter,
    required this.label,
    required this.value,
    required this.textColor,
    required this.primaryColor,
    required this.isDarkMode,
  });

  final String letter;
  final String label;
  final String value;
  final Color textColor;
  final Color primaryColor;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    letter,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.55),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardMenu extends StatelessWidget {
  const _CardMenu({required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == 'delete') onDelete();
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'delete', child: Text(context.l10n.dbt_goal_remove)),
      ],
      // A plain child (instead of `icon:`) avoids the built-in 48px IconButton
      // box, so the dots hug the card's right edge.
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Icon(
          Icons.more_vert,
          size: 20,
          color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.5),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.track_changes, size: 40, color: primaryColor),
          ),
          const SizedBox(height: 20),
          Text(
            context.l10n.dbt_goals_empty_title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.dbt_goals_empty_description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
