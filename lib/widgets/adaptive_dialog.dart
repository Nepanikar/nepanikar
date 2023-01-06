import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showAdaptiveDialog(
  BuildContext context, {
  String? title,
  required String description,
  required VoidCallback? onOk,
  VoidCallback? onCancel,
  required String okLabel,
  required String? cancelLabel,
  OkCancelAlertDefaultType defaultType = OkCancelAlertDefaultType.cancel,
}) async {
  final res = await showOkCancelAlertDialog(
    context: context,
    useRootNavigator: false,
    title: Platform.isIOS ? (title ?? description) : title,
    message: Platform.isIOS ? (title != null ? description : null) : description,
    okLabel: okLabel,
    cancelLabel: cancelLabel,
    defaultType: defaultType,
  );

  switch (res) {
    case OkCancelResult.ok:
      onOk?.call();
      break;
    case OkCancelResult.cancel:
      onCancel?.call();
      break;
  }
}
