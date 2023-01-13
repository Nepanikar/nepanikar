import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/services/db/my_records/diary/my_records_diary_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/diary/diary_edit_content.dart';

class MyRecordsDiaryAddRoute extends GoRouteData {
  const MyRecordsDiaryAddRoute();

  @override
  Widget build(BuildContext context, _) => const MyRecordsDiaryAddScreen();
}

class MyRecordsDiaryAddScreen extends StatelessWidget {
  const MyRecordsDiaryAddScreen({super.key});

  MyRecordsDiaryDao get _myRecordsDiaryDao => registry.get<MyRecordsDiaryDao>();

  @override
  Widget build(BuildContext context) {
    final analytics = registry.get<FirebaseAnalytics>();

    return DiaryEditContent(
      diaryRecordRouteExtraData: null,
      appBarTitle: context.l10n.diary_add_appbar_title,
      primaryButtonText: context.l10n.save,
      onPrimaryButtonTap: (diaryRecord) async {
        // Create a new diary record.
        final goRouter = GoRouter.of(context);
        final id = await _myRecordsDiaryDao.createRecord(diaryRecord);
        unawaited(analytics.logEvent(name: 'diary_record_created'));
        goRouter.pop();
        goRouter.push(
          const MyRecordsDiaryDetailRoute().location,
          extra: DiaryRecordRouteExtraData(
            diaryRecordId: id,
            diaryRecord: diaryRecord,
          ),
        );
      },
      secondaryButtonText: context.l10n.cancel,
      onSecondaryButtonTap: () {
        // Cancel creating a new diary record.
        context.pop();
      },
    );
  }
}
