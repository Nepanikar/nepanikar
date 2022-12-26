import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';

class EmptyRecordsStateWidget extends StatelessWidget {
  const EmptyRecordsStateWidget({
    super.key,
    this.emptyText,
  });

  final String? emptyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: context.screenHeight * 0.25),
        Assets.illustrations.modules.myRecords.svg(
          width: context.screenWidth * 0.205,
          color: NepanikarColors.primarySwatch.shade400,
        ),
        const SizedBox(height: 26),
        Text(
          // TODO: l10n
          emptyText ?? 'Zatím nemáš žádný záznam',
          textAlign: TextAlign.center,
          style: NepanikarFonts.title3.copyWith(
            fontWeight: FontWeight.w500,
            color: NepanikarColors.primarySwatch.shade400,
          ),
        ),
      ],
    );
  }
}
