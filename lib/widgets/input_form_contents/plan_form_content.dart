import 'package:collection/collection.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/services/db/common/nepanikar_plan_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:sembast/sembast.dart';

/// Static content type of layout for the input forms - number of text input forms stays the same
/// and the user can not add or remove an input form.
class PlanFormContent<T extends NepanikarPlanFormDao> extends StatefulWidget {
  const PlanFormContent({
    super.key,
    required this.appBarTitle,
    required this.appBarDescription,
    required this.planItems,
  });

  final String appBarTitle;
  final String appBarDescription;

  /// Key = title, value = hint text (if present).
  final Map<String, String?> planItems;

  @override
  State<PlanFormContent> createState() => _PlanFormContentState<T>();
}

class _PlanFormContentState<T extends NepanikarPlanFormDao> extends State<PlanFormContent> {
  final _textControllersMap = <int, TextEditingController>{};

  late final Stream<List<RecordSnapshot<String, PlanFormItem?>>> _allFormItemsStream;

  List<String> get planItemsTitles => widget.planItems.keys.toList();

  T get _planFormDao => registry.get<T>();

  void _setFormTextsFromSavedList(List<RecordSnapshot<String, PlanFormItem?>> savedRecords) {
    for (var formIndex = 0; formIndex < planItemsTitles.length; formIndex++) {
      final textController = _textControllersMap[formIndex];
      final formKey = _planFormDao.getFormItemKeyFromFormIndex(formIndex);
      final savedFormRecord = savedRecords.firstWhereOrNull((r) => r.key == formKey);
      final savedFormValue = savedFormRecord?.value ?? '';
      textController
        ?..text = savedFormValue
        ..selection = TextSelection.fromPosition(TextPosition(offset: savedFormValue.length));
    }
  }

  @override
  void initState() {
    super.initState();
    _textControllersMap.addAll(
      planItemsTitles.asMap().map((i, _) => MapEntry(i, TextEditingController())),
    );
    _allFormItemsStream = _planFormDao.allFormItemsRecordsStream;
  }

  @override
  void dispose() {
    for (final textController in _textControllersMap.values) {
      textController.dispose();
    }
    _textControllersMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: NepanikarScreenWrapper(
        appBarTitle: widget.appBarTitle,
        appBarDescription: widget.appBarDescription,
        isCardStackLayout: true,
        isModuleList: false,
        children: [
          StreamBuilder<List<RecordSnapshot<String, PlanFormItem?>>>(
            stream: _allFormItemsStream,
            builder: (_, snapshot) {
              final savedPlanItems = snapshot.data ?? [];
              _setFormTextsFromSavedList(savedPlanItems);

              return SeparatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                separatorBuilder: NepanikarSizes.separatorBuilder(height: 16),
                children: widget.planItems.entries.mapIndexed(
                  (formIndex, entry) {
                    final title = entry.key;
                    final hintText = entry.value;
                    final textController = _textControllersMap[formIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: NepanikarFonts.bodySmallMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Focus(
                          onFocusChange: (hasFocus) async {
                            if (!hasFocus) {
                              await _planFormDao.saveFormText(
                                formIndex,
                                text: textController?.text,
                              );
                            }
                          },
                          child: TextField(
                            controller: textController,
                            minLines: 4,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: hintText,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
