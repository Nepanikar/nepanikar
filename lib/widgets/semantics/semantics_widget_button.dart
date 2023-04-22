import 'package:flutter/material.dart';

class SemanticsWidgetButton extends StatelessWidget {
  const SemanticsWidgetButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.child,
  });

  final String label;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
