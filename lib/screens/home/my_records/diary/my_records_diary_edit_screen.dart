import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/services/db/my_records/diary/diary_record_model.dart';
import 'package:nepanikar/services/db/my_records/diary/my_records_diary_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_date_picker.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyRecordsDiaryEditRoute extends GoRouteData {
  const MyRecordsDiaryEditRoute();

  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      child: MyRecordsDiaryEditScreen(
        diaryRecordRouteExtraData: state.extra as DiaryRecordRouteExtraData?,
      ),
    );
  }
}

class MyRecordsDiaryEditScreen extends StatefulWidget {
  const MyRecordsDiaryEditScreen({
    super.key,
    required this.diaryRecordRouteExtraData,
  });

  final DiaryRecordRouteExtraData? diaryRecordRouteExtraData;

  @override
  State<MyRecordsDiaryEditScreen> createState() => _MyRecordsDiaryEditScreenState();
}

class _MyRecordsDiaryEditScreenState extends State<MyRecordsDiaryEditScreen> {
  late final TextEditingController _titleEditingController;
  late final TextEditingController _textContentEditingController;

  late DateTime _dateTime;

  String? get _initialDiaryRecordId => widget.diaryRecordRouteExtraData?.diaryRecordId;

  DiaryRecord? get _initialDiaryRecord => widget.diaryRecordRouteExtraData?.diaryRecord;

  MyRecordsDiaryDao get _myRecordsDiaryDao => registry.get<MyRecordsDiaryDao>();

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController(text: _initialDiaryRecord?.title);
    _textContentEditingController = TextEditingController(text: _initialDiaryRecord?.text);
    _dateTime = _initialDiaryRecord?.dateTime ?? DateTime.now();
  }

  DiaryRecord _constructDiaryRecord() {
    return DiaryRecord(
      dateTime: _dateTime,
      title: _titleEditingController.text,
      text: _textContentEditingController.text,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
    _textContentEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700);

    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: NepanikarScreenWrapper(
        // TODO: l10n
        appBarTitle: _initialDiaryRecordId == null ? 'Nový záznam' : 'Upravit záznam',
        appBarDescription: '',
        isModuleList: false,
        isCardStackLayout: true,
        children: [
          // TODO: l10n
          Text('Datum zápisu', style: labelTextStyle),
          const SizedBox(height: 8),
          NepanikarDatePicker(
            initialDate: _dateTime,
            onPick: (date) {
              setState(() {
                _dateTime = date;
              });
            },
          ),
          const SizedBox(height: 12),
          // TODO: l10n
          Text('Název zápisu', style: labelTextStyle),
          const SizedBox(height: 8),
          TextField(
            controller: _titleEditingController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              // TODO: l10n
              hintText: 'Pojmenujte zápis',
            ),
          ),
          const SizedBox(height: 12),
          // TODO: l10n
          Text('Text zápisu', style: labelTextStyle),
          const SizedBox(height: 8),
          TextField(
            controller: _textContentEditingController,
            textInputAction: TextInputAction.newline,
            minLines: 14,
            maxLines: null,
          ),
          const SizedBox(height: 16),
          NepanikarButton(
            // TODO: l10n
            text: 'Uložit',
            expandToContentWidth: true,
            onTap: () async {
              final goRouter = GoRouter.of(context);
              final initialDiaryRecordId = _initialDiaryRecordId;
              final diaryRecord = _constructDiaryRecord();

              if (initialDiaryRecordId == null) {
                // Create a new diary record.
                final id = await _myRecordsDiaryDao.createRecord(diaryRecord);
                goRouter.pop();
                goRouter.push(
                  const MyRecordsDiaryDetailRoute().location,
                  extra: DiaryRecordRouteExtraData(
                    diaryRecordId: id,
                    diaryRecord: diaryRecord,
                  ),
                );
              } else {
                // Update an existing diary record.
                await _myRecordsDiaryDao.updateRecord(
                  initialDiaryRecordId,
                  updatedDiaryRecord: diaryRecord,
                );
                goRouter.pop();
              }
            },
          ),
          const SizedBox(height: 16),
          NepanikarButton.secondary(
            text: _initialDiaryRecordId == null ? 'Zrušit' : context.l10n.clear_button,
            expandToContentWidth: true,
            onTap: () async {
              final goRouter = GoRouter.of(context);
              final initialDiaryRecordId = _initialDiaryRecordId;

              if (initialDiaryRecordId == null) {
                // Cancel creating a new diary record.
                goRouter.pop();
              } else {
                // Delete an existing diary record.
                await _myRecordsDiaryDao.deleteRecord(initialDiaryRecordId);
                // TODO: Use popUntil instead of pop twice
                goRouter.pop();
                goRouter.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
