import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Teaser for the next day shown on a [DayCompletionPage].
@immutable
class NextDayTeaser {
  const NextDayTeaser({required this.title, required this.description});

  final String title;
  final String description;
}

/// Closing page of a regular (non-reflection) programme day: success badge, the
/// day's summary and an optional teaser of what comes tomorrow.
///
/// Every Week 2 day repeated this page almost verbatim; they all use this one.
class DayCompletionPage extends StatelessWidget {
  const DayCompletionPage({
    super.key,
    required this.dayNumber,
    required this.summary,
    required this.onComplete,
    this.heading = 'Výborně!',
    this.nextDay,
    this.extraContent,
    this.buttonText = 'Dokončit den',
  });

  final int dayNumber;
  final String summary;
  final String heading;
  final String buttonText;
  final NextDayTeaser? nextDay;

  /// Rendered between the summary and the next-day teaser.
  ///
  /// Week 5 Day 2 closes on life-threatening behaviour and the source offers two
  /// places to go for care. They belong above the teaser, not below it: someone
  /// who is leaving after that day will not scroll past "Zítra" to find help.
  final Widget? extraContent;

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    // The dark scaffold is itself built from the primary colour, so anything
    // tinted with it disappears; the accents have to lighten instead.
    final accent = isDarkMode ? Colors.white : primaryColor;

    return DayPageBase(
      buttonText: buttonText,
      onButtonPressed: onComplete,
      buttonIcon: Icons.check,
      content: Column(
        children: [
          const SizedBox(height: 48),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: NepanikarColors.progressGreen.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_circle, size: 70, color: NepanikarColors.progressGreen),
          ),
          const SizedBox(height: 32),
          Text(
            heading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Den $dayNumber dokončen',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: accent),
          ),
          const SizedBox(height: 24),
          Text(
            summary,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          if (extraContent != null) ...[const SizedBox(height: 24), extraContent!],
          if (nextDay != null) ...[
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accent.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Icon(Icons.arrow_forward, color: accent, size: 28),
                  const SizedBox(height: 12),
                  Text(
                    'Zítra',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: accent),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nextDay!.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nextDay!.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
