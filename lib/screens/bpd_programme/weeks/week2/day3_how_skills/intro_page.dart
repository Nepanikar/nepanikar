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
      buttonText: 'Začať',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),

          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.tune, size: 42, color: primaryColor),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: Text(
              'How Skills',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Center(
            child: Text(
              'Deň 3 • Týždeň 2',
              style: TextStyle(
                fontSize: 15,
                color: primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'How skills určujú, ako praktizovať mindfulness. '
              'Tieto tri princípy ti pomôžu byť prítomný/á efektívne.',
              style: TextStyle(
                fontSize: 15,
                color: isDarkMode
                    ? Colors.white70
                    : NepanikarColors.dark.withOpacity(0.8),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 28),

          Text(
            'DNES SA NAUČÍŠ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: primaryColor,
            ),
          ),

          const SizedBox(height: 14),

          _buildSkillPreview(
            number: '1',
            title: 'Jednomyseľne',
            subtitle: 'Jedna vec naraz',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildSkillPreview(
            number: '2',
            title: 'Bez posudzovania',
            subtitle: 'Bez hodnotenia',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 10),
          _buildSkillPreview(
            number: '3',
            title: 'Efektívne',
            subtitle: 'Robiť to, čo funguje',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSkillPreview({
    required String number,
    required String title,
    required String subtitle,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
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
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: isDarkMode
                      ? Colors.white54
                      : NepanikarColors.dark.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
