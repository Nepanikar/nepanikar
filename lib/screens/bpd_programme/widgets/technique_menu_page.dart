import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/rescue_save_button.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';

/// One technique offered in a [TechniqueMenuPage].
@immutable
class TechniqueData {
  const TechniqueData({
    required this.id,
    required this.iconKey,
    required this.icon,
    required this.title,
    required this.shortDescription,
    required this.detailParagraphs,
    this.videoUrl,
    this.breathingShape,
    this.breathingPreset,
  });

  /// Stable id used as the rescue-package record key.
  final String id;

  /// Key into the rescue package's icon table, so a saved item keeps this icon.
  final String iconKey;

  final IconData icon;
  final String title;

  /// One-line summary shown in the menu.
  final String shortDescription;

  /// Full text shown in the detail sheet.
  final List<String> detailParagraphs;

  /// Optional guided-exercise video from the programme source.
  final String? videoUrl;

  /// When set, the detail sheet offers to run the app's breathing exercise.
  final BreathingGameShape? breathingShape;
  final String? breathingPreset;
}

/// A "pick from the menu" page: the day's techniques as tappable cards, each
/// opening a detail sheet.
///
/// This replaces walking the user through every technique in sequence — the
/// programme source offers them as a choice ("Můžeš si vybrat jedno cvičení z
/// nabídky, které dnes vyzkoušíš. Zbytek si můžeš nechat na jindy.").
class TechniqueMenuPage extends StatelessWidget {
  const TechniqueMenuPage({
    super.key,
    required this.title,
    required this.dayLabel,
    required this.pickLead,
    required this.techniques,
    required this.sourceLabel,
    required this.onNext,
    this.leadParagraphs = const [],
    this.closingNote,
  });

  final String title;

  /// e.g. "Den 4 • Týden 2".
  final String dayLabel;

  /// Context above the menu. Empty when the day teaches in a chat page first.
  final List<String> leadParagraphs;

  /// Instruction above the menu, verbatim from the programme source.
  final String pickLead;

  final List<TechniqueData> techniques;

  /// Badge shown on items saved into the rescue package (e.g. "Všímavé dýchání").
  final String sourceLabel;

  /// Optional highlighted note under the menu.
  final String? closingNote;

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85);

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dayLabel,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          ...leadParagraphs.map(
            (paragraph) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                paragraph,
                style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            pickLead,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 14),
          ...techniques.map(
            (technique) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _TechniqueCard(
                technique: technique,
                onTap: () => showTechniqueDetailSheet(
                  context,
                  technique: technique,
                  sourceLabel: sourceLabel,
                ),
              ),
            ),
          ),
          if (closingNote != null) ...[
            const SizedBox(height: 16),
            InfoBox(
              icon: Icons.medical_services_outlined,
              title: 'Kdykoliv se můžeš vrátit',
              text: closingNote!,
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _TechniqueCard extends StatelessWidget {
  const _TechniqueCard({required this.technique, required this.onTap});

  final TechniqueData technique;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? Colors.white.withOpacity(0.12) : primaryColor.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.12) : primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                technique.icon,
                color: isDarkMode ? Colors.white : primaryColor,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    technique.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    technique.shortDescription,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.65),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDarkMode ? Colors.white30 : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

/// Opens the detail sheet for [technique]: full description, optional guided
/// video, optional breathing-exercise launch and the rescue-package toggle.
Future<void> showTechniqueDetailSheet(
  BuildContext context, {
  required TechniqueData technique,
  required String sourceLabel,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _TechniqueDetailSheet(technique: technique, sourceLabel: sourceLabel),
  );
}

class _TechniqueDetailSheet extends StatelessWidget {
  const _TechniqueDetailSheet({required this.technique, required this.sourceLabel});

  final TechniqueData technique;
  final String sourceLabel;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      decoration: BoxDecoration(
        color: isDarkMode ? NepanikarColors.containerColor(primaryColor) : NepanikarColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white24 : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.15)
                          : primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      technique.icon,
                      color: isDarkMode ? Colors.white : primaryColor,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      technique.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ...technique.detailParagraphs.map(
                (paragraph) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    paragraph,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.55,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (technique.breathingShape != null) ...[
                _StartBreathingButton(
                  shape: technique.breathingShape!,
                  preset: technique.breathingPreset,
                ),
                const SizedBox(height: 10),
              ],
              if (technique.videoUrl != null) ...[
                const LinkLeadText('Pro zájemce vedené cvičení skrze video:'),
                const SizedBox(height: 6),
                ExternalLinkButton(
                  label: 'Otevřít video',
                  url: technique.videoUrl!,
                  icon: Icons.play_circle_outline,
                ),
                const SizedBox(height: 10),
              ],
              RescueSaveButton(
                item: BpdRescueItem(
                  id: technique.id,
                  title: technique.title,
                  description: technique.detailParagraphs.join('\n\n'),
                  sourceLabel: sourceLabel,
                  savedAt: DateTime.now(),
                  videoUrl: technique.videoUrl,
                  iconKey: technique.iconKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartBreathingButton extends StatelessWidget {
  const _StartBreathingButton({required this.shape, this.preset});

  final BreathingGameShape shape;
  final String? preset;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Grab the router before closing the sheet — this context is gone
          // once the sheet route is popped.
          final router = GoRouter.of(context);
          final location = BreathingGameRoute(shape: shape, preset: preset).location;
          Navigator.of(context).pop();
          router.push<void>(location);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 1,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow_rounded, size: 22),
            SizedBox(width: 8),
            Text(
              'Spustit dechové cvičení',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
