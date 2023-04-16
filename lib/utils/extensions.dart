import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        leading: ExcludeSemantics(child: leading),
        trailing: trailing,
      ),
    );
  }

  void showErrorSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.error,
        leading: ExcludeSemantics(child: leading),
        trailing: trailing,
      ),
    );
  }

  void showInfoSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.info,
        leading: ExcludeSemantics(child: leading),
        trailing: trailing,
      ),
    );
  }

  void showPurpleSnackbar({required String text, Widget? leading, Widget? trailing}) {
    ScaffoldMessenger.of(this).showSnackBar(
      nepanikarSnackbar(
        text: text,
        snackbarType: SnackbarType.purple,
        leading: ExcludeSemantics(child: leading),
        trailing: trailing,
      ),
    );
  }
}

extension NepanikarDialogExtension on BuildContext {
  dynamic showOkCancelNepanikarDialog({
    String? title,
    required String? text,
    required String primaryBtnLabel,
    required DialogButtonHandler onPrimaryBtnTap,
    required String secondaryBtnLabel,
    DialogButtonHandler? onSecondaryBtnTap,
    DialogDefaultAction defaultAction = DialogDefaultAction.secondary,
    bool useRootNavigator = true,
    bool popAfterAction = true,
  }) {
    final hasBothTitleAndText = title != null && text != null;
    return showDialog(
      context: this,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return NepanikarDialog(
          title: hasBothTitleAndText ? title : text,
          text: hasBothTitleAndText ? text : '',
          primaryBtnLabel: primaryBtnLabel,
          onPrimaryBtnTap: popAfterAction
              ? (context) {
                  GoRouter.of(context).pop();
                  onPrimaryBtnTap.call(context);
                }
              : onPrimaryBtnTap,
          secondaryBtnLabel: secondaryBtnLabel,
          onSecondaryBtnTap: (context) {
            if (popAfterAction) GoRouter.of(context).pop();
            onSecondaryBtnTap?.call(context);
          },
          defaultAction: defaultAction,
        );
      },
    );
  }
}
