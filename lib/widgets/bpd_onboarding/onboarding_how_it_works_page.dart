import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

class OnboardingHowItWorksPage extends StatelessWidget {
  const OnboardingHowItWorksPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Title
          Text(
            'Ako to funguje',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          // Info cards
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.calendar_month,
                    title: '7 týždňov s lekciami',
                    description:
                        'Program obsahuje 7 týždňov, každý so 7 dennými '
                        'lekciami, ktoré sa postupne odomykajú.',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(
                    icon: Icons.timer,
                    title: '5-20 minút denne',
                    description:
                        'Každá lekcia je navrhnutá tak, aby sa dala '
                        'zvládnuť aj v náročnom dni.',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(
                    icon: Icons.psychology,
                    title: 'Praktické cvičenia',
                    description:
                        'Naučíte sa techniky, ktoré môžete okamžite '
                        'využiť vo vašom každodennom živote.',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(
                    icon: Icons.trending_up,
                    title: 'Postupný pokrok',
                    description:
                        'Každý týždeň stavia na predchádzajúcom, '
                        'takže vaše zručnosti rastú prirodzene.',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Next button
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Pokračovat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color primaryColor,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
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
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDarkMode
                        ? Colors.white70
                        : NepanikarColors.dark.withOpacity(0.7),
                    height: 1.4,
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
