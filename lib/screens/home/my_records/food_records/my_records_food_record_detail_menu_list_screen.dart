import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_record_detail_menu_detail_screen.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_dao.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/adaptive_dialog.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_date_picker.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsFoodRecordsDetailMenuListRoute extends GoRouteData {
  const MyRecordsFoodRecordsDetailMenuListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: Unsafe cast.
    final extra = state.extra! as FoodRecordRouteExtraData;
    return MyRecordsFoodRecordsDetailMenuListScreen(
      id: extra.id,
    );
  }
}

class MyRecordsFoodRecordsDetailMenuListScreen extends StatefulWidget {
  const MyRecordsFoodRecordsDetailMenuListScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<MyRecordsFoodRecordsDetailMenuListScreen> createState() =>
      _MyRecordsFoodRecordsDetailMenuListScreenState();
}

class _MyRecordsFoodRecordsDetailMenuListScreenState
    extends State<MyRecordsFoodRecordsDetailMenuListScreen> {
  late final Stream<DailyFoodRecord?> _dailyFoodRecordStream;

  MyRecordsFoodRecordDao get _myRecordsFoodRecordDao => registry.get<MyRecordsFoodRecordDao>();

  @override
  void initState() {
    super.initState();
    _dailyFoodRecordStream = _myRecordsFoodRecordDao.watchRecordById(widget.id);
  }

  Widget _buildFoodTypeTile({
    required DailyFoodRecord foodRecord,
    required FoodType foodType,
    required VoidCallback? onTap,
  }) {
    return ListTile(
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Checkbox(
        value: foodRecord.getIsFoodTaken(foodType),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        onChanged: (_) async =>
            _myRecordsFoodRecordDao.updateMenuTakenState(widget.id, foodRecord, foodType),
      ),
      title: Text(
        foodType.getLabel(context),
        style: NepanikarFonts.bodyHeavy.copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // TODO: l10n
              'Detail záznamu',
              style: NepanikarFonts.bodySmallMedium.copyWith(color: NepanikarColors.primary),
            ),
            const SizedBox(width: 4),
            Assets.icons.navigation.arrowRight.svg(
              width: 16,
              height: 16,
              color: NepanikarColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700);

    return StreamBuilder<DailyFoodRecord?>(
      stream: _dailyFoodRecordStream,
      builder: (_, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final dailyFoodRecord = snapshot.data!;

        return NepanikarScreenWrapper(
          appBarTitle: context.l10n.food_records,
          appBarDescription: '',
          isModuleList: false,
          isCardStackLayout: true,
          children: [
            // TODO: l10n
            Text('Datum zápisu', style: labelTextStyle),
            const SizedBox(height: 8),
            NepanikarDatePicker(
              initialDate: dailyFoodRecord.dateTime,
              onPick: (date) async =>
                  _myRecordsFoodRecordDao.updateRecordDate(widget.id, dailyFoodRecord, date),
            ),
            const SizedBox(height: 24),
            const NepanikarHorizontalDivider(),
            const SizedBox(height: 24),
            for (final foodType in FoodType.values)
              _buildFoodTypeTile(
                foodRecord: dailyFoodRecord,
                foodType: foodType,
                onTap: () => context.push(
                  const MyRecordsFoodRecordsDetailMenuDetailRoute().location,
                  extra: FoodRecordRouteExtraData(
                    id: widget.id,
                    dailyFoodRecord: dailyFoodRecord,
                    foodType: foodType,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            NepanikarButton.secondary(
              // TODO: l10n
              text: 'Smazat záznam',
              expandToContentWidth: true,
              onTap: () async {
                final goRouter = GoRouter.of(context);
                await showAdaptiveDialog(
                  context,
                  description: context.l10n.really_remove,
                  onOk: () async {
                    await _myRecordsFoodRecordDao.deleteRecord(widget.id);
                    goRouter.pop();
                  },
                  okLabel: context.l10n.mood_help_yes,
                  cancelLabel: context.l10n.mood_help_no,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
