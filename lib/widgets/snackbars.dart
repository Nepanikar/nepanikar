import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/theme.dart';

enum SnackbarType {
  success(NepanikarColors.success),
  error(NepanikarColors.error),
  info(NepanikarColors.info),
  purple(NepanikarColors.primary);

  const SnackbarType(this.color);
  final Color color;
}

SnackBar nepanikarSnackbar({
  required String text,
  required SnackbarType snackbarType,
  Widget? leading,
  Widget? trailing,
}) {
  return SnackBar(
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: leading,
          ),
        Expanded(
          child: Text(
            text,
            style: NepanikarTheme.bodyHeavy.copyWith(
              color: [NepanikarColors.success, NepanikarColors.info].contains(snackbarType.color)
                  ? NepanikarColors.dark
                  : Colors.white,
            ),
          ),
        ),
        if (trailing != null)
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: trailing,
          ),
      ],
    ),
    margin: const EdgeInsets.all(20),
    backgroundColor: snackbarType.color,
  );
}
