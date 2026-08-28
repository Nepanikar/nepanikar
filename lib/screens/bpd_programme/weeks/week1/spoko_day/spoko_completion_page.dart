import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_data.dart';

/// Page 3/3 of a SPOKO day — completion. Praise text is verbatim via [data].
class SpokoCompletionPage extends StatelessWidget {
  const SpokoCompletionPage({super.key, required this.data, required this.onComplete});

  final SpokoDayData data;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

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
                            color: primaryColor.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(data.completionIcon, size: 58, color: primaryColor),
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
                      'DEN ${data.dayNumber} DOKONČEN',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: NepanikarColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.completionHeading,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data.completionPraise,
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
                child: const Text(
                  'Hotovo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
