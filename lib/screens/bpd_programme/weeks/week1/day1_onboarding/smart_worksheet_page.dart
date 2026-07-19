import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/smart_goal_fields.dart';

/// Page 9/10 — SMART worksheet (verbatim, source: tyzden-1.md §1, Pracovní list).
class Day1SmartWorksheetPage extends StatelessWidget {
  const Day1SmartWorksheetPage({super.key, required this.onComplete, required this.controllers});

  final VoidCallback onComplete;

  /// Five controllers in S, M, A, R, T order.
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Dokončit den',
      onButtonPressed: onComplete,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(icon: Icons.flag_outlined, title: 'Můj SMART cíl'),
          const SizedBox(height: 10),
          Text(
            'Doplň, čeho přesně chceš dosáhnout. Klepni na „příklad" pro '
            'inspiraci.',
            style: TextStyle(
              fontSize: 13.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 20),
          SmartGoalFields(controllers: controllers),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
