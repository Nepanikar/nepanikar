import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/my_records/mood_track_screen.dart';
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
        text: '${context.l10n.sleep_title} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.diary} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.journal} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.food_records} TODO',
        image: Assets.illustrations.modules.myRecords.svg(),
        onTap: () => {},
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.my_records,
      children: modules,
    );
  }
}
