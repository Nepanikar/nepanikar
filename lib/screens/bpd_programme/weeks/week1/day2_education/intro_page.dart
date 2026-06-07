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
        children: [
          const SizedBox(height: 40),

          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.school_outlined, size: 60, color: primaryColor),
          ),

          const SizedBox(height: 32),

          // Title
          Text(
            'Edukácia HPO + DBT',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Deň 2 • Týždeň 1',
            style: TextStyle(
              fontSize: 14,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Description
          Text(
            'Dnes sa dozvieš niečo o hraničnej poruche osobnosti (HPO) '
            'a dialekticko-behaviorálnej terapii (DBT), ktorá inšpiruje tento program.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.8),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          // What you'll learn box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.shade200,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Čo sa naučíš:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 16),
                _buildLearningPoint(
                  'Čo je hraničná porucha osobnosti',
                  isDarkMode,
                  primaryColor,
                ),
                const SizedBox(height: 12),
                _buildLearningPoint(
                  'Čo je DBT a ako funguje',
                  isDarkMode,
                  primaryColor,
                ),
                const SizedBox(height: 12),
                _buildLearningPoint(
                  'Prečo je dôležitý nácvik zručností',
                  isDarkMode,
                  primaryColor,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildLearningPoint(String text, bool isDarkMode, Color primaryColor) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14, color: primaryColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
