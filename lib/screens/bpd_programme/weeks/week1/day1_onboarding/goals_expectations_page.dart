import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 7/10 — Expectations + goals free-text (source: tyzden-1.md §1, Cíle a
/// očekávání). Persisted and re-surfaced in the final week.
class Day1GoalsExpectationsPage extends StatelessWidget {
  const Day1GoalsExpectationsPage({
    super.key,
    required this.onNext,
    required this.expectationsController,
    required this.goalsController,
  });

  final VoidCallback onNext;
  final TextEditingController expectationsController;
  final TextEditingController goalsController;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(icon: Icons.chat_bubble_outline, title: 'Cíle a očekávání'),
          const SizedBox(height: 12),
          Text(
            'Pojďme si ještě zlehka popovídat… :)',
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          _FieldLabel(text: 'S jakým očekáváním vstupuješ do programu?', color: bodyColor),
          const SizedBox(height: 8),
          _MultilineField(
            controller: expectationsController,
            hint: 'Napiš sem cokoliv tě napadá…',
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          _FieldLabel(text: 'Jakých cílů chceš během programu dosáhnout?', color: bodyColor),
          const SizedBox(height: 8),
          _MultilineField(
            controller: goalsController,
            hint: 'Klidně i drobné cíle…',
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 20),
          const InfoBox(
            icon: Icons.eco_outlined,
            title: 'Malé cíle se počítají',
            text:
                'Je naprosto v pořádku začínat i s malými cíli. Každý krok, i '
                'ten nejmenší, je důležitý a posouvá nás směrem, kterým chceme '
                'jít. Popravdě – ty jednodušší cíle se nám plní lépe.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color),
    );
  }
}

class _MultilineField extends StatelessWidget {
  const _MultilineField({required this.controller, required this.hint, required this.isDarkMode});

  final TextEditingController controller;
  final String hint;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return TextField(
      controller: controller,
      maxLines: 3,
      style: TextStyle(fontSize: 15, color: isDarkMode ? Colors.white : NepanikarColors.dark),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey.shade400),
        filled: true,
        fillColor: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.all(14),
      ),
    );
  }
}
