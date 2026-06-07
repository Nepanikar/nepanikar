import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class ObservePage extends StatelessWidget {
  const ObservePage({super.key, required this.onNext});

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

          SectionHeader(
            icon: Icons.visibility,
            title: 'Pozorovanie',
            subtitle: 'What skill 1/3',
          ),

          const SizedBox(height: 20),

          Text(
            'Všímam si, čo sa deje, bez hodnotenia',
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

          _buildExerciseCard(
            icon: Icons.remove_red_eye_outlined,
            title: 'Očami',
            description: 'Pozoruj svoje okolie – farby, tvary, pohyb',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildExerciseCard(
            icon: Icons.hearing,
            title: 'Ušami',
            description: 'Počúvaj zvuky okolo seba bez komentára',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildExerciseCard(
            icon: Icons.accessibility_new,
            title: 'Telom',
            description: 'Vnímaj telesné pocity – napätie, teplo, tlak',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildExerciseCard(
            icon: Icons.air,
            title: 'Dychom',
            description: 'Sleduj nádych a výdych, ako prirodzene plynú',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildExerciseCard(
            icon: Icons.cloud_outlined,
            title: 'Myšlienkami',
            description: 'Pozoruj myšlienky ako mraky na oblohe',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildExerciseCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryColor, size: 22),
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
                const SizedBox(height: 2),
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
          Icon(
            Icons.chevron_right,
            color: isDarkMode
                ? Colors.white30
                : Colors.grey.shade400,
            size: 20,
          ),
        ],
      ),
    );
  }
}
