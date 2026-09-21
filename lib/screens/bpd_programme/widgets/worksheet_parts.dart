import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/reflection_fields.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

/// Presentation pieces of [StructuredWorksheet].
///
/// Split out so the worksheet file stays about its actual job — loading,
/// autosaving and laying out answers — rather than being mostly decoration.
/// These take their open/closed state from the parent; nothing here owns state.

/// A numbered step: badge, heading, optional guidance, then its fields.
class WorksheetNumberedSection extends StatelessWidget {
  const WorksheetNumberedSection({
    super.key,
    required this.section,
    required this.number,
    required this.controllers,
    required this.isExampleOpen,
    required this.onToggleExample,
  });

  final WorksheetSection section;
  final int number;
  final Map<String, TextEditingController> controllers;
  final bool Function(String fieldId) isExampleOpen;
  final void Function(String fieldId) onToggleExample;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$number',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: isDarkMode ? Colors.white : primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  section.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (section.intro != null) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              section.intro!,
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
              ),
            ),
          ),
        ],
        const SizedBox(height: 10),
        ...section.fields.map(
          (field) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (section.fields.length > 1 || field.label != section.title) ...[
                  Text(
                    field.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
                ReflectionField(
                  controller: controllers[field.id]!,
                  hintText: field.hint ?? 'Napiš sem…',
                ),
                if (field.example != null)
                  WorksheetFieldExample(
                    example: field.example!,
                    isOpen: isExampleOpen(field.id),
                    onToggle: () => onToggleExample(field.id),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A myth the user is asked to argue against.
///
/// Deliberately muted and in quotation marks under a "MÝTUS" label. The
/// statements are things like "Drama je cool" and "Mé emoce jsou tím, kým jsem";
/// nothing about the card may read as the app agreeing with them.
class WorksheetMythSection extends StatelessWidget {
  const WorksheetMythSection({
    super.key,
    required this.section,
    required this.controllers,
    required this.isExampleOpen,
    required this.onToggleExample,
  });

  final WorksheetSection section;
  final Map<String, TextEditingController> controllers;
  final bool Function(String fieldId) isExampleOpen;
  final void Function(String fieldId) onToggleExample;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final field = section.fields.first;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDarkMode ? Colors.white12 : Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MÝTUS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              color: isDarkMode ? Colors.white38 : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '„${section.title}"',
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            field.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 6),
          ReflectionField(controller: controllers[field.id]!, hintText: field.hint ?? 'Napiš sem…'),
          if (field.example != null)
            WorksheetFieldExample(
              example: field.example!,
              isOpen: isExampleOpen(field.id),
              onToggle: () => onToggleExample(field.id),
            ),
        ],
      ),
    );
  }
}

/// Per-field worked example behind a toggle.
///
/// Hidden by default on purpose: the point of the exercise is that the user
/// tries first, so the answer must not be the first thing they read.
class WorksheetFieldExample extends StatelessWidget {
  const WorksheetFieldExample({
    super.key,
    required this.example,
    required this.isOpen,
    required this.onToggle,
  });

  final String example;
  final bool isOpen;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: onToggle,
            icon: Icon(isOpen ? Icons.expand_less : Icons.lightbulb_outline, size: 16),
            label: Text(isOpen ? 'Skrýt příklad' : 'Zobrazit příklad'),
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              minimumSize: const Size(0, 32),
              textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        if (isOpen)
          Text(
            example,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
            ),
          ),
      ],
    );
  }
}

/// Whole-worksheet worked example (the author's filled-in Day 2 situation).
class WorksheetExampleCard extends StatelessWidget {
  const WorksheetExampleCard({
    super.key,
    required this.title,
    required this.entries,
    required this.isOpen,
    required this.onToggle,
    this.note,
  });

  final String title;
  final List<(String, String)> entries;
  final bool isOpen;
  final VoidCallback onToggle;

  /// Rendered under the example — used to flag copy the author has not approved.
  final String? note;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(isDarkMode ? 0.12 : 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 18,
                    color: isDarkMode ? Colors.white : primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : primaryColor,
                      ),
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                    color: isDarkMode ? Colors.white : primaryColor,
                  ),
                ],
              ),
            ),
          ),
          if (isOpen)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.$1,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: isDarkMode ? Colors.white : NepanikarColors.dark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            entry.$2,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.45,
                              color: isDarkMode
                                  ? Colors.white70
                                  : NepanikarColors.dark.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (note != null)
                    Text(
                      note!,
                      style: TextStyle(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: isDarkMode ? Colors.white38 : Colors.grey.shade500,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
