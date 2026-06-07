import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class BoxBreathingPage extends StatelessWidget {
  const BoxBreathingPage({super.key, required this.onNext});

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
                child: Icon(Icons.crop_square, color: primaryColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Dýchanie do štvorca',
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

          // Square visualization
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  // Top - Inhale
                  Positioned(
                    top: 8,
                    left: 0,
                    right: 0,
                    child: _buildSquareLabel(
                      'Nádych 4s',
                      Icons.arrow_forward,
                      isDarkMode,
                      primaryColor,
                    ),
                  ),
                  // Right - Hold
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: _buildSquareLabel(
                          'Zadrž 4s',
                          Icons.arrow_forward,
                          isDarkMode,
                          primaryColor,
                        ),
                      ),
                    ),
                  ),
                  // Bottom - Exhale
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: _buildSquareLabel(
                      'Výdych 4s',
                      Icons.arrow_back,
                      isDarkMode,
                      primaryColor,
                    ),
                  ),
                  // Left - Hold
                  Positioned(
                    left: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: _buildSquareLabel(
                          'Zadrž 4s',
                          Icons.arrow_forward,
                          isDarkMode,
                          primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Description
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
                  'Jednoduchá technika na upokojenie',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 12),
                _buildStep('1', 'Nádych na 4 sekundy', isDarkMode, primaryColor),
                const SizedBox(height: 8),
                _buildStep('2', 'Zadrž dych na 4 sekundy', isDarkMode, primaryColor),
                const SizedBox(height: 8),
                _buildStep('3', 'Výdych na 4 sekundy', isDarkMode, primaryColor),
                const SizedBox(height: 8),
                _buildStep('4', 'Zadrž na 4 sekundy', isDarkMode, primaryColor),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Try it button
          Center(
            child: OutlinedButton.icon(
              onPressed: () {
                // Navigate to box breathing exercise (4-4-4-4)
                context.push(
                  const BreathingGameRoute(
                    shape: BreathingGameShape.square,
                    preset: 'box',
                  ).location,
                );
              },
              icon: Icon(Icons.play_circle_outline, color: primaryColor),
              label: Text(
                'Vyskúšať cvičenie',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                side: BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSquareLabel(
    String text,
    IconData icon,
    bool isDarkMode,
    Color primaryColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStep(
    String number,
    String text,
    bool isDarkMode,
    Color primaryColor,
  ) {
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.15),
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
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: isDarkMode ? Colors.white : NepanikarColors.dark,
          ),
        ),
      ],
    );
  }
}
