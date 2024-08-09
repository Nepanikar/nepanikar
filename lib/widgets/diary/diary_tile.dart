import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/widgets/long_tile.dart';

class DiaryTile extends StatelessWidget {
  const DiaryTile({
    super.key,
    required this.date,
    required this.title,
    required this.onTap,
    this.isTitle = true,
  });

  final DateTime date;
  final String title;
  final VoidCallback? onTap;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final svgColor = svgColorBasedOnDarkMode(context);
    final longTileColor = customColorsBasedOnDarkMode(context, NepanikarColors.containerD, NepanikarColors.primarySwatch.shade700);

    const textStyle = NepanikarFonts.bodyHeavy;
    final locale = Localizations.localeOf(context);

    return LongTile(
      isDarkMode: isDarkMode,
      image: Assets.illustrations.modules.myRecords.svg(color: svgColor),
      text: DateFormat.yMd(locale.languageCode).format(date),
      textTextStyle: textStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: NepanikarColors.primarySwatch.shade700,
      ),
      description: title,
      descriptionSemanticsEnabled: isTitle,
      descriptionTextStyle: textStyle.copyWith(
        fontWeight: isTitle ? FontWeight.w500 : FontWeight.w300,
      ),
      descriptionMaxLines: 1,
      onTap: onTap,
    );
  }
}
