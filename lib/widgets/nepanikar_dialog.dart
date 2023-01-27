import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

enum DialogDefaultAction {
  primary,
  secondary,
  both,
  neither;
}

typedef DialogButtonHandler = void Function(BuildContext dialogContext);

class NepanikarDialog extends StatelessWidget {
  const NepanikarDialog({
    super.key,
    this.title,
    required this.text,
    required this.primaryBtnLabel,
    required this.onPrimaryBtnTap,
    required this.secondaryBtnLabel,
    required this.onSecondaryBtnTap,
    required this.defaultAction,
  });

  final String? title;
  final String text;
  final String primaryBtnLabel;
  final DialogButtonHandler onPrimaryBtnTap;
  final String secondaryBtnLabel;
  final DialogButtonHandler onSecondaryBtnTap;
  final DialogDefaultAction defaultAction;

  Widget _buildButton(
    BuildContext context, {
    required bool isPrimaryAction,
    required String label,
    required DialogButtonHandler onTap,
  }) {
    if (isPrimaryAction) {
      return NepanikarButton(
        onTap: () => onTap.call(context),
        text: label,
      );
    }

    return NepanikarButton.secondary(
      onTap: () => onTap.call(context),
      text: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: NepanikarFonts.dialogTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
            Text(
              text,
              textAlign: TextAlign.center,
              style: NepanikarFonts.bodyRoman,
            ),
            SizedBox(height: text.isEmpty ? 10 : 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _buildButton(
                    context,
                    isPrimaryAction: defaultAction == DialogDefaultAction.secondary ||
                        defaultAction == DialogDefaultAction.both,
                    onTap: onSecondaryBtnTap,
                    label: secondaryBtnLabel,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: _buildButton(
                    context,
                    isPrimaryAction: defaultAction == DialogDefaultAction.primary ||
                        defaultAction == DialogDefaultAction.both,
                    onTap: onPrimaryBtnTap,
                    label: primaryBtnLabel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
