import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/widgets/material_wrapper.dart';

class NepanikarDateRangePicker extends StatelessWidget {
  const NepanikarDateRangePicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.activeRange,
    required this.onPick,
    this.dateFormatLabelPattern,
  });

  final DateTime firstDate;
  final DateTime lastDate;
  final DateTimeRange? activeRange;
  final ValueChanged<DateTimeRange> onPick;
  final String? dateFormatLabelPattern;

  Future<DateTimeRange?> _showDateRangePicker(BuildContext context) {
    return showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: activeRange,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatLabelPattern = this.dateFormatLabelPattern ?? CustomDateFormats.datePickerLabel;
    final backgroundColor = customColorsBasedOnDarkMode(
        context,
        NepanikarColors.dropdownMenuD,
        NepanikarColors.filledContainer,);

    final textColor = customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.dark);
    String formatDate(DateTime date) =>
        DateFormat(dateFormatLabelPattern, Localizations.localeOf(context).languageCode)
            .format(date);

    return MaterialWrapper(
      color: backgroundColor,
      onTap: () async {
        final pickedDateRange = await _showDateRangePicker(context);
        if (pickedDateRange != null) {
          onPick.call(pickedDateRange);
        }
      },
      child: Semantics(
        button: true,
        child: SizedBox(
          height: kMinInteractiveDimension,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    activeRange != null
                        ? '${formatDate(activeRange!.start)} - ${formatDate(activeRange!.end)}'
                        : '',
                    style: NepanikarFonts.bodyRoman.copyWith(color: textColor),
                  ),
                  const Spacer(),
                  ExcludeSemantics(child: Assets.icons.calendar.svg(color: svgColorBasedOnDarkMode(context))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
