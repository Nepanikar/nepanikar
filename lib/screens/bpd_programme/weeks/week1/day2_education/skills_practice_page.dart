import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class SkillsPracticePage extends StatelessWidget {
  const SkillsPracticePage({super.key, required this.onNext});

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
          const SectionHeader(
            icon: Icons.fitness_center,
            title: 'Prečo je dôležitý nácvik?',
          ),

          const SizedBox(height: 24),

          // Main message
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
            child: Text(
              'Nácvik zručností je dôležitý, pretože samotné vedomosti nestačia. '
              'Potrebuješ cvičiť nové spôsoby reagovania na emócie, stres alebo konflikty, '
              'aby sa staly prirodzenou súčasťou tvojho života.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 28),

          Text(
            'Keď pravidelne používaš nové stratégie:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 20),

          // Benefits of practice
          _buildPracticePoint(
            icon: Icons.trending_down,
            text: 'Znižuješ impulzívne správanie',
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 14),
          _buildPracticePoint(
            icon: Icons.shield_outlined,
            text: 'Ľahšie zvládaš náročné situácie',
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 14),
          _buildPracticePoint(
            icon: Icons.emoji_emotions_outlined,
            text: 'Získavaš sebadôveru v situáciách, ktoré boli predtým ťažké',
            isDarkMode: isDarkMode,
          ),

          const SizedBox(height: 32),

          // Motivational quote
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.15),
                  primaryColor.withOpacity(0.08),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(Icons.format_quote, color: primaryColor, size: 32),
                const SizedBox(height: 12),
                Text(
                  'Každý krok vpred, aj ten najmenší, je pokrok.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    height: 1.4,
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

  Widget _buildPracticePoint({
    required IconData icon,
    required String text,
    required bool isDarkMode,
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
              color: Colors.green.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.green, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
