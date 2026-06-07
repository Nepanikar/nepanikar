import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, required this.onNext});

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

          Text(
            'What skills',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Deň 2 • Týždeň 2',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Colors.white60
                  : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),

          const SizedBox(height: 32),

          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.visibility, size: 50, color: primaryColor),
            ),
          ),

          const SizedBox(height: 32),

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
              'Čo zručnosti opisujú, čo robíme pri mindfulness – ako zameriavame pozornosť.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 28),

          Text(
            'Dnes sa naučíš:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 16),

          _buildSkillPreview(
            icon: Icons.visibility,
            title: 'Pozorovanie',
            description: 'Všímam si bez hodnotenia',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildSkillPreview(
            icon: Icons.edit,
            title: 'Popis',
            description: 'Dávam slová zážitkom',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildSkillPreview(
            icon: Icons.self_improvement,
            title: 'Zapojenie sa',
            description: 'Som plne prítomný/á v činnosti',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSkillPreview({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: primaryColor, size: 24),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13,
                  color: isDarkMode
                      ? Colors.white60
                      : NepanikarColors.dark.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
