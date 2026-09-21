import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';

/// Page 2/3 — the week's reflection, 4 free-text questions (verbatim, source: §7).
class Week2ReflectionPage extends StatelessWidget {
  const Week2ReflectionPage({super.key, required this.controllers, required this.onNext});

  final List<TextEditingController> controllers;
  final VoidCallback onNext;

  static const questions = <String>[
    'Co pro tebe bylo nejzajímavější? Co ses naučil/a?',
    'Použil/a jsi něco z toho, co ses naučil/a, ve svém životě? Co a kdy?',
    'Kdy ti technika všímavosti pomohla?',
    'Kdy konkrétně bys tuto dovednost mohl/a využít v dalším týdnu?',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(icon: Icons.edit_outlined, title: 'Reflexe týdne'),
          const SizedBox(height: 12),
          Text(
            'Zkus se zamyslet — odpovědi zůstanou uložené, můžeš se k nim vrátit.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 20),
          ReflectionQuestionList(questions: questions, controllers: controllers),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
