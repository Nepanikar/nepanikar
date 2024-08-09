import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_dao.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_record_model.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_date_picker.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyRecordsJournalDetailRoute extends GoRouteData {
  const MyRecordsJournalDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: Unsafe cast.
    final extra = state.extra! as JournalRecordRouteExtraData;
    return MyRecordsJournalDetailScreen(
      journalId: extra.journalRecordId,
    );
  }
}

class JournalRecordRouteExtraData extends Equatable {
  const JournalRecordRouteExtraData({
    required this.journalRecordId,
    required this.journalRecord,
  });

  final String journalRecordId;
  final JournalRecord journalRecord;

  @override
  List<Object> get props => [journalRecordId, journalRecord];
}

class MyRecordsJournalDetailScreen extends StatefulWidget {
  const MyRecordsJournalDetailScreen({
    super.key,
    required this.journalId,
  });

  final String journalId;

  @override
  State<MyRecordsJournalDetailScreen> createState() => _MyRecordsJournalDetailScreenState();
}

class _MyRecordsJournalDetailScreenState extends State<MyRecordsJournalDetailScreen> {
  final Map<JournalQuestion, TextEditingController> _textEditingControllersMap = {};

  final analytics = registry.get<FirebaseAnalytics>();

  Map<JournalQuestion, String> get _answers => {
        for (final entry in _textEditingControllersMap.entries) entry.key: entry.value.text,
      };

  late final Stream<JournalRecord?> _journalRecordStream;

  MyRecordsJournalDao get _myRecordsJournalDao => registry.get<MyRecordsJournalDao>();

  DateTime? _selectedDate;

  bool _initialTextsSet = false;

  @override
  void initState() {
    super.initState();
    for (final question in JournalQuestion.values) {
      _textEditingControllersMap[question] = TextEditingController();
    }
    _journalRecordStream = _myRecordsJournalDao.watchRecordById(widget.journalId);
  }

  @override
  void dispose() {
    for (final controller in _textEditingControllersMap.values) {
      controller.dispose();
    }
    _textEditingControllersMap.clear();
    super.dispose();
  }

  JournalRecord _constructJournalRecord(DateTime dateTime) {
    return JournalRecord(
      dateTime: dateTime,
      answers: _answers.entries
          .map(
            (e) => JournalRecordAnswer(question: e.key, answer: e.value),
          )
          .toList(),
    );
  }

  void _setInitialTextsFromJournalRecord(JournalRecord journalRecord) {
    if (_initialTextsSet) return;
    _initialTextsSet = true;
    for (final answer in journalRecord.answers) {
      final controller = _textEditingControllersMap[answer.question];
      if (controller != null) {
        controller
          ..text = answer.answer
          ..selection = TextSelection.fromPosition(TextPosition(offset: answer.answer.length));
        _answers[answer.question] = answer.answer;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = textColorBasedOnDarkMode(context);
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700, color: textColor);

    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      excludeFromSemantics: true,
      child: StreamBuilder<JournalRecord?>(
        stream: _journalRecordStream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          final journalRecord = snapshot.data!;
          _setInitialTextsFromJournalRecord(journalRecord);
          if (_selectedDate == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _selectedDate = journalRecord.dateTime;
              });
            });
          }

          return GestureDetector(
            child: NepanikarScreenWrapper(
              appBarTitle: context.l10n.journal,
              appBarDescription: '',
              isModuleList: false,
              isCardStackLayout: true,
              children: [
                Text(context.l10n.date_of_note, style: labelTextStyle),
                const SizedBox(height: 8),
                NepanikarDatePicker(
                  initialDate: _selectedDate ?? journalRecord.dateTime,
                  onPick: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 12),
                _generateFields(textColor),
                const SizedBox(height: 16),
                NepanikarButton(
                  text: context.l10n.save,
                  expandToContentWidth: true,
                  onTap: () async {
                    final goRouter = GoRouter.of(context);
                    context.semanticsAnnounce(context.l10n.record_saved_announce);
                    final journalRecord = _constructJournalRecord(_selectedDate!);
                    await _myRecordsJournalDao.updateRecord(
                      widget.journalId,
                      updatedJournalRecord: journalRecord,
                    );
                    goRouter.pop();
                  },
                ),
                const SizedBox(height: 16),
                NepanikarButton.secondary(
                  text: context.l10n.clear_button,
                  expandToContentWidth: true,
                  onTap: () async {
                    await context.showOkCancelNepanikarDialog(
                      text: context.l10n.really_remove,
                      onPrimaryBtnTap: (context) async {
                        final goRouter = GoRouter.of(context);
                        context.semanticsAnnounce(context.l10n.record_deleted_announce);
                        await _myRecordsJournalDao.deleteRecord(widget.journalId);
                        unawaited(analytics.logEvent(name: 'journal_record_deleted'));
                        goRouter.pop();
                      },
                      primaryBtnLabel: context.l10n.mood_help_yes,
                      secondaryBtnLabel: context.l10n.mood_help_no,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _generateFields(Color? textColor) {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700, color: textColor);
    return Form(
      child: Column(
        children: [
          for (final question in JournalQuestion.values)
            Column(
              children: [
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    question.getQuestionLabel(context),
                    style: labelTextStyle,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _textEditingControllersMap[question],
                  textInputAction: TextInputAction.next,
                  minLines: 1,
                  maxLines: null,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
