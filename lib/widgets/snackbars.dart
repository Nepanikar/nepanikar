import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/theme.dart';

enum SnackbarColor { success, error, info, purple }

SnackBar nepanikarSnackbar({
  required String text,
  required SnackbarColor color,
  Widget? leading,
  Widget? trailing,
}) {
  return SnackBar(
    elevation: 0,
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
              color: [SnackbarColor.success, SnackbarColor.info].contains(color)
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
    behavior: SnackBarBehavior.floating,
    backgroundColor: _colorFromEnum(color),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  );
}

Color _colorFromEnum(SnackbarColor color) {
  var res = NepanikarColors.primary;
  switch (color) {
    case SnackbarColor.success:
      res = NepanikarColors.success;
      break;
    case SnackbarColor.error:
      res = NepanikarColors.error;
      break;
    case SnackbarColor.info:
      res = NepanikarColors.info;
      break;
    case SnackbarColor.purple:
      res = NepanikarColors.primary;
      break;
  }
  return res;
}
