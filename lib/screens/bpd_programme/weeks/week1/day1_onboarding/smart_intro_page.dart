import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 8/10 — SMART explanation with tappable letters (source: tyzden-1.md §1).
class Day1SmartIntroPage extends StatefulWidget {
  const Day1SmartIntroPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<Day1SmartIntroPage> createState() => _Day1SmartIntroPageState();
}

class _Day1SmartIntroPageState extends State<Day1SmartIntroPage> {
  static const _letters = <_SmartLetter>[
    _SmartLetter('S', 'Specifický', 'Cíl je jasně definovaný, víš přesně, čeho chceš dosáhnout.'),
    _SmartLetter(
      'M',
      'Měřitelný',
      'Můžeš sledovat, jestli se ti daří cíl plnit, například počtem pokusů '
          'nebo jasným popisem toho, co považuješ za úspěch.',
    ),
    _SmartLetter(
      'A',
      'Adekvátní',
      'Cíl je realistický a zvládnutelný vzhledem ke tvým možnostem ve tvojí '
          'situaci.',
    ),
    _SmartLetter(
      'R',
      'Relevantní',
      'Cíl má pro Tebe význam a souvisí s tím, co je pro Tebe důležité.',
    ),
    _SmartLetter(
      'T',
      'Termínovaný',
      'Je jasné, do kdy chceš cíle dosáhnout, což Ti může pomoct udržet '
          'motivaci.',
    ),
  ];

  int? _openIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return DayPageBase(
      buttonText: 'Pojďme si nastavit cíl',
      onButtonPressed: widget.onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'SMART cíle',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: bodyColor),
          ),
          const SizedBox(height: 8),
          Text(
            'SMART cíle je konkrétní způsob, jak si nastavit cíle tak, aby byly '
            'jasné, reálné a dosažitelné. Klepni na písmeno pro vysvětlení.',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(_letters.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _SmartTile(
                letter: _letters[i],
                isOpen: _openIndex == i,
                onTap: () => setState(() => _openIndex = _openIndex == i ? null : i),
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SmartTile extends StatelessWidget {
  const _SmartTile({required this.letter, required this.isOpen, required this.onTap});

  final _SmartLetter letter;
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isOpen
              ? primaryColor.withOpacity(0.12)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isOpen
                ? primaryColor
                : (isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300),
            width: isOpen ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: Text(
                      letter.letter,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    letter.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: textColor),
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: primaryColor,
                ),
              ],
            ),
            if (isOpen) ...[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 53),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    letter.detail,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.5,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SmartLetter {
  const _SmartLetter(this.letter, this.title, this.detail);

  final String letter;
  final String title;
  final String detail;
}
