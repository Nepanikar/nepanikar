import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class DescribePage extends StatelessWidget {
  const DescribePage({super.key, required this.onNext});

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
            icon: Icons.edit,
            title: 'Popis',
            subtitle: 'What skill 2/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Popisujem slovami to, čo pozorujem',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              height: 1.4,
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

          FeatureCard(
            icon: Icons.landscape,
            title: 'Popisuj okolie',
            description:
                'Nahlas alebo v duchu popisuj, čo vidíš okolo seba',
          ),
          const SizedBox(height: 10),
          FeatureCard(
            icon: Icons.favorite_border,
            title: 'Popisuj emócie',
            description: 'Pomenuj svoje pocity bez hodnotenia',
          ),
          const SizedBox(height: 10),
          FeatureCard(
            icon: Icons.air,
            title: 'Popisuj dych',
            description:
                'Slovne popisuj priebeh každého nádechu a výdychu',
          ),

          const SizedBox(height: 24),

          InfoBox(
            icon: Icons.lightbulb_outline,
            title: 'Prečo to funguje',
            text:
                'Popis pomáha oddeliť myšlienky od emócií a vidieť situáciu jasnejšie.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
