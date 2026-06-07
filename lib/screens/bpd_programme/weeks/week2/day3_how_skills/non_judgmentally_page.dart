import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class NonJudgmentallyPage extends StatelessWidget {
  const NonJudgmentallyPage({super.key, required this.onNext});

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
            icon: Icons.balance_outlined,
            title: 'Bez posudzovania',
            subtitle: 'How skill 2/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Popisujem fakty, nie hodnotenia',
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
              'Namiesto „je to zlé/dobré" popisuj čo sa deje. '
              'Hodnotenia zvyšujú emócie — fakty ich upokojujú.',
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
            icon: Icons.search_outlined,
            title: 'Všimni si hodnotenie',
            description:
                'Keď pomyslíš „som hlúpy/á", zastav sa a všimni si, že ide o hodnotenie.',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.description_outlined,
            title: 'Popisuj fakty',
            description:
                'Namiesto „pokazil/a som to" povedz „urobil/a som chybu v bode X".',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.label_off_outlined,
            title: 'Bez nálepiek',
            description:
                'Nepripisuj ľuďom ani sebe trvalé vlastnosti. Situácia je situácia, nie charakter.',
          ),

          const SizedBox(height: 24),

          InfoBox(
            icon: Icons.tips_and_updates_outlined,
            title: 'Pamätaj',
            text:
                'Bez posudzovania neznamená, že veci sú ti jedno. Znamená to vidieť ich jasne.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
