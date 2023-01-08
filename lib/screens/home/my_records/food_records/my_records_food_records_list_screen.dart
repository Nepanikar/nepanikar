import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/platform_helpers.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_record_detail_menu_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_record_detail_menu_list_screen.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_dao.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/empty_records_state_widget.dart';
import 'package:nepanikar/widgets/food_records/food_record_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsFoodRecordsListRoute extends GoRouteData {
  const MyRecordsFoodRecordsListRoute();

  @override
  Widget build(BuildContext context, _) => const MyRecordsFoodRecordsListScreen();
}

class MyRecordsFoodRecordsListScreen extends StatelessWidget {
  const MyRecordsFoodRecordsListScreen({super.key});

  MyRecordsFoodRecordDao get _myRecordsFoodRecordDao => registry.get<MyRecordsFoodRecordDao>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_records,
      // TODO: l10n
      appBarDescription: '',
      isModuleList: false,
      isCardStackLayout: true,
      expandToMaxScreenHeight: true,
      appBarActions: platformMapper<List<Widget>?>(
        ios: () => [
          IconButton(
            icon: const Icon(CupertinoIcons.add),
            // TODO: l10n
            tooltip: 'Přidat položku',
            onPressed: () async {
              final goRouter = GoRouter.of(context);
              final id = await _myRecordsFoodRecordDao.createRecord();
              goRouter.push(
                const MyRecordsFoodRecordsDetailMenuListRoute().location,
                extra: FoodRecordRouteExtraData(id: id, dailyFoodRecord: getEmptyDailyFoodRecord()),
              );
            },
          ),
        ],
        android: () => null,
      ),
      floatingActionButton: platformMapper<Widget?>(
        ios: () => null,
        android: () => FloatingActionButton(
          onPressed: () async {
            final goRouter = GoRouter.of(context);
            final id = await _myRecordsFoodRecordDao.createRecord();
            goRouter.push(
              const MyRecordsFoodRecordsDetailMenuListRoute().location,
              extra: FoodRecordRouteExtraData(id: id, dailyFoodRecord: getEmptyDailyFoodRecord()),
            );
          },
          // TODO: l10n
          tooltip: 'Přidat položku',
          child: const Icon(Icons.add),
        ),
      ),
      children: [
        StreamBuilder<Map<String, DailyFoodRecord>>(
          stream: _myRecordsFoodRecordDao.allRecordsStream,
          builder: (_, snapshot) {
            final foodRecords = snapshot.data ?? {};
            final foodRecordsLength = foodRecords.length;

            if (snapshot.hasData && foodRecordsLength == 0) {
              return const EmptyRecordsStateWidget();
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodRecordsLength,
              itemBuilder: (_, index) {
                final record = foodRecords.entries.elementAt(index);
                final recordId = record.key;
                final recordData = record.value;

                final isLastItem = index == foodRecordsLength - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: NepanikarSizes.separatorHeight,
                    bottom: isLastItem ? NepanikarSizes.fabBottomPadding : 0,
                  ),
                  child: FoodRecordTile(
                    dailyFoodRecord: recordData,
                    onTap: () {
                      context.push(
                        const MyRecordsFoodRecordsDetailMenuListRoute().location,
                        extra: FoodRecordRouteExtraData(id: recordId, dailyFoodRecord: recordData),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
