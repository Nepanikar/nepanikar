import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/services/db/common/checklist_item_model.dart';
import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class ChecklistFormContent<T extends NepanikarCheckListFormDao> extends StatefulWidget {
  const ChecklistFormContent({
    super.key,
    required this.appBarTitle,
    required this.appBarDescription,
  });

  final String appBarTitle;
  final String appBarDescription;

  @override
  State<ChecklistFormContent> createState() => _ChecklistFormContentState<T>();
}

class _ChecklistFormContentState<T extends NepanikarCheckListFormDao>
    extends State<ChecklistFormContent> {
  late final Stream<Map<String, ChecklistItem>> _allFormItemsStream;

  T get _listFormDao => registry.get<T>();

  final _idTextMap = <String, String>{};

  @override
  void initState() {
    super.initState();
    _allFormItemsStream = _listFormDao.allFormItemsRecordsStream;
  }

  @override
  void dispose() {
    _idTextMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: NepanikarScreenWrapper(
        appBarTitle: widget.appBarTitle,
        expandToMaxScreenHeight: true,
        appBarDescription: widget.appBarDescription,
        isCardStackLayout: true,
        isModuleList: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () async => _listFormDao.createFormText(),
          child: const Icon(Icons.add),
        ),
        children: [
          StreamBuilder<Map<String, ChecklistItem>>(
            stream: _allFormItemsStream,
            builder: (_, snapshot) {
              final savedListItems = snapshot.data ?? {};
              final savedListItemsLength = savedListItems.length;

              return ListView.separated(
                itemCount: savedListItems.length,
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (_, __) => NepanikarHorizontalDivider(
                  color: NepanikarColors.primarySwatch.shade100,
                ),
                itemBuilder: (_, i) {
                  final record = savedListItems.entries.elementAt(i);
                  final checkFormKey = record.key;
                  final checkForm = record.value;
                  final checkFormState = checkForm.isChecked;
                  final checkFormText = checkForm.text;
                  final isLastItem = i == savedListItemsLength - 1;

                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: isLastItem ? NepanikarSizes.fabBottomPadding : 0),
                    child: ListTile(
                      key: Key(checkFormKey),
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Checkbox(
                        value: checkFormState,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        onChanged: (value) async {
                          if (value != null) {
                            await _listFormDao.updateFormState(
                              checkFormKey,
                              item: checkForm,
                            );
                          }
                        },
                      ),
                      title: Focus(
                        onFocusChange: (hasFocus) async {
                          if (!hasFocus) {
                            final value = _idTextMap[checkFormKey];
                            if (value != null) {
                              await _listFormDao.updateFormText(
                                checkFormKey,
                                item: checkForm,
                                newText: value,
                              );
                            }
                          }
                        },
                        child: TextFormField(
                          initialValue: checkFormText,
                          onChanged: (value) => _idTextMap[checkFormKey] = value,
                          minLines: 1,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: checkFormState == true
                                    ? NepanikarColors.dark
                                    : NepanikarColors.primarySwatch.shade400,
                              ),
                          decoration: InputDecoration(
                            // TODO: l10n
                            hintText: 'Aktivita',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 14),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                if (FocusScope.of(context).hasFocus) {
                                  FocusScope.of(context).unfocus();
                                }
                                WidgetsBinding.instance.addPostFrameCallback((_) async {
                                  _idTextMap.remove(checkFormKey);
                                  await _listFormDao.deleteFormItem(checkFormKey);
                                });
                              },
                              icon: const Icon(Icons.clear, size: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
