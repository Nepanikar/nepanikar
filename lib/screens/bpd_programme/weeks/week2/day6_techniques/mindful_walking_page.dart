import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class MindfulWalkingPage extends StatelessWidget {
  const MindfulWalkingPage({super.key, required this.onNext});

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
                child: Icon(Icons.directions_walk, color: primaryColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Všímavá chôdza',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Footsteps visual
          Center(
            child: SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final isLeft = index % 2 == 0;
                  final opacity = 0.3 + (index * 0.2);
                  return Padding(
                    padding: EdgeInsets.only(
                      top: isLeft ? 0 : 30,
                      left: index == 0 ? 0 : 8,
                    ),
                    child: Transform.rotate(
                      angle: isLeft ? -0.2 : 0.2,
                      child: Container(
                        width: 35,
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(opacity),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.directions_walk,
                          color: Colors.white.withOpacity(0.7),
                          size: 20,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Vnímaj každý krok, kontakt nôh so zemou, pohyb tela. '
              'Choď pomaly a uvedomuj si každý moment.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Focus points
          Text(
            'Na čo sa zamerať:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 16),

          _buildFocusPoint(
            icon: Icons.radio_button_checked,
            title: 'Kontakt so zemou',
            description: 'Ako sa chodidlo dotýka zeme, váha tela',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildFocusPoint(
            icon: Icons.sync_alt,
            title: 'Pohyb nôh',
            description: 'Zdvíhanie, presúvanie, kladenie nohy',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 12),
          _buildFocusPoint(
            icon: Icons.air,
            title: 'Dych a telo',
            description: 'Synchronizácia dychu s chôdzou',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 24),

          // Tip box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: primaryColor, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Skús to vonku v prírode alebo len po izbe. '
                    'Stačí pár minút pomalej, všímavej chôdze.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFocusPoint({
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
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
      ),
      child: Row(
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
