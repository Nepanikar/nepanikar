import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/rescue_save_button.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';

/// One letter of an acronym: the letter itself, what it stands for, and the
/// instruction. Verbatim from the programme source.
typedef AcronymLetter = (String letter, String title, String description);

/// A page that teaches one acronym — STOP, TIPS and UZNÁVÁM in Week 4.
///
/// The letters render through the existing [NumberedBenefit], whose `number` is
/// a `String`, so an acronym needs no card widget of its own.
///
/// These are the techniques a user reaches for at the worst moment, so the page
/// offers to save the whole acronym to the záchranný balíček — without that
/// they would have to walk back through the programme to find it.
class AcronymSkillPage extends StatelessWidget {
  const AcronymSkillPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.letters,
    required this.onNext,
    this.leadParagraphs = const [],
    this.afterLetter = const {},
    this.rescueItem,
    this.buttonText = 'Pokračovat',
  });

  final IconData icon;
  final String title;

  /// e.g. "Den 2 • Týden 4".
  final String subtitle;

  final List<String> leadParagraphs;
  final List<AcronymLetter> letters;

  /// Extra content rendered directly below a given letter, keyed by that
  /// letter — TIPS hangs a breathing-exercise link under "P" and a caution
  /// card under "I", both of which belong to their letter rather than to the
  /// bottom of the page.
  final Map<String, Widget> afterLetter;

  /// When set, the page offers to save the acronym to the rescue package.
  final BpdRescueItem? rescueItem;

  final String buttonText;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : Colors.black.withOpacity(0.75);

    return DayPageBase(
      buttonText: buttonText,
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SectionHeader(icon: icon, title: title, subtitle: subtitle),
          const SizedBox(height: 18),
          ...leadParagraphs.map(
            (paragraph) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                paragraph,
                style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...letters.expand((entry) {
            final extra = afterLetter[entry.$1];
            return [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: NumberedBenefit(number: entry.$1, title: entry.$2, description: entry.$3),
              ),
              if (extra != null)
                Padding(padding: const EdgeInsets.only(left: 54, bottom: 14), child: extra),
            ];
          }),
          if (rescueItem != null) ...[
            const SizedBox(height: 16),
            RescueSaveButton(item: rescueItem!),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
