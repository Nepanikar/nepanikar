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

          // Main title
          Text(
            'Čo je mindfulness?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Deň 1 • Týždeň 2',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Colors.white60
                  : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),

          const SizedBox(height: 32),

          // Decorative icon
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.spa, size: 50, color: primaryColor),
            ),
          ),

          const SizedBox(height: 32),

          // Main description card
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
                  'Mindfulness (všímavosť) je schopnosť vedome zamerať pozornosť na prítomný okamih.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'To znamená všímať si svoje myšlienky, pocity a telesné vnemy bez toho, aby sme ich posudzovali ako dobré alebo zlé.',
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

          // Key points
          _buildKeyPoint(
            icon: Icons.visibility,
            text: 'Čo je mindfulness a ako funguje',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildKeyPoint(
            icon: Icons.favorite_border,
            text: 'Prečo je mindfulness užitočný',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildKeyPoint(
            icon: Icons.center_focus_strong,
            text: 'Mindfulness ako základ DBT zručností',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildKeyPoint({
    required IconData icon,
    required String text,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Row(
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
        const SizedBox(width: 14),
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
