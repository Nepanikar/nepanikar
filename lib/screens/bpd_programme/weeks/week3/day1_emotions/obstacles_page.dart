import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 3/7 — the six reasons emotional regulation is hard.
///
/// Ends on the source's own reassurance, which has to stay on this page: a list
/// of six ways you are set up to fail should never be the last thing the user
/// reads before the screen changes.
class Week3ObstaclesPage extends StatelessWidget {
  const Week3ObstaclesPage({super.key, required this.onNext});

  final VoidCallback onNext;

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
            icon: Icons.filter_alt_outlined,
            title: 'Proč je regulace těžká',
          ),
          const SizedBox(height: 12),
          Text(
            'Regulace emocí může být těžká z více důvodů:',
            style: TextStyle(
              fontSize: 16,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(day1Obstacles.length, (i) {
            final (title, description) = day1Obstacles[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NumberedBenefit(
                number: '${i + 1}',
                title: title,
                description: description,
              ),
            );
          }),
          const SizedBox(height: 10),
          const InfoBox(
            icon: Icons.emoji_objects_outlined,
            title: 'Dobrá zpráva',
            text: day1ObstaclesGoodNews,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
