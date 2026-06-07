import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class ParticipatePage extends StatelessWidget {
  const ParticipatePage({super.key, required this.onNext});

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
            icon: Icons.self_improvement,
            title: 'Zapojenie sa',
            subtitle: 'What skill 3/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Plne sa zapájam do činnosti bez rozptýlenia',
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
              'Zapojenie sa znamená byť 100 % prítomný/á v tom, čo robíš.',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
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
            icon: Icons.nature_people,
            title: 'Spojenie s okolím',
            description: 'Úplne sa venuj aktivite, ktorú práve robíš',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.music_note,
            title: 'Hudba a pohyb',
            description: 'Nechaj sa uniesť hudbou alebo pohybom bez premýšľania',
          ),
          const SizedBox(height: 10),
          const FeatureCard(
            icon: Icons.record_voice_over,
            title: 'Naslúchanie',
            description: 'Počúvaj niekoho s plnou pozornosťou, bez plánovania odpovede',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
