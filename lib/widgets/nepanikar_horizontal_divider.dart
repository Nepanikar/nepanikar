import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

class NepanikarHorizontalDivider extends StatelessWidget {
  const NepanikarHorizontalDivider({
    super.key,
    this.color,
    this.endIndent,
    this.height = 1,
    this.indent,
    this.thickness = 1,
  });

  final Color? color;
  final double? endIndent;
  final double? height;
  final double? indent;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: color ?? NepanikarColors.primarySwatch.shade200,
    );
  }
}
