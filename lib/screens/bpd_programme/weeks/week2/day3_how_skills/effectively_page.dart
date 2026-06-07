import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class EffectivelyPage extends StatelessWidget {
  const EffectivelyPage({super.key, required this.onNext});

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

          const SectionHeader(
            icon: Icons.gps_fixed,
            title: 'Efektívne',
            subtitle: 'How skill 3/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Robím to, čo skutočne funguje',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Niekedy sa zameriame na to, čo je „správne" alebo „spravodlivé" '
              'namiesto toho, čo nám skutočne pomáha.',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: isDarkMode
                    ? Colors.white70
                    : NepanikarColors.dark.withOpacity(0.8),
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'CVIČENIA',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: primaryColor,
            ),
          ),

          const SizedBox(height: 12),

          const FeatureCard(
            icon: Icons.check_circle_outline,
            title: 'Je to účinné?',
            description:
                'Pri každom rozhodnutí sa opýtaj: „Pomôže mi to dosiahnuť môj cieľ?"',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.swap_horiz,
            title: 'Pusť tvrdohlavosť',
            description:
                'Ak sa situácia zmenila, zmeň aj prístup. Trvanie na starom spôsobe ti nepomôže.',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.trending_up,
            title: 'Pomáha mi to?',
            description:
                'Rozlišuj medzi tým, čo chceš robiť, a tým, čo ti skutočne prospieva.',
          ),

          const SizedBox(height: 24),

          InfoBox(
            icon: Icons.lightbulb_outline,
            title: 'Kľúčová otázka',
            text:
                'Efektívnosť nie je vzdanie sa hodnôt. Je to múdrosť vybrať si bitky, ktoré stoja za to.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
