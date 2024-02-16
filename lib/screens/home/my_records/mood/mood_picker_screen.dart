import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';

class MoodPickerRoute extends GoRouteData {
  const MoodPickerRoute();

  @override
  Widget build(BuildContext context, _) => const MoodPickerScreen<MoodTrackDao>();
}


class MoodPickerScreen<T extends MoodTrackDao> extends StatefulWidget{
  const MoodPickerScreen({
    super.key,
    this.showBottomNavbar = true,
    this.mood,
  });

  final bool showBottomNavbar;
  final Mood? mood;

  @override
  State<MoodPickerScreen<T>> createState() => _MoodPickerScreenState<T>();
}

class _MoodPickerScreenState<T extends MoodTrackDao> extends State<MoodPickerScreen<T>>{
  T get _trackDao => registry.get<T>();

  NotificationsService get _notificationsService => registry.get<NotificationsService>();

  DateTime get _now => getNowDateTimeLocal();




  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: pageSidePadding);
    final formattedDate = DateFormat('d. MMM. yyyy   HH:mm').format(_now);
    final textStyleColor = customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.primaryD);


    return Scaffold(
      appBar: AppBar(
        title: Text(
            formattedDate,
            style: NepanikarFonts.title2.copyWith(color: textStyleColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: StreamBuilder<MoodTrack?>(
                  stream: _trackDao.latestMoodTrackStream,
                  builder: (_, snapshot) {
                    final latestMoodTrack = snapshot.data;
                    return MoodPicker(
                      activeMood: latestMoodTrack?.mood,
                      autoSizeTitle: false,
                      onPickMessage: 'yes',
                      onPick: (mood) async {
                        final l10n = context.l10n;
                        await _trackDao.saveMood(mood);
                        unawaited(_notificationsService.rescheduleNotifications(l10n));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}