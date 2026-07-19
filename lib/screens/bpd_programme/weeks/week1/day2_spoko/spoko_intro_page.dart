import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 1/4 — SPOKO model intro, today = Spánek (verbatim, source: tyzden-1.md §2).
class Day2SpokoIntroPage extends StatelessWidget {
  const Day2SpokoIntroPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _intro =
      'Model SPOKO je jednoduchý způsob, jak se učit základní oblasti péče o tělo '
      'a psychickou stabilitu. Každý den se zaměříme na jedno písmeno a postupně '
      'si ukážeme, jak malé změny v každé oblasti mohou ovlivnit emoce, stres i '
      'celkovou pohodu. Cílem není dělat všechno dokonale, ale postupně si všímat '
      'a zkoušet malé kroky, které se dají udržet v běžném životě.';

  static const _duringWeek =
      'Během týdne si každou část projdeme zvlášť a zkusíme ji převést do malých '
      'konkrétních kroků.';

  static const _infoText =
      'Na první pohled mohou tyto oblasti působit jednoduše nebo samozřejmě. Ve '
      'skutečnosti ale tvoří základní biologické pilíře psychické stability. Když '
      'některá z nich dlouhodobě nefunguje dobře, tělo i mysl jsou více zranitelné '
      'vůči stresu, emočním výkyvům i impulzivnímu chování. Péče o spánek, jídlo, '
      'pohyb a zdraví proto není „navíc“, ale základ, který výrazně ovlivňuje to, '
      'jak zvládáme každodenní život. I malé změny v těchto oblastech mohou mít '
      'překvapivě velký dopad na celkovou pohodu.';

  static const _letters = <List<String>>[
    ['S', 'Spánek'],
    ['P', 'Potrava'],
    ['O', 'ne Omamným látkám'],
    ['K', 'Kondice'],
    ['O', 'léčba Onemocnění'],
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.eco_outlined, color: primaryColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  'Model SPOKO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _intro,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'SPOKO zahrnuje:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(_letters.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _SpokoLetterRow(letter: _letters[i][0], word: _letters[i][1], isToday: i == 0),
            );
          }),
          const SizedBox(height: 12),
          Text(
            _duringWeek,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border(left: BorderSide(color: primaryColor, width: 4)),
            ),
            child: Text(
              _infoText,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SpokoLetterRow extends StatelessWidget {
  const _SpokoLetterRow({required this.letter, required this.word, required this.isToday});

  final String letter;
  final String word;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    final rowColor = isToday
        ? primaryColor
        : (isDarkMode ? Colors.white.withOpacity(0.06) : primaryColor.withOpacity(0.08));
    final letterBg = isToday ? Colors.white : primaryColor;
    final letterColor = isToday ? primaryColor : Colors.white;
    final wordColor = isToday ? Colors.white : (isDarkMode ? Colors.white : NepanikarColors.dark);

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(color: rowColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: letterBg, borderRadius: BorderRadius.circular(9)),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: letterColor),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              word,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: wordColor),
            ),
          ),
          if (isToday)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                color: NepanikarColors.info,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'DNES',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: NepanikarColors.dark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
