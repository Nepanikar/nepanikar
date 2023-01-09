import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
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
    const textStyle = NepanikarFonts.bodyHeavy;
    final locale = Localizations.localeOf(context);

    return LongTile(
      image: Assets.illustrations.modules.myRecords.svg(),
      text: DateFormat.yMd(locale.languageCode).format(date),
      textTextStyle: textStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: NepanikarColors.primarySwatch.shade700,
      ),
      description: title,
      descriptionTextStyle: textStyle.copyWith(
        fontWeight: isTitle ? FontWeight.w500 : FontWeight.w300,
      ),
      descriptionMaxLines: 1,
      onTap: onTap,
    );
  }
}
