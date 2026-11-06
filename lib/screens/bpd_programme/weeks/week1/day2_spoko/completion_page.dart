import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Page 3/3 — Day 2 completion (verbatim, source: tyzden-1.md §2, closing).
class Day2CompletionPage extends StatelessWidget {
  const Day2CompletionPage({super.key, required this.onComplete});

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
                            color: primaryColor.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.nightlight_round,
                            size: 58,
                            color: NepanikarColors.accent(context),
                          ),
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
                      context.l10n.dbt_day_completed(2).toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        color: NepanikarColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.l10n.dbt_nicely_done,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: NepanikarColors.accent(context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'To je pro dnešek vše. Mysli na svůj spánek :)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: isDarkMode
                            ? Colors.white70
                            : NepanikarColors.dark.withValues(alpha: 0.75),
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
                  backgroundColor: NepanikarColors.ctaBackground(context),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                ),
                child: Text(
                  context.l10n.dbt_done,
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
