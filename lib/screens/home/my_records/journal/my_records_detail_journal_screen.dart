import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_dao.dart';
import 'package:nepanikar/services/db/my_records/journal/my_records_journal_record_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/adaptive_dialog.dart';
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

  Map<JournalQuestion, String> get _answers => {
        for (final entry in _textEditingControllersMap.entries) entry.key: entry.value.text,
      };

  late final Stream<JournalRecord?> _journalRecordStream;

  MyRecordsJournalDao get _myRecordsJournalDao => registry.get<MyRecordsJournalDao>();

  DateTime? _selectedDate;

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

  void _setTextsFromJournalRecord(JournalRecord journalRecord) {
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
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: StreamBuilder<JournalRecord?>(
        stream: _journalRecordStream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          final journalRecord = snapshot.data!;
          _setTextsFromJournalRecord(journalRecord);
          if (_selectedDate == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _selectedDate = journalRecord.dateTime;
              });
            });
          }

          return NepanikarScreenWrapper(
            appBarTitle: context.l10n.journal,
            appBarDescription: '',
            isModuleList: false,
            isCardStackLayout: true,
            children: [
              // TODO: l10n
              NepanikarDatePicker(
                initialDate: _selectedDate ?? journalRecord.dateTime,
                onPick: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              const SizedBox(height: 12),
              _generateFields(),
              const SizedBox(height: 16),
              NepanikarButton(
                // TODO: l10n
                text: 'Uložit',
                expandToContentWidth: true,
                onTap: () async {
                  final journalRecord = _constructJournalRecord(_selectedDate!);
                  await _myRecordsJournalDao.updateRecord(
                    widget.journalId,
                    updatedJournalRecord: journalRecord,
                  );
                  if (mounted) FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(height: 16),
              NepanikarButton.secondary(
                // TODO: l10n
                text: context.l10n.clear_button,
                expandToContentWidth: true,
                onTap: () async {
                  final goRouter = GoRouter.of(context);
                  await showAdaptiveDialog(
                    context,
                    description: context.l10n.really_remove,
                    onOk: () async {
                      await _myRecordsJournalDao.deleteRecord(widget.journalId);
                      goRouter.pop();
                    },
                    okLabel: context.l10n.mood_help_yes,
                    cancelLabel: context.l10n.mood_help_no,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _generateFields() {
    final labelTextStyle = NepanikarFonts.bodySmallHeavy.copyWith(fontWeight: FontWeight.w700);
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
                ),
              ],
            ),
        ],
      ),
    );
  }
}
