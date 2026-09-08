import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Checkable tile for an exercise the user picks to try ("vyber si alespoň dvě
/// cvičení z nabídky").
///
/// Shared by the Week 2 skill pages (Co / Jak dovednosti); the visual language
/// matches the SPOKO challenge tiles of Week 1.
class SelectableExerciseTile extends StatelessWidget {
  const SelectableExerciseTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.description,
    this.icon,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? primaryColor.withOpacity(0.12)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? primaryColor
                : (isDarkMode ? Colors.white.withOpacity(0.15) : primaryColor.withOpacity(0.2)),
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Checkbox(selected: selected, primaryColor: primaryColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (icon != null) ...[
                        Icon(icon, size: 17, color: isDarkMode ? Colors.white : primaryColor),
                        const SizedBox(width: 7),
                      ],
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: isDarkMode ? Colors.white : NepanikarColors.dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description!,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.65),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({required this.selected, required this.primaryColor});

  final bool selected;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: selected ? primaryColor : primaryColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: selected ? const Icon(Icons.check, size: 15, color: Colors.white) : null,
    );
  }
}

/// "Vybráno 2 z minimálně 2" progress hint shown above a pick-list. Turns into
/// the primary colour once [minimum] items are picked.
///
/// With [minimum] `0` the pick-list is a record of what the user already did
/// rather than an assignment (Week 4's UZNÁVÁM checklist), so the target is
/// dropped from the wording — "z minimálně 0" would read as a demand for
/// nothing, and someone who tried none of it must not meet a grey zero.
class PickCounterHint extends StatelessWidget {
  const PickCounterHint({
    super.key,
    required this.picked,
    required this.minimum,
    this.label = 'Vybráno',
  });

  final int picked;
  final int minimum;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final hasTarget = minimum > 0;
    final isMet = picked >= minimum && (picked > 0 || !hasTarget);
    final color = isMet
        ? primaryColor
        : (isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6));

    return Row(
      children: [
        Icon(isMet ? Icons.check_circle : Icons.radio_button_unchecked, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          hasTarget ? '$label $picked z minimálně $minimum' : '$label $picked',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color),
        ),
      ],
    );
  }
}
