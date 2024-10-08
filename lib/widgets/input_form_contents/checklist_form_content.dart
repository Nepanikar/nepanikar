import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/platform_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:nepanikar/services/db/common/checklist_item_model.dart';
import 'package:nepanikar/services/db/common/nepanikar_checklist_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/empty_records_state_widget.dart';
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

  final analytics = registry.get<FirebaseAnalytics>();

  T get _listFormDao => registry.get<T>();

  final _idTextMap = <String, String>{};

  @override
  void initState() {
    super.initState();
    _allFormItemsStream = _listFormDao.allFormItemsRecordsStream;
  }

  Future<void> _onItemAdd() async {
    context.semanticsAnnounce(context.l10n.item_added_announce);
    await _listFormDao.createFormText();
    await analytics.logEvent(name: 'add_activity');
  }

  @override
  void dispose() {
    _idTextMap.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkedTextColor = customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.dark);


    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      excludeFromSemantics: true,
      child: NepanikarScreenWrapper(
        appBarTitle: widget.appBarTitle,
        expandToMaxScreenHeight: true,
        appBarDescription: widget.appBarDescription,
        isCardStackLayout: true,
        isModuleList: false,
        appBarActions: platformMapper<List<Widget>?>(
          ios: () => [
            IconButton(
              icon: const Icon(CupertinoIcons.add),
              tooltip: context.l10n.add_item,
              onPressed: _onItemAdd,
            ),
          ],
          android: () => null,
        ),
        floatingActionButton: platformMapper<Widget?>(
          ios: () => null,
          android: () => FloatingActionButton(
            onPressed: _onItemAdd,
            tooltip: context.l10n.add_item,
            child: const Icon(Icons.add),
          ),
        ),
        children: [
          StreamBuilder<Map<String, ChecklistItem>>(
            stream: _allFormItemsStream,
            builder: (_, snapshot) {
              final savedListItems = snapshot.data ?? {};
              final savedListItemsLength = savedListItems.length;

              if (snapshot.hasData && savedListItems.isEmpty) {
                return const EmptyRecordsStateWidget();
              }

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
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      title: IntrinsicHeight(
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Checkbox(
                                  value: checkFormState,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                  ),
                                  visualDensity: const VisualDensity(
                                    vertical: VisualDensity.minimumDensity,
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
                              ),
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Focus(
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
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            color: checkFormState == true
                                                ? checkedTextColor
                                                : NepanikarColors.primarySwatch.shade400,
                                          ),
                                      decoration: InputDecoration(
                                        hintText: context.l10n.activity_hint_text,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(top: 15, bottom: 8),
                                        suffixIcon: IconButton(
                                          onPressed: () async {
                                            if (FocusScope.of(context).hasFocus) {
                                              FocusScope.of(context).unfocus();
                                            }
                                            context.semanticsAnnounce(
                                              context.l10n.record_deleted_announce,
                                            );
                                            WidgetsBinding.instance.addPostFrameCallback((_) async {
                                              _idTextMap.remove(checkFormKey);
                                              await _listFormDao.deleteFormItem(checkFormKey);
                                              await analytics.logEvent(
                                                name: 'delete_activity',
                                              );
                                            });
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            size: 16,
                                            semanticLabel: context.l10n.delete_record,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
