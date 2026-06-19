import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 1/10 — Welcome + verbatim intro bullets (source: tyzden-1.md §1).
class Day1WelcomeIntroPage extends StatelessWidget {
  const Day1WelcomeIntroPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _b1 =
      'Právě jste otevřeli program, který byl vytvořen pro lidi učící se zvládat '
      'projevy hraniční poruchy osobnosti. Je ale i pro ty, kteří mají obecně '
      'potíže v oblasti emocí, stresu, impulzivního chování a mezilidských '
      'vztahů, včetně toho sami se sebou.';
  static const _b2 =
      'Program může uživateli poskytnout řadu nástrojů a strategií, pro které byly '
      'inspirací ověřené metody dialekticko-behaviorální terapie (DBT).';
  static const _b3 =
      'Nabité dovednosti z programu Vám mohou pomoci lépe porozumět svým emocím, '
      'regulovat impulsy, zlepšit komunikaci s ostatními a vztah sám se sebou.';
  static const _b4 =
      'Přijde nám důležité říct, že program nenahrazuje terapii. Může být však '
      'dobrým pomocníkem pro ty, kteří z jakéhokoliv důvodu na terapii jít '
      'nemohou nebo nechtějí nebo čekají na svůj termín.';

  static const _bullets = <String>[_b1, _b2, _b3, _b4];

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
          Center(
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite, size: 40, color: primaryColor),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Vítej v programu',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(_bullets.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _IntroBullet(number: i + 1, text: _bullets[i]),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _IntroBullet extends StatelessWidget {
  const _IntroBullet({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
