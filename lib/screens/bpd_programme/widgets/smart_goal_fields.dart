import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// The five SMART goal input fields (S, M, A, R, T), each with a tappable
/// example. Shared by the Day 1 onboarding worksheet and the standalone
/// "new goal" form in My records. Content is verbatim (source: tyzden-1.md §1).
class SmartGoalFields extends StatefulWidget {
  const SmartGoalFields({super.key, required this.controllers});

  /// Five controllers in S, M, A, R, T order.
  final List<TextEditingController> controllers;

  @override
  State<SmartGoalFields> createState() => _SmartGoalFieldsState();
}

class _SmartGoalFieldsState extends State<SmartGoalFields> {
  static const _fields = <_SmartField>[
    _SmartField(
      'S',
      'Co konkrétně chci dokázat?',
      'Chci…',
      'Namísto křiku na kamarádku říct, že mi vadí, když přijde pozdě. Chci '
          'nekřičet na kamarádku, když mě naštve, že dorazila pozdě na sraz.',
    ),
    _SmartField(
      'M',
      'Jak poznám, že je cíl splněný?',
      'Poznám to tak, že…',
      'Poznám to tak, že když se to stane, řeknu jí klidně, že mi vadí '
          'čekání, místo zvyšování hlasu.',
    ),
    _SmartField(
      'A',
      'Je to pro mě reálně zvládnutelné? Jak?',
      'Je to dosažitelné, protože…',
      'Je to dosažitelné, protože si předem připravím větu, kterou jí chci '
          'říct, a když budu cítit vztek, zhluboka se nadechnu.',
    ),
    _SmartField(
      'R',
      'Proč je to pro mě důležité?',
      'Je to důležité, protože…',
      'Je to důležité, protože si chci s kamarádkou udržet dobrý vztah a '
          'nechci, aby křik ničil naše setkání.',
    ),
    _SmartField(
      'T',
      'Do kdy chci cíle dosáhnout?',
      'Chci to zvládnout do…',
      'Chci to vyzkoušet při příštím setkání, pokud dorazí pozdě.',
    ),
  ];

  final _exampleShown = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_fields.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _buildField(i, bodyColor, isDarkMode),
        );
      }),
    );
  }

  Widget _buildField(int i, Color bodyColor, bool isDarkMode) {
    final field = _fields[i];
    final primaryColor = Theme.of(context).primaryColor;
    final showExample = _exampleShown[i] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  field.letter,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                field.question,
                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: bodyColor),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => setState(() => _exampleShown[i] = !showExample),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: NepanikarColors.secondary, width: 1.3),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'příklad',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: NepanikarColors.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (showExample) ...[
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: NepanikarColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Např.: ${field.example}',
              style: TextStyle(
                fontSize: 12.5,
                height: 1.45,
                fontStyle: FontStyle.italic,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
              ),
            ),
          ),
        ],
        const SizedBox(height: 8),
        TextField(
          controller: widget.controllers[i],
          maxLines: 2,
          style: TextStyle(fontSize: 14, color: bodyColor),
          decoration: InputDecoration(
            hintText: field.prompt,
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
            contentPadding: const EdgeInsets.all(13),
          ),
        ),
      ],
    );
  }
}

class _SmartField {
  const _SmartField(this.letter, this.question, this.prompt, this.example);

  final String letter;
  final String question;
  final String prompt;
  final String example;
}
