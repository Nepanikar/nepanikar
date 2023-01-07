import 'package:flutter/material.dart';
import 'package:nepanikar/widgets/nepanikar_dialog.dart';
import 'package:nepanikar/widgets/snackbars.dart';

extension SnackbarControllersExt on BuildContext {
  void hideCurrentSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}

extension CustomSnackBar on BuildContext {
  void showSuccessSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.success,
        leading: leading,
        trailing: trailing,
      ),
    );
  }

  void showErrorSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.error,
        leading: leading,
        trailing: trailing,
      ),
    );
  }

  void showInfoSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.info,
        leading: leading,
        trailing: trailing,
      ),
    );
  }

  void showPurpleSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.purple,
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}

extension NepanikarDialogExtension on BuildContext {
  dynamic showNepanikarDialog({
    String? title,
    required String text,
    required String primaryBtnLabel,
    required void Function(BuildContext dialogContext) onPrimaryBtnTap,
    required String secondaryBtnLabel,
    required void Function(BuildContext dialogContext) onSecondaryBtnTap,
  }) {
    return showDialog(
      context: this,
      builder: (context) {
        return NepanikarDialog(
          title: title,
          text: text,
          primaryBtnLabel: primaryBtnLabel,
          onPrimaryBtnTap: onPrimaryBtnTap,
          secondaryBtnLabel: secondaryBtnLabel,
          onSecondaryBtnTap: onSecondaryBtnTap,
        );
      },
    );
  }
}
