import 'package:flutter/material.dart';

class MaterialWrapper extends StatelessWidget {
  const MaterialWrapper({
    super.key,
    required this.color,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    required this.child,
  });

  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      clipBehavior: Clip.antiAlias,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
