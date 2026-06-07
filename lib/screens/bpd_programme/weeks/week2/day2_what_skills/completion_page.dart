import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Dokončiť deň',
      onButtonPressed: onComplete,
      buttonColor: Colors.green,
      buttonIcon: Icons.check,
      content: Column(
        children: [
          const SizedBox(height: 60),

          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_circle, size: 70, color: Colors.green),
          ),

          const SizedBox(height: 32),

          Text(
            'Výborne!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Text(
            'Deň 2 dokončený',
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          Text(
            'Naučil/a si sa 3 základné What skills mindfulness.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.8),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          _buildSkillSummaryCard(isDarkMode: isDarkMode, primaryColor: primaryColor),

          const SizedBox(height: 20),

          InfoBox(
            icon: Icons.tips_and_updates_outlined,
            title: 'Tip na zajtra',
            text: 'Vyber si 2 cvičenia z každej kategórie a skús ich počas dňa.',
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(Icons.arrow_forward, color: primaryColor, size: 28),
                const SizedBox(height: 12),
                Text(
                  'Zajtra',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'How Skills',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Ako praktizovať mindfulness',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode
                        ? Colors.white70
                        : NepanikarColors.dark.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSkillSummaryCard({
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
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
            'Dnes si sa naučil/a:',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 14),
          _buildSkillRow(
            icon: Icons.visibility,
            label: 'Pozorovanie',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildSkillRow(
            icon: Icons.edit,
            label: 'Popis',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildSkillRow(
            icon: Icons.self_improvement,
            label: 'Zapojenie sa',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillRow({
    required IconData icon,
    required String label,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 18, color: Colors.green),
        ),
        const SizedBox(width: 12),
        Icon(icon, size: 18, color: primaryColor),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: isDarkMode ? Colors.white : NepanikarColors.dark,
          ),
        ),
      ],
    );
  }
}
