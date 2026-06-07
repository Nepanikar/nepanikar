import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class HpoEducationPage extends StatelessWidget {
  const HpoEducationPage({super.key, required this.onNext});

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
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.psychology, color: primaryColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Čo je HPO?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                    Text(
                      'Hraničná porucha osobnosti',
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main description
          Text(
            'Hraničná porucha osobnosti (HPO) je duševné ochorenie, '
            'ktoré sa vyznačuje:',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          // Characteristics
          const FeatureCard(
            icon: Icons.trending_up,
            title: 'Výkyvy nálad',
            description: 'Výrazné zmeny nálad a emocionálna nestabilita',
          ),
          const SizedBox(height: 12),
          const FeatureCard(
            icon: Icons.flash_on,
            title: 'Impulzivita',
            description: 'Ťažkosti s kontrolou impulzov',
          ),
          const SizedBox(height: 12),
          const FeatureCard(
            icon: Icons.people,
            title: 'Nestabilné vzťahy',
            description: 'Problémy v medziľudských vzťahoch',
          ),
          const SizedBox(height: 12),
          const FeatureCard(
            icon: Icons.person_outline,
            title: 'Vnímanie seba',
            description: 'Nestabilné vnímanie seba a ostatných',
          ),

          const SizedBox(height: 24),

          // Important note
          const InfoBox(
            icon: Icons.info_outline,
            title: 'Dôležité',
            text:
                'Tento program nie je len pre ľudí s diagnostikovanou HPO. '
                'Je určený pre každého, kto chce zlepšiť zvládanie emócií, '
                'impulzov alebo vzťahov.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
