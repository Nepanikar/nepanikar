import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class OneMindfullyPage extends StatelessWidget {
  const OneMindfullyPage({super.key, required this.onNext});

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
            icon: Icons.looks_one_outlined,
            title: 'Jednomyseľne',
            subtitle: 'How skill 1/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Buď prítomný/á a rob vždy len jednu vec naraz',
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
              'Keď robíš jednu vec, venuj sa len tej veci. '
              'Ak sa myseľ zatúla, jemne ju priveď späť.',
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
            icon: Icons.local_cafe_outlined,
            title: 'Príprava čaju',
            description:
                'Prichystaj si čaj a venuj sa len tomuto. Vnímaj vôňu, teplo hrnčeka, zvuky.',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.water_drop_outlined,
            title: 'Umývanie riadu',
            description:
                'Sústreď sa na teplotu vody, pocit misy v rukách, pohyby špongie.',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.back_hand_outlined,
            title: 'Umývanie rúk',
            description:
                'Vnímaj každý detail — vodu, mýdlo, pohyby prstov. Len to a nič iné.',
          ),

          const SizedBox(height: 24),

          InfoBox(
            icon: Icons.lightbulb_outline,
            title: 'Prečo to funguje',
            text:
                'Multitasking zvyšuje stres. Jednomyseľnosť trénuje mozog, aby zostal v prítomnosti.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
