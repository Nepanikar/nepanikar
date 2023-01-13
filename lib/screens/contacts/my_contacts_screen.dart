import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/platform_helpers.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_record_model.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_records_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/contacts/my_contact_tile.dart';
import 'package:nepanikar/widgets/empty_records_state_widget.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MyContactsRecordsRoute extends GoRouteData {
  const MyContactsRecordsRoute();

  @override
  Widget build(BuildContext context, _) {
    return const MyContactsRecordsScreen();
  }
}

class MyContactsRecordsScreen extends StatelessWidget {
  const MyContactsRecordsScreen();

  MyContactsRecordsDao get _myContactsRecordsDao => registry.get<MyContactsRecordsDao>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(context.l10n.contacts),
          actions: platformMapper<List<Widget>?>(
            ios: () => [
              IconButton(
                icon: const Icon(CupertinoIcons.add),
                tooltip: context.l10n.add_item,
                onPressed: () async {
                  await _myContactsRecordsDao.addNewRecord();
                },
              ),
            ],
            android: () => null,
          ),
        ),
        floatingActionButton: platformMapper<Widget?>(
          ios: () => null,
          android: () => FloatingActionButton(
            onPressed: () async {
              await _myContactsRecordsDao.addNewRecord();
            },
            tooltip: context.l10n.add_item,
            child: const Icon(Icons.add),
          ),
        ),
        body: StreamBuilder<Map<String, MyContactRecord>>(
          stream: _myContactsRecordsDao.allRecordsStream,
          builder: (_, snapshot) {
            final data = snapshot.data ?? const {};
            return Stack(
              children: [
                const AppBarOverflowContent(
                  appBarDescription: '',
                  isCardStackLayout: false,
                ),
                if (data.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: context.screenHeight * 0.3),
                    child: const EmptyRecordsStateWidget(),
                  )
                else
                  ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      final isLast = index == data.length - 1;
                      final item = data.entries.elementAt(index);
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: isLast ? NepanikarSizes.fabBottomPadding + 20 : 0,
                        ),
                        child: MyContactTile(id: item.key, record: item.value),
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
