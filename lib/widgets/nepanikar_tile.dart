import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

class NepanikarTile extends StatelessWidget {
  const NepanikarTile({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: NepanikarColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
