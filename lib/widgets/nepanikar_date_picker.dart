import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/material_wrapper.dart';

class NepanikarDatePicker extends StatelessWidget {
  const NepanikarDatePicker({
    super.key,
    this.initialDate,
    required this.onPick,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onPick;

  Future<DateTime?> _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(now.year + 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final dateToDisplay = initialDate ?? DateTime.now();
    return MaterialWrapper(
      color: NepanikarColors.filledContainer,
      onTap: () async {
        final pickedDate = await _showDatePicker(context);
        if (pickedDate != null) {
          onPick.call(pickedDate);
        }
      },
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
                  DateFormat.yMd(locale.languageCode).format(dateToDisplay),
                  style: NepanikarFonts.bodyRoman.copyWith(color: NepanikarColors.dark),
                ),
                const Spacer(),
                Assets.icons.calendar.svg(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
