import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_picker_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day_pause_screen.g.dart';

@TypedGoRoute<DayPauseScreenRoute>(path: '/bpd-programme/week/:weekNumber/day/:dayNumber/pause')
class DayPauseScreenRoute extends GoRouteData with $DayPauseScreenRoute {
  const DayPauseScreenRoute({required this.weekNumber, required this.dayNumber});

  final int weekNumber;
  final int dayNumber;

  @override
  Widget build(BuildContext context, _) =>
      DayPauseScreen(weekNumber: weekNumber, dayNumber: dayNumber);
}

/// Rest day of a programme week. Per the source (tyzden-2.md §5) a pause day is
/// only the mindfulness notification plus a mood record — so the only action
/// offered here is a deep-link into the existing mood feature.
///
/// Every week writes its own pause wording, and the user meets this screen once
/// a week for seven weeks, so a single shared sentence would quickly read as
/// canned. Week 4 goes further and rests **twice** (days 3 and 6) with different
/// text, so the copy is keyed by `(week, day)` first and falls back to the
/// week's own text, then to Week 2's for weeks nobody has authored yet.
class DayPauseScreen extends StatelessWidget {
  const DayPauseScreen({super.key, required this.weekNumber, required this.dayNumber});

  final int weekNumber;
  final int dayNumber;

  /// Verbatim pause copy per week, from `docs/hpo/source/tyzden-<n>.md`.
  static const _pauseCopy = <int, String>{
    2:
        'Už teď máš za sebou spoustu skvělé práce a Tvůj '
        'přístup je inspirativní! Využij dnešní den k '
        'regeneraci a načerpej síly na další kroky.',
    3:
        'Dnes program vynecháme. Máš za sebou skvělý pokrok '
        'a zasloužíš si chvilku odpočinku.',
  };

  /// Copy for weeks that rest more than once. Week 4 (tyzden-4.md §3 and §6)
  /// writes a different paragraph for each of its two rest days; without this
  /// map the second one would silently render the first one's text.
  static const _pauseCopyByDay = <(int, int), String>{
    (4, 3):
        'Dnes program vynecháme. Udělal/a jsi velký pokrok '
        'a zasloužíš si chvíli klidu pro načerpání nové energie.',
    (4, 6):
        'Dnes si dopřejeme volnější den bez programu. Máš za sebou opravdu '
        'velký kus práce – je vidět, kolik energie, odvahy a odhodlání do toho '
        'dáváš. Dnes si můžeš s klidem odpočinout a nechat své pokroky v klidu '
        '„doznít“.',
  };

  String get _pauseText =>
      _pauseCopyByDay[(weekNumber, dayNumber)] ?? _pauseCopy[weekNumber] ?? _pauseCopy[2]!;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : NepanikarColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context, primaryColor, isDarkMode),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                      // Illustration
                      _buildIllustration(primaryColor),

                      const SizedBox(height: 32),

                      // Title
                      Text(
                        'Dnes si dáme pauzu',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : NepanikarColors.dark,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      // Subtitle
                      Text(
                        _pauseText,
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? Colors.white70
                              : NepanikarColors.dark.withOpacity(0.7),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 28),

                      // The one thing a pause day asks for: a mood record.
                      _buildMoodRecordButton(context, primaryColor),

                      const SizedBox(height: 24),

                      // Tip card
                      _buildTipCard(primaryColor, isDarkMode),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            // Complete button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => _completeDay(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 2,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check, size: 22),
                      SizedBox(width: 8),
                      Text(
                        'OZNAČIT JAKO SPLNĚNÉ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color primaryColor, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: Text(
              'DEN $dayNumber • TÝDEN $weekNumber',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 48), // Balance for close button
        ],
      ),
    );
  }

  Widget _buildIllustration(Color primaryColor) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(color: primaryColor.withOpacity(0.08), shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), shape: BoxShape.circle),
          ),
          // Person meditating icon
          Icon(Icons.self_improvement, size: 100, color: primaryColor.withOpacity(0.7)),
          // Small decorative elements
          Positioned(
            top: 30,
            right: 40,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 35,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 30,
            child: Icon(Icons.favorite, size: 16, color: Colors.pink.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodRecordButton(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () => const MoodPickerRoute().push<void>(context),
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor.withOpacity(0.5), width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sentiment_satisfied_alt, size: 20),
            SizedBox(width: 8),
            Text('Zaznamenat náladu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(Color primaryColor, bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
        boxShadow: isDarkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.lightbulb_outline, color: Colors.amber.shade700, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                'Tip na dnešek',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tip text
          Text(
            'Zkus si dát 5 minut jen pro sebe. Pusť si oblíbenou hudbu, napiš si poznámku, nebo jen tak seď.',
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _completeDay(BuildContext context) async {
    final bpdDaysDao = registry.get<BpdDaysDao>();
    await bpdDaysDao.markDayCompleted(weekNumber, dayNumber);
    if (context.mounted) {
      context.pop();
    }
  }
}
