import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 1/3 — SPOKO recall (reveal-on-tap). Verbatim, source: tyzden-1.md §7.
class Day7RecallPage extends StatefulWidget {
  const Day7RecallPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _intro1 =
      'Máme za sebou první týden, který byl spíše zaměřený na seznamování se s '
      'tím, co se bude dít. Příští týdny už budou více praktičtější!';

  static const _intro2 =
      'Taky jsme se zaměřili na důležité oblasti života, které značně ovlivňují '
      'naši psychickou pohodu. Dokážeš si je vybavit?';

  // SPOKO areas (verbatim, source: tyzden-1.md §2 / §7 reveal list).
  static const _areas = <List<String>>[
    ['S', 'Spánek'],
    ['P', 'Potrava'],
    ['O', 'ne Omamným látkám'],
    ['K', 'Kondice'],
    ['O', 'léčba Onemocnění'],
  ];

  @override
  State<Day7RecallPage> createState() => _Day7RecallPageState();
}

class _Day7RecallPageState extends State<Day7RecallPage> {
  final Set<int> _revealed = {};

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: widget.onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'Shrnutí týdne',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            Day7RecallPage._intro1,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            Day7RecallPage._intro2,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Klepnutím odkryješ jednotlivé oblasti modelu SPOKO.',
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(Day7RecallPage._areas.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: _RevealCard(
                letter: Day7RecallPage._areas[i][0],
                word: Day7RecallPage._areas[i][1],
                revealed: _revealed.contains(i),
                onTap: () => setState(() => _revealed.add(i)),
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
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
