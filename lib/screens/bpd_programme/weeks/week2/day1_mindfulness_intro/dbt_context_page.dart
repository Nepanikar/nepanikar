import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class DbtContextPage extends StatelessWidget {
  const DbtContextPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovať',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // Section header
          const SectionHeader(
            icon: Icons.lightbulb_outline,
            title: 'Mindfulness v DBT',
          ),

          const SizedBox(height: 24),

          // Main description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'V rámci DBT je mindfulness považovaná za základnú zručnosť, '
              'na ktorej stoja všetky ostatné. Je to preto, že byť prítomný '
              'a vedomý si svojich myšlienok a pocitov je prvým krokom k ich '
              'zvládaniu.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Important note
          const InfoBox(
            icon: Icons.info_outline,
            title: 'Dôležité',
            text:
                'Mindfulness nám pomáha "zastaviť sa" a všimnúť si, čo sa skutočne deje, '
                'než urobíme ďalší krok.',
          ),

          const SizedBox(height: 32),

          // Motivational quote
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.15),
                  primaryColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(Icons.format_quote, color: primaryColor, size: 32),
                const SizedBox(height: 12),
                Text(
                  'Mindfulness nie je o tom mať prázdnu hlavu, '
                  'ale o tom byť prítomný v tom, čo práve robíš.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
