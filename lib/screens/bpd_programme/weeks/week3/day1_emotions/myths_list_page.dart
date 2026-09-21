import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Pages 4/7 and 5/7 — the twenty myths about emotions, ten at a time.
///
/// Every myth is presented as a muted, quoted card under a "MÝTUS" label. These
/// are statements like "Drama je cool" and "Mé emoce jsou tím, kým jsem"; a
/// reader skimming the page must never be able to mistake them for the app's
/// own advice.
class Week3MythsListPage extends StatelessWidget {
  const Week3MythsListPage({
    super.key,
    required this.startIndex,
    required this.endIndex,
    required this.onNext,
    required this.isFirstHalf,
  });

  /// Inclusive start, exclusive end, into [day1Myths].
  final int startIndex;
  final int endIndex;
  final bool isFirstHalf;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final myths = day1Myths.sublist(startIndex, endIndex);

    return DayPageBase(
      buttonText: isFirstHalf ? 'Další mýty' : 'Zkusit je zbořit',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          SectionHeader(
            icon: Icons.help_outline,
            title: 'Mýty o emocích',
            subtitle: '${startIndex + 1}–$endIndex z ${day1Myths.length}',
          ),
          const SizedBox(height: 12),
          if (isFirstHalf)
            Text(
              'Tohle jsou věty, které o emocích slýcháme nebo si je říkáme '
              'sami. Žádná z nich není pravda — projdi si je a všimni si, '
              'jestli některou neznáš i od sebe.',
              style: TextStyle(
                fontSize: 15,
                height: 1.55,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
              ),
            ),
          if (isFirstHalf) const SizedBox(height: 16),
          ...List.generate(myths.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _MythTile(number: startIndex + i + 1, text: myths[i].myth),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _MythTile extends StatelessWidget {
  const _MythTile({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDarkMode ? Colors.white12 : Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: isDarkMode ? Colors.white38 : Colors.grey.shade500,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '„$text"',
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                fontStyle: FontStyle.italic,
                color: isDarkMode ? Colors.white60 : Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
