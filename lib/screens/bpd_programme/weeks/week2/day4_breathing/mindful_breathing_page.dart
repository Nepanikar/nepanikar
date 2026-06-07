import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class MindfulBreathingPage extends StatelessWidget {
  const MindfulBreathingPage({super.key, required this.onNext});

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

          // Header with icon
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.self_improvement, color: primaryColor, size: 28),
              ),
              const SizedBox(width: 16),
              Text(
                'Všímavé dýchanie',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Visual breathing circle
          Center(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    primaryColor.withOpacity(0.3),
                    primaryColor.withOpacity(0.1),
                    primaryColor.withOpacity(0.05),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.air,
                    size: 50,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Len pozoruješ svoj dych tak, ako prirodzene plynie.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Keď utečie pozornosť, jemne ju vrátiš späť k dychu. '
                  'Bez posudzovania, bez snahy dych meniť.',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Tips
          _buildTip(
            'Pohodlne si sadni alebo ľahni',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildTip(
            'Všímaj si nádych a výdych',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildTip(
            'Keď sa myseľ zatúla, vráť ju späť',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 24),

          // Try it button
          Center(
            child: OutlinedButton.icon(
              onPressed: () {
                // Navigate to basic circle breathing (equal phases)
                context.push(
                  const BreathingGameRoute(
                    shape: BreathingGameShape.circle,
                  ).location,
                );
              },
              icon: Icon(Icons.play_circle_outline, color: primaryColor),
              label: Text(
                'Vyskúšať cvičenie',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                side: BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTip(
    String text, {
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: primaryColor,
          size: 22,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
        ),
      ],
    );
  }
}
