import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Closing page of a week's reflection day: celebration badge, eyebrow label,
/// heading and the week's praise text, with the "finish week" button.
class WeekCompletionPage extends StatelessWidget {
  const WeekCompletionPage({
    super.key,
    required this.weekNumber,
    required this.praise,
    required this.onComplete,
    this.heading = 'Gratulujeme!',
    this.buttonText = 'Dokončit týden',
    this.eyebrow,
  });

  final int weekNumber;
  final String praise;
  final String heading;
  final String buttonText;

  /// Small label above the heading. Defaults to "TÝDEN n DOKONČEN"; Week 7
  /// overrides it because that screen ends the whole programme, not a week.
  final String? eyebrow;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    // The dark scaffold is built from the primary colour, so accents lighten.
    final accent = isDarkMode ? Colors.white : primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: accent.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.celebration, size: 58, color: accent),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: NepanikarColors.progressGreen,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode
                                  ? NepanikarColors.containerColor(primaryColor)
                                  : Colors.white,
                              width: 4,
                            ),
                          ),
                          child: const Icon(Icons.check, size: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      eyebrow ?? 'TÝDEN $weekNumber DOKONČEN',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: NepanikarColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      heading,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: accent),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      praise,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
