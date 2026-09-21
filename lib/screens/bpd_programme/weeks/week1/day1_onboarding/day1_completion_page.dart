import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Page 10/10 — Day 1 completion (verbatim, source: tyzden-1.md §1, closing).
class Day1CompletionPage extends StatelessWidget {
  const Day1CompletionPage({super.key, required this.onComplete});

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
                          child: Icon(Icons.celebration, size: 58, color: primaryColor),
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
                    const Text(
                      'DEN 1 DOKONČEN',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: NepanikarColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Skvělá práce!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'První den je úspěšně u konce. Nastavit si jasné cíle '
                      'vyžaduje energii a soustředění, takže ti patří velké '
                      'uznání za tento důležitý krok. Pro dnešek je to všechno, '
                      'odpočiň si a pokračovat budeme zítra.',
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
                  'Skvělé!',
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
