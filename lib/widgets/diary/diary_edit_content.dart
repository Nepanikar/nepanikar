import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/services/db/my_records/diary/diary_record_model.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_date_picker.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class DiaryEditContent extends StatefulWidget {
  const DiaryEditContent({
    super.key,
    required this.diaryRecordRouteExtraData,
    required this.appBarTitle,
    required this.primaryButtonText,
    required this.onPrimaryButtonTap,
    required this.secondaryButtonText,
    required this.onSecondaryButtonTap,
  });

  final DiaryRecordRouteExtraData? diaryRecordRouteExtraData;
  final String appBarTitle;
  final String primaryButtonText;
  final ValueChanged<DiaryRecord> onPrimaryButtonTap;
  final String secondaryButtonText;
  final VoidCallback onSecondaryButtonTap;

  @override
  State<DiaryEditContent> createState() => _DiaryEditContentState();
}

class _DiaryEditContentState extends State<DiaryEditContent> {
  late final TextEditingController _titleEditingController;
  late final TextEditingController _textContentEditingController;

  late DateTime _dateTime;

  DiaryRecord? get _initialDiaryRecord => widget.diaryRecordRouteExtraData?.diaryRecord;

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
        appBarTitle: widget.appBarTitle,
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
            text: widget.primaryButtonText,
            expandToContentWidth: true,
            onTap: () => widget.onPrimaryButtonTap(_constructDiaryRecord()),
          ),
          const SizedBox(height: 16),
          NepanikarButton.secondary(
            text: widget.secondaryButtonText,
            expandToContentWidth: true,
            onTap: widget.onSecondaryButtonTap,
          ),
        ],
      ),
    );
  }
}
