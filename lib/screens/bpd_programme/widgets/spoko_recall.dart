import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// The five areas of the SPOKO model (verbatim, source: tyzden-1.md §2).
///
/// Single definition on purpose: Week 1 Day 7 and Week 3 Day 5 both ask the user
/// to recall them, and two copies of the letters would eventually disagree.
const spokoAreas = <(String, String)>[
  ('S', 'Spánek'),
  ('P', 'Potrava'),
  ('O', 'ne Omamným látkám'),
  ('K', 'Kondice'),
  ('O', 'léčba Onemocnění'),
];

/// Recall exercise: five covered cards the user taps to reveal.
///
/// Recall before reveal is the point — the user is meant to try to remember,
/// which is why the areas are hidden rather than simply listed.
class SpokoRecallList extends StatefulWidget {
  const SpokoRecallList({
    super.key,
    this.hint = 'Klepnutím odkryješ jednotlivé oblasti modelu SPOKO.',
  });

  final String hint;

  @override
  State<SpokoRecallList> createState() => _SpokoRecallListState();
}

class _SpokoRecallListState extends State<SpokoRecallList> {
  final Set<int> _revealed = {};

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint,
          style: TextStyle(
            fontSize: 13,
            color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 14),
        ...List.generate(spokoAreas.length, (i) {
          final (letter, word) = spokoAreas[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: _RevealCard(
              letter: letter,
              word: word,
              revealed: _revealed.contains(i),
              onTap: () => setState(() => _revealed.add(i)),
            ),
          );
        }),
      ],
    );
  }
}

class _RevealCard extends StatelessWidget {
  const _RevealCard({
    required this.letter,
    required this.word,
    required this.revealed,
    required this.onTap,
  });

  final String letter;
  final String word;
  final bool revealed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    if (!revealed) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: primaryColor.withOpacity(0.3), width: 1.5),
          ),
          child: Center(
            child: Text(
              '? klepni pro odkrytí',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Colors.white54 : primaryColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.06) : primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                letter,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              word,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
