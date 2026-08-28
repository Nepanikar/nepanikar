import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Multi-line free-text field used by the programme's reflection days.
class ReflectionField extends StatelessWidget {
  const ReflectionField({super.key, required this.controller, this.hintText = 'Napiš sem…'});

  final TextEditingController controller;
  final String hintText;

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
          hintText: hintText,
          hintStyle: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey.shade400),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}

/// A list of reflection questions, each with its own [ReflectionField].
///
/// [questions] and [controllers] must be the same length.
class ReflectionQuestionList extends StatelessWidget {
  const ReflectionQuestionList({super.key, required this.questions, required this.controllers})
    : assert(questions.length == controllers.length, 'one controller per question');

  final List<String> questions;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(questions.length, (i) {
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
                  height: 1.4,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
              const SizedBox(height: 8),
              ReflectionField(controller: controllers[i]),
            ],
          ),
        );
      }),
    );
  }
}
