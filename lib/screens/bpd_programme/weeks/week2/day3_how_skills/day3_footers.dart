import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_content.dart';
import 'package:nepanikar/screens/home/my_records/goals/my_goals_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goal_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Judgmental vs. non-judgmental example pairs, shown under the "Bez hodnocení"
/// pick-list (source: §3).
class NonJudgmentalExamples extends StatelessWidget {
  const NonJudgmentalExamples({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BEZ HODNOCENÍ MŮŽE VYPADAT TAKTO',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        ...week2NonJudgmentalExamples.map(
          (example) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ExampleLine(
                    label: 'Hodnotící',
                    text: example.judging,
                    color: NepanikarColors.error,
                    icon: Icons.close,
                  ),
                  const SizedBox(height: 10),
                  _ExampleLine(
                    label: 'Bez hodnocení',
                    text: example.describing,
                    color: NepanikarColors.progressGreen,
                    icon: Icons.check,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExampleLine extends StatelessWidget {
  const _ExampleLine({
    required this.label,
    required this.text,
    required this.color,
    required this.icon,
  });

  final String label;
  final String text;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
          child: Icon(icon, size: 13, color: color),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color),
              ),
              const SizedBox(height: 2),
              Text(
                '„$text“',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  fontStyle: FontStyle.italic,
                  color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Surfaces the SMART goal set in Week 1, so "Efektivně" can be checked against
/// it: "Zkus se zaměřit na to, jestli je tvoje chování efektivní vůči SMART
/// cílům, co jsme spolu nastavili na začátku programu." (source: §3)
class SmartGoalReminder extends StatefulWidget {
  const SmartGoalReminder({super.key});

  @override
  State<SmartGoalReminder> createState() => _SmartGoalReminderState();
}

class _SmartGoalReminderState extends State<SmartGoalReminder> {
  BpdSmartGoal? _goal;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGoal();
  }

  Future<void> _loadGoal() async {
    final goals = await registry.get<BpdSmartGoalsDao>().getAllGoals();
    if (!mounted) return;
    final newestFirst = goals.values.toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    setState(() {
      _goal = newestFirst.isEmpty ? null : newestFirst.first;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox.shrink();

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final goal = _goal;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.track_changes, color: primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Tvůj SMART cíl',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Zkus se zaměřit na to, jestli je tvoje chování efektivní vůči '
            'SMART cílům, co jsme spolu nastavili na začátku programu.',
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          if (goal != null) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                goal.specific,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
          ],
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => context.push(const MyGoalsRoute().location),
              style: TextButton.styleFrom(
                foregroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
              child: Text(
                goal == null ? 'Nastavit SMART cíl' : 'Otevřít moje cíle',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
