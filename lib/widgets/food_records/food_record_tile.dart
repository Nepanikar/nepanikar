import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class FoodRecordTile extends StatelessWidget {
  const FoodRecordTile({
    super.key,
    required this.dailyFoodRecord,
    required this.onTap,
  });

  final DailyFoodRecord dailyFoodRecord;
  final VoidCallback? onTap;

  String _getShortLabel(BuildContext context, FoodType foodType) {
    final label = foodType.getLabel(context);
    return label.length >= 3 ? label.substring(0, 3) : label;
  }

  bool _getIsFoodTypeTaken(FoodType foodType) => dailyFoodRecord.getIsFoodTaken(foodType);

  @override
  Widget build(BuildContext context) {
    const textStyle = NepanikarFonts.bodyHeavy;
    final locale = Localizations.localeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: LongTile(
        image: null,
        text: DateFormat.yMd(locale.languageCode).format(dailyFoodRecord.dateTime),
        textTextStyle: textStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        onTap: null,
        showSubContentSeparator: false,
        subContent: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: FoodType.values
                .mapIndexed(
                  (i, foodType) => Flexible(
                    child: Padding(
                      padding: i == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_getIsFoodTypeTaken(foodType))
                            Assets.icons.checkmarks.success.svg(
                              width: 14,
                              height: 14,
                              color: NepanikarColors.primary,
                            )
                          else
                            Assets.icons.checkmarks.checkCircularUnchecked.svg(
                              width: 14,
                              height: 14,
                              color: NepanikarColors.primarySwatch.shade400,
                            ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              _getShortLabel(context, foodType),
                              maxLines: 1,
                              style: textStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: _getIsFoodTypeTaken(foodType)
                                    ? NepanikarColors.dark
                                    : NepanikarColors.primarySwatch.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
