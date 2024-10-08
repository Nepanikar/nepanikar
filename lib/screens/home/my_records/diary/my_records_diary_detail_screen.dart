import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_edit_screen.dart';
import 'package:nepanikar/services/db/my_records/diary/diary_record_model.dart';
import 'package:nepanikar/services/db/my_records/diary/my_records_diary_dao.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsDiaryDetailRoute extends GoRouteData {
  const MyRecordsDiaryDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MyRecordsDiaryDetailScreen(
      // TODO: Do not found page if state.extra is null
      diaryRecordRouteExtraData: state.extra! as DiaryRecordRouteExtraData,
    );
  }
}

class DiaryRecordRouteExtraData extends Equatable {
  const DiaryRecordRouteExtraData({
    required this.diaryRecordId,
    required this.diaryRecord,
  });

  final String diaryRecordId;
  final DiaryRecord diaryRecord;

  @override
  List<Object> get props => [diaryRecordId, diaryRecord];
}

class MyRecordsDiaryDetailScreen extends StatelessWidget {
  const MyRecordsDiaryDetailScreen({
    super.key,
    required this.diaryRecordRouteExtraData,
  });

  final DiaryRecordRouteExtraData diaryRecordRouteExtraData;

  String get _diaryRecordId => diaryRecordRouteExtraData.diaryRecordId;

  MyRecordsDiaryDao get _myRecordsDiaryDao => registry.get<MyRecordsDiaryDao>();

  @override
  Widget build(BuildContext context) {
    final textColor = textColorBasedOnDarkMode(context);
    final locale = Localizations.localeOf(context);
    final screenSize = context.screenSize;
    final analytics = registry.get<FirebaseAnalytics>();

    return StreamBuilder<DiaryRecord?>(
      stream: _myRecordsDiaryDao.watchRecordById(_diaryRecordId),
      builder: (_, snapshot) {
        final diaryRecord = snapshot.data ?? diaryRecordRouteExtraData.diaryRecord;

        return NepanikarScreenWrapper(
          appBarTitle: context.l10n.diary_detail_appbar_title,
          appBarDescription: '',
          isModuleList: false,
          isCardStackLayout: true,
          children: [
            Text(
              DateFormat.yMd(locale.languageCode).format(diaryRecord.dateTime),
              style: NepanikarFonts.bodySmallHeavy.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              diaryRecord.title,
              style: NepanikarFonts.title3.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor
              ),
            ),
            const SizedBox(height: 16),
            Text(diaryRecord.text, style: NepanikarFonts.bodyRoman.copyWith(color: textColor)),
            SizedBox(height: screenSize.height * 0.2),
            NepanikarButton(
              text: context.l10n.edit,
              expandToContentWidth: true,
              onTap: () => context.push(
                const MyRecordsDiaryEditRoute().location,
                extra: DiaryRecordRouteExtraData(
                  diaryRecordId: _diaryRecordId,
                  diaryRecord: diaryRecord,
                ),
              ),
            ),
            const SizedBox(height: 16),
            NepanikarButton.secondary(
              text: context.l10n.clear_button,
              expandToContentWidth: true,
              onTap: () {
                context.showOkCancelNepanikarDialog(
                  text: context.l10n.really_remove,
                  onPrimaryBtnTap: (context) async {
                    final goRouter = GoRouter.of(context);
                    context.semanticsAnnounce(context.l10n.record_deleted_announce);
                    await _myRecordsDiaryDao.deleteRecord(_diaryRecordId);
                    unawaited(analytics.logEvent(name: 'diary_record_deleted'));
                    goRouter.pop();
                  },
                  primaryBtnLabel: context.l10n.mood_help_yes,
                  secondaryBtnLabel: context.l10n.mood_help_no,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
