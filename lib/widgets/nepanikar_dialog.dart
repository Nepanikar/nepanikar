import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

class NepanikarDialog extends StatelessWidget {
  const NepanikarDialog({
    super.key,
    this.title,
    required this.text,
    required this.primaryBtnLabel,
    required this.onPrimaryBtnTap,
    required this.secondaryBtnLabel,
    required this.onSecondaryBtnTap,
  });

  final String? title;
  final String text;
  final String primaryBtnLabel;
  final void Function(BuildContext dialogContext) onPrimaryBtnTap;
  final String secondaryBtnLabel;
  final void Function(BuildContext dialogContext) onSecondaryBtnTap;

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
              ),
              const SizedBox(height: 10),
            ],
            Text(
              text,
              textAlign: TextAlign.center,
              style: NepanikarFonts.bodyRoman,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: NepanikarButton.secondary(
                    onTap: () => onSecondaryBtnTap(context),
                    text: secondaryBtnLabel,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: NepanikarButton(
                    onTap: () => onPrimaryBtnTap(context),
                    text: primaryBtnLabel,
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
