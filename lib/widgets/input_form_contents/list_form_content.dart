import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/services/db/common/nepanikar_list_form_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:sembast/sembast.dart';

class ListFormContent<T extends NepanikarListFormDao> extends StatefulWidget {
  const ListFormContent({
    super.key,
    required this.appBarTitle,
    required this.appBarDescription,
  });

  final String appBarTitle;
  final String appBarDescription;

  @override
  State<ListFormContent> createState() => _ListFormContentState<T>();
}

class _ListFormContentState<T extends NepanikarListFormDao> extends State<ListFormContent> {
  late final Stream<List<RecordSnapshot<String, ListFormItem>>> _allFormItemsStream;

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
          StreamBuilder<List<RecordSnapshot<String, ListFormItem>>>(
            stream: _allFormItemsStream,
            builder: (_, snapshot) {
              final savedListItems = snapshot.data ?? [];
              final savedListItemsLength = savedListItems.length;

              return ListView.separated(
                itemCount: savedListItems.length,
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (_, __) => NepanikarHorizontalDivider(
                  color: NepanikarColors.primarySwatch.shade100,
                ),
                itemBuilder: (_, i) {
                  final record = savedListItems[i];
                  final formKey = record.key;
                  final formText = record.value;
                  final isLastItem = i == savedListItemsLength - 1;

                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: isLastItem ? NepanikarSizes.fabBottomPadding : 0),
                    child: ListTile(
                      key: Key(formKey),
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      title: Focus(
                        onFocusChange: (hasFocus) async {
                          if (!hasFocus) {
                            final value = _idTextMap[formKey];
                            if (value != null) {
                              await _listFormDao.updateFormText(formKey, text: value);
                            }
                          }
                        },
                        child: TextFormField(
                          initialValue: formText,
                          onChanged: (value) => _idTextMap[formKey] = value,
                          minLines: 1,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            // TODO: l10n
                            hintText: 'Odpověď',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 12, left: 14),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                if (FocusScope.of(context).hasFocus) {
                                  FocusScope.of(context).unfocus();
                                }
                                WidgetsBinding.instance.addPostFrameCallback((_) async {
                                  _idTextMap.remove(formKey);
                                  await _listFormDao.deleteFormItem(formKey);
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
