import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_track_screen.dart';
import 'package:nepanikar/services/db/my_records/my_records_sleep_track_dao.dart';

class MyRecordsSleepTrackRoute extends GoRouteData {
  const MyRecordsSleepTrackRoute();

  @override
  Widget build(BuildContext context, _) {
    return MoodTrackScreen<MyRecordsSleepTrackDao>(
      appBarTitle: context.l10n.sleep_title,
      headerTitle: context.l10n.sleep_text,
      chartDescription: context.l10n.sleep_track_chart_guide,
      onTrackPickMessage: context.l10n.sleep_tracked_success_snackbar,
      showMoodLabels: false,
    );
  }
}
