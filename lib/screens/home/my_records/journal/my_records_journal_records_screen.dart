import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/platform_helpers.dart';
import 'package:nepanikar/screens/home/my_records/journal/my_records_detail_journal_screen.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_dao.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/diary/diary_tile.dart';
import 'package:nepanikar/widgets/empty_records_state_widget.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsJournalRecordsRoute extends GoRouteData {
  const MyRecordsJournalRecordsRoute();

  @override
  Widget build(BuildContext context, _) => const MyRecordsJournalRecordsScreen();
}

class MyRecordsJournalRecordsScreen extends StatelessWidget {
  const MyRecordsJournalRecordsScreen({super.key});

  MyRecordsJournalDao get _myRecordsJournalDao => registry.get<MyRecordsJournalDao>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.journal,
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
              final id = await _myRecordsJournalDao.createRecord(getEmptyJournalRecord());
              goRouter.push(
                const MyRecordsJournalDetailRoute().location,
                extra: JournalRecordRouteExtraData(
                  journalRecordId: id,
                  journalRecord: getEmptyJournalRecord(),
                ),
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
            final id = await _myRecordsJournalDao.createRecord(getEmptyJournalRecord());
            goRouter.push(
              const MyRecordsJournalDetailRoute().location,
              extra: JournalRecordRouteExtraData(
                journalRecordId: id,
                journalRecord: getEmptyJournalRecord(),
              ),
            );
          },
          // TODO: l10n
          tooltip: 'Přidat položku',
          child: const Icon(Icons.add),
        ),
      ),
      children: [
        StreamBuilder<Map<String, JournalRecord>>(
          stream: _myRecordsJournalDao.allRecordsStream,
          builder: (_, snapshot) {
            final journalRecords = snapshot.data ?? {};
            final journalRecordsLength = journalRecords.length;

            if (snapshot.hasData && journalRecordsLength == 0) {
              return const EmptyRecordsStateWidget();
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: journalRecordsLength,
              itemBuilder: (_, index) {
                final record = journalRecords.entries.elementAt(index);
                final recordId = record.key;
                final recordData = record.value;

                final isLastItem = index == journalRecordsLength - 1;
                return Padding(
                  padding: EdgeInsets.only(
                    top: NepanikarSizes.separatorHeight,
                    bottom: isLastItem ? NepanikarSizes.fabBottomPadding : 0,
                  ),
                  child: DiaryTile(
                    date: recordData.dateTime,
                    title: '',
                    onTap: () {
                      context.push(
                        const MyRecordsJournalDetailRoute().location,
                        extra: JournalRecordRouteExtraData(
                          journalRecordId: recordId,
                          journalRecord: recordData,
                        ),
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
