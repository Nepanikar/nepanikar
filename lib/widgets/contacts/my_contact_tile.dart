import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_record_model.dart';
import 'package:nepanikar/services/db/my_contacts/my_contacts_records/my_contacts_records_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/adaptive_dialog.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';

class MyContactTile extends StatefulWidget {
  const MyContactTile({
    super.key,
    required this.id,
    required this.record,
  });

  final String id;
  final MyContactRecord record;

  @override
  State<MyContactTile> createState() => _MyContactTileState();
}

class _MyContactTileState extends State<MyContactTile> {
  MyContactsRecordsDao get _myContactsRecordsDao => registry.get<MyContactsRecordsDao>();

  late final TextEditingController _nameController;
  late final TextEditingController _contactAddressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.record.name);
    _contactAddressController = TextEditingController(text: widget.record.contactAddress);
  }

  @override
  void didUpdateWidget(covariant MyContactTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.record.name != widget.record.name) {
      _nameController.text = widget.record.name;
    }
    if (oldWidget.record.contactAddress != widget.record.contactAddress) {
      _contactAddressController.text = widget.record.contactAddress;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _contactAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Assets.icons.userCircle.svg(),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTextField(
                        hintText: context.l10n.my_contacts_names_example,
                        controller: _nameController,
                        onChanged: (value) async =>
                            _myContactsRecordsDao.updateName(widget.id, widget.record, value),
                      ),
                      _buildTextField(
                        // TODO: l10n Martin
                        hintText: 'Telefon',
                        controller: _contactAddressController,
                        onChanged: (value) async => _myContactsRecordsDao.updateContactAddress(
                          widget.id,
                          widget.record,
                          value,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: NepanikarColors.primarySwatch.shade500, size: 20),
                  onPressed: () async {
                    await showAdaptiveDialog(
                      context,
                      description: context.l10n.really_remove,
                      onOk: () async => _myContactsRecordsDao.deleteRecord(widget.id),
                      okLabel: context.l10n.mood_help_yes,
                      cancelLabel: context.l10n.mood_help_no,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            NepanikarHorizontalDivider(color: NepanikarColors.primarySwatch.shade100),
            SizedBox(
              width: context.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Row(
                    children: [
                      TextButton(
                        style: buttonStyle,
                        // TODO: l10n Martin
                        child: const Text('Poslat sms'),
                        onPressed: () => launchSmsNum(_contactAddressController.text),
                      ),
                      TextButton(
                        style: buttonStyle,
                        // TODO: l10n Martin
                        child: const Text('Zavolat'),
                        onPressed: () => launchPhoneNum(_contactAddressController.text),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    required ValueChanged<String> onChanged,
  }) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          onChanged(controller.text);
        }
      },
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
