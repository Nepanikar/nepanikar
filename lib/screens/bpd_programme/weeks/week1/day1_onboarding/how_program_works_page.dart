import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 2/10 — How the programme works (source: tyzden-1.md §1).
class Day1HowProgramWorksPage extends StatelessWidget {
  const Day1HowProgramWorksPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _areas = <String>[
    'všímavost',
    'emoční regulace',
    'snášení tísně',
    'mezilidské vztahy',
    'sebepojetí',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(
            icon: Icons.calendar_month,
            title: 'Jak program funguje',
          ),
          const SizedBox(height: 20),
          Text(
            'Program trvá 7 týdnů. Je žádoucí, aby byl plněn každodenně, není to '
            'však nutnou podmínkou. Program obsahuje zejména praktická cvičení, '
            'ale i jednoduchá vysvětlení různých souvisejících jevů, které se '
            'mohou v našich životech objevovat.',
            style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
          ),
          const SizedBox(height: 16),
          const InfoBox(
            icon: Icons.timer_outlined,
            title: '5–20 minut denně',
            text: 'Jeho plnění zabere v průměru 5–20 minut denně. Cvičení jsou '
                'dávkována tak, aby pro Vás nebyla příliš zahlcující.',
          ),
          const SizedBox(height: 24),
          Text(
            'Během těchto společných sedmi týdnů se budeme věnovat následujícím '
            'oblastem:',
            style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _areas.map((area) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  area,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Týden obvykle začne nějakým poučením o dané oblasti, aby dávalo '
            'smysl, na co se v daném týdnu budeme zaměřovat a proč. V dalších '
            'dnech se postupně budeme učit novým dovednostem. Konec týdne bude '
            'vždy věnován shrnutí a zamyšlení nad tím, co jsme se naučili a co je '
            'pro Vás užitečné.',
            style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
          ),
          const SizedBox(height: 16),
          Text(
            'V každém týdnu bude jedna klíčová dovednost, kterou bude žádoucí si '
            'během týdne projít. Zároveň program obsahuje i další dobrovolná '
            'cvičení a témata. Čím více energie do programu věnujete, tím lépe '
            'Vám může být do budoucna.',
            style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
