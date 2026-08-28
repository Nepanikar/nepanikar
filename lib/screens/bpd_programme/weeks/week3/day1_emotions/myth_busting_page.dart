import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

/// Page 6/7 — the exercise: write your own sentence that breaks each myth.
///
/// The source expects all twenty. Twenty free-text answers in one day is far
/// past the "5–20 minut denně" the programme promises, so five are offered and
/// the rest are one tap away; answers to all twenty persist either way, so the
/// user can keep chipping at them on later visits.
class Week3MythBustingPage extends StatelessWidget {
  const Week3MythBustingPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const worksheetId = 'week3_day1_myths';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.construction_outlined,
            title: 'Boření mýtů',
          ),
          const SizedBox(height: 12),
          Text(
            day1MythExerciseLead,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.5,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            day1MythExerciseHelp,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 18),
          StructuredWorksheet(
            worksheetId: worksheetId,
            visibleSectionLimit: day1MythsOfferedCount,
            revealMoreLabel: 'Chci zbořit i ostatní mýty',
            sections: List.generate(day1Myths.length, (i) {
              final myth = day1Myths[i];
              return WorksheetSection(
                title: myth.myth,
                style: WorksheetSectionStyle.myth,
                fields: [
                  WorksheetField(
                    id: 'myth_$i',
                    label: day1MythFieldLabel,
                    example: myth.busted,
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
