import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/smart_goal_fields.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'smart_goal_form_screen.g.dart';

@TypedGoRoute<SmartGoalFormRoute>(path: '/home/my-records/goals/new')
class SmartGoalFormRoute extends GoRouteData with $SmartGoalFormRoute {
  const SmartGoalFormRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SmartGoalFormScreen();
}

/// Standalone SMART goal creation, reachable from "Moje cíle". Uses the same
/// fields as the Day 1 worksheet and saves a new goal on submit.
class SmartGoalFormScreen extends StatefulWidget {
  const SmartGoalFormScreen({super.key});

  @override
  State<SmartGoalFormScreen> createState() => _SmartGoalFormScreenState();
}

class _SmartGoalFormScreenState extends State<SmartGoalFormScreen> {
  final _controllers = List.generate(5, (_) => TextEditingController());

  BpdSmartGoalsDao get _dao => registry.get<BpdSmartGoalsDao>();

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final values = _controllers.map((c) => c.text.trim()).toList();
    if (values.every((v) => v.isEmpty)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vyplň alespoň jedno pole.')));
      return;
    }
    await _dao.createGoal(
      specific: values[0],
      measurable: values[1],
      achievable: values[2],
      relevant: values[3],
      timeBound: values[4],
    );
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Nový SMART cíl')),
      body: SafeArea(
        child: DayPageBase(
          buttonText: 'Uložit cíl',
          onButtonPressed: _save,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                'Doplň, čeho přesně chceš dosáhnout. Klepni na „příklad" pro '
                'inspiraci.',
                style: TextStyle(
                  fontSize: 13.5,
                  color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
                ),
              ),
              const SizedBox(height: 20),
              SmartGoalFields(controllers: _controllers),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
