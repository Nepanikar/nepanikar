import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_dao.dart';
import 'package:nepanikar/services/db/my_records/food/my_records_food_record_model.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_dao.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/data_dialog.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsRoute extends GoRouteData {
  const MyRecordsRoute();

  @override
  Widget build(BuildContext context) => const MyRecordsScreen();
}

class MyRecordsScreen extends StatelessWidget {
  const MyRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.depression_mood,
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => context.push(const MoodTrackRoute().location),
      ),
      LongTile(
        text: context.l10n.sleep_title,
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => context.push(const MyRecordsSleepTrackRoute().location),
      ),
      LongTile(
        text: context.l10n.diary,
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => context.push(const MyRecordsDiaryRecordsRoute().location),
      ),
      LongTile(
        text: '${context.l10n.journal} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        // TODO:
        onTap: () => showDataDialog<Map<String, JournalRecord>>(
          context,
          dataStream: registry.get<MyRecordsJournalDao>().allRecordsStream,
          itemBuilder: (itemsMap) => Column(
            children: itemsMap.values.map((v) => Text('${v.toString()}\n\n')).toList(),
          ),
        ),
      ),
      LongTile(
        text: '${context.l10n.food_records} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        // TODO:
        onTap: () => showDataDialog<Map<String, DailyFoodRecord>>(
          context,
          dataStream: registry.get<MyRecordsFoodRecordDao>().allRecordsStream,
          itemBuilder: (itemsMap) => Column(
            children: itemsMap.values.map((v) => Text('${v.toString()}\n\n')).toList(),
          ),
        ),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.my_records,
      children: modules,
    );
  }
}
