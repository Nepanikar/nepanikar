import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 2/3 — week reflection, 4 free-text questions (verbatim, source: §7).
class Day7ReflectionPage extends StatelessWidget {
  const Day7ReflectionPage({super.key, required this.controllers, required this.onNext});

  final List<TextEditingController> controllers;
  final VoidCallback onNext;

  static const questions = <String>[
    'Co mi přinesl model SPOKO?',
    'Která oblast pro mě byla nejvíc relevantní?',
    'Kde vidím největší prostor pro malou změnu?',
    'Co chci zkusit opakovat i dál?',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(Icons.edit_outlined, color: primaryColor, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                'Reflexe týdne',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Pojďme tento první týden shrnout.',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(questions.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[i],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _ReflectionField(controller: controllers[i]),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ReflectionField extends StatelessWidget {
  const _ReflectionField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.2), width: 1.5),
      ),
      child: TextField(
        controller: controller,
        maxLines: 3,
        minLines: 2,
        style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white : NepanikarColors.dark),
        decoration: InputDecoration(
          hintText: 'Napiš sem…',
          hintStyle: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}
