import 'package:flutter/material.dart';
import 'package:nepanikar/widgets/snackbars.dart';

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
