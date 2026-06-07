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

          // Decorative icon
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.auto_awesome, size: 40, color: primaryColor),
            ),
          ),

          const SizedBox(height: 24),

          // Main title
          Center(
            child: Text(
              'Ďalšie mindfulness techniky',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Center(
            child: Text(
              'Deň 6 • Týždeň 2',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Description card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Dnes rozšírime našu znalosť mindfulness techník. '
              'Vyber si jedno cvičenie, ktoré dnes vyskúšaš. '
              'Zvyšok si môžeš nechať na inokedy.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Techniques list
          Text(
            'Dnešné techniky:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 16),

          _buildTechniquePreview(
            icon: Icons.accessibility_new,
            title: 'Skenovanie tela',
            description: 'Uvedomenie si tela od hlavy po päty',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildTechniquePreview(
            icon: Icons.directions_walk,
            title: 'Všímavá chôdza',
            description: 'Pozornosť na každý krok',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildTechniquePreview(
            icon: Icons.restaurant,
            title: 'Všímavé jedenie',
            description: 'Plné vnímanie chutí a textúr',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildTechniquePreview(
            icon: Icons.hearing,
            title: 'Všímavé načúvanie',
            description: 'Plná pozornosť na zvuky',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildTechniquePreview(
            icon: Icons.star,
            title: 'Všetkých päť pohromade',
            description: 'Technika 5-4-3-2-1 pre ukotvenie',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTechniquePreview({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
