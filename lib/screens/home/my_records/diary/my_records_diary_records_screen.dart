import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_edit_screen.dart';
import 'package:nepanikar/services/db/my_records/diary/diary_record_model.dart';
import 'package:nepanikar/services/db/my_records/diary/my_records_diary_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/diary/diary_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsDiaryRecordsRoute extends GoRouteData {
  const MyRecordsDiaryRecordsRoute();

  @override
  Widget build(BuildContext context) => const MyRecordsDiaryRecordsScreen();
}

class MyRecordsDiaryRecordsScreen extends StatelessWidget {
  const MyRecordsDiaryRecordsScreen({super.key});

  MyRecordsDiaryDao get _myRecordsDiaryDao => registry.get<MyRecordsDiaryDao>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.diary,
      // TODO: l10n
      appBarDescription:
          'Zapisujte si vaše dosažené výsledky a posuny. Můžete se kdykoliv k záznamům vrátit.',
      isModuleList: false,
      isCardStackLayout: true,
      expandToMaxScreenHeight: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(const MyRecordsDiaryEditRoute().location),
        child: const Icon(Icons.add),
      ),
      children: [
        StreamBuilder<Map<String, DiaryRecord>>(
          stream: _myRecordsDiaryDao.allRecordsStream,
          builder: (_, snapshot) {
            final diaryRecords = snapshot.data ?? {};
            final diaryRecordsLength = diaryRecords.length;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: diaryRecordsLength,
              itemBuilder: (_, index) {
                final record = diaryRecords.entries.elementAt(index);
                final recordId = record.key;
                final recordData = record.value;

                final isLastItem = index == diaryRecordsLength - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: NepanikarSizes.separatorHeight,
                    bottom: isLastItem ? NepanikarSizes.fabBottomPadding : 0,
                  ),
                  child: DiaryTile(
                    date: recordData.dateTime,
                    title: recordData.title,
                    onTap: () => context.push(
                      const MyRecordsDiaryDetailRoute().location,
                      extra: DiaryRecordRouteExtraData(
                        diaryRecordId: recordId,
                        diaryRecord: recordData,
                      ),
                    ),
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
