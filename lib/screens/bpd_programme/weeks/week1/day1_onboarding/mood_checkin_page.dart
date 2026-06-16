import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_picker_screen.dart';

/// Page 6/10 — First activity: mood check-in. Deep-links into the existing
/// "Moje záznamy" mood recording (source: tyzden-1.md §1, Moje záznamy).
class Day1MoodCheckinPage extends StatelessWidget {
  const Day1MoodCheckinPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _moods = <_MoodPreview>[
    _MoodPreview('😣', 'Hrozně'),
    _MoodPreview('🙁', 'Špatně'),
    _MoodPreview('😐', 'Nic moc'),
    _MoodPreview('🙂', 'Dobře'),
    _MoodPreview('😄', 'Skvěle'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '📝 První aktivita',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Pojďme si zkusit jednu aktivitu',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: bodyColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Zaznamenej si, jak se dnes máš. Záznam se uloží do Mých záznamů, kam '
            'se můžeš kdykoliv vrátit a sledovat, jak se tvá nálada vyvíjí.',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'Jak se dnes máš?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _moods.map((m) {
                    return Column(
                      children: [
                        Text(m.emoji, style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 5),
                        Text(
                          m.label,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode
                                ? Colors.white60
                                : NepanikarColors.dark.withOpacity(0.55),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () => const MoodPickerRoute().push<void>(context),
              icon: const Icon(Icons.edit_note),
              label: const Text(
                'Zaznamenat náladu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _MoodPreview {
  const _MoodPreview(this.emoji, this.label);

  final String emoji;
  final String label;
}
