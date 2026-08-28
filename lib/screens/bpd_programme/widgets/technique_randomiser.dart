import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/technique_menu_page.dart';

/// Draws one technique at random out of [techniques] and shows it as a card.
///
/// Week 4 Day 4 asks the user to revisit a mindfulness technique from Week 2;
/// the source suggests doing it "například i formou „kola štěstí"". A button
/// rather than a spinning wheel: it works with a screen reader, needs no
/// motion, and the point of drawing — removing the paralysis of choosing from
/// eight options — survives either way.
///
/// Nothing is persisted. This is a nudge, not a record, and it must always be
/// possible to draw again: a draw the user cannot refuse would turn a playful
/// prompt into an assignment.
class TechniqueRandomiser extends StatefulWidget {
  const TechniqueRandomiser({super.key, required this.techniques, required this.sourceLabel});

  final List<TechniqueData> techniques;

  /// Shown in the detail sheet and stored with a rescue-package save.
  final String sourceLabel;

  @override
  State<TechniqueRandomiser> createState() => _TechniqueRandomiserState();
}

class _TechniqueRandomiserState extends State<TechniqueRandomiser> {
  final _random = Random();
  TechniqueData? _drawn;

  void _draw() {
    if (widget.techniques.isEmpty) return;
    setState(() {
      if (widget.techniques.length == 1) {
        _drawn = widget.techniques.first;
        return;
      }
      // Never hand back the same technique twice in a row — "draw another"
      // that redraws what you just got reads as a broken button.
      TechniqueData next;
      do {
        next = widget.techniques[_random.nextInt(widget.techniques.length)];
      } while (next.id == _drawn?.id);
      _drawn = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawn = _drawn;
    if (drawn == null) {
      return _DrawButton(label: 'Vylosovat techniku', icon: Icons.casino_outlined, onTap: _draw);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DrawnCard(technique: drawn, sourceLabel: widget.sourceLabel),
        const SizedBox(height: 10),
        _DrawButton(label: 'Vylosovat jinou', icon: Icons.refresh, onTap: _draw, ghost: true),
      ],
    );
  }
}

class _DrawButton extends StatelessWidget {
  const _DrawButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.ghost = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool ghost;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    if (ghost) {
      return TextButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          minimumSize: const Size(0, 44),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _DrawnCard extends StatelessWidget {
  const _DrawnCard({required this.technique, required this.sourceLabel});

  final TechniqueData technique;
  final String sourceLabel;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor, width: 2),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'VYLOSOVÁNO',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.6,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Icon(technique.icon, size: 38, color: primaryColor),
          const SizedBox(height: 10),
          Text(
            technique.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            technique.shortDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  showTechniqueDetailSheet(context, technique: technique, sourceLabel: sourceLabel),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 46),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              child: const Text('Otevřít techniku'),
            ),
          ),
        ],
      ),
    );
  }
}
