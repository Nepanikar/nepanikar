import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/my_contacts/my_contact_crisis_message_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

class CrisisMessageRoute extends GoRouteData {
  const CrisisMessageRoute();

  @override
  Widget build(BuildContext context, _) => const CrisisMessageScreen();
}

class CrisisMessageScreen extends StatefulWidget {
  const CrisisMessageScreen({super.key});

  @override
  State<CrisisMessageScreen> createState() => _CrisisMessageScreenState();
}

class _CrisisMessageScreenState extends State<CrisisMessageScreen> {
  MyContactsCrisisMessageDao get _myContactsCrisisMessageDao =>
      registry.get<MyContactsCrisisMessageDao>();

  final _addressEmailController = TextEditingController();
  final _messageTextController = TextEditingController();

  late final Stream<Tuple2<String, String>> _contactAddressAndMessageStream;

  @override
  void initState() {
    super.initState();
    _contactAddressAndMessageStream = _myContactsCrisisMessageDao.contactAddressAndMessageStream;
  }

  Widget _buildForm({
    required TextEditingController textController,
    required String initialValue,
    required String labelText,
    required String hintText,
    required int minLines,
    required VoidCallback onSaved,
  }) {
    textController
      ..text = initialValue
      ..selection = TextSelection.fromPosition(TextPosition(offset: initialValue.length));
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: NepanikarFonts.bodySmallMedium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Focus(
          onFocusChange: (hasFocus) async {
            if (!hasFocus) {
              onSaved();
            }
          },
          child: TextField(
            controller: textController,
            minLines: minLines,
            maxLines: null,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => FocusScope.of(context).unfocus(),
      child: NepanikarScreenWrapper(
        appBarTitle: context.l10n.contacts_message,
        appBarDescription: '',
        expandToMaxScreenHeight: true,
        isCardStackLayout: true,
        isModuleList: false,
        children: [
          StreamBuilder<Tuple2<String, String>>(
            stream: _contactAddressAndMessageStream,
            builder: (_, snapshot) {
              final contactAddress = snapshot.data?.item1 ?? '';
              final message = snapshot.data?.item2 ?? '';

              return Column(
                children: [
                  _buildForm(
                    textController: _addressEmailController,
                    initialValue: contactAddress,
                    labelText: context.l10n.my_contacts_numbers_example,
                    hintText: context.l10n.custom_write,
                    minLines: 1,
                    onSaved: () async {
                      await _myContactsCrisisMessageDao.saveContactAddress(
                        _addressEmailController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  _buildForm(
                    textController: _messageTextController,
                    initialValue: message,
                    labelText: context.l10n.message_text,
                    hintText: context.l10n.custom_write_body,
                    minLines: 2,
                    onSaved: () async {
                      await _myContactsCrisisMessageDao.saveBodyMessage(
                        _messageTextController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _addressEmailController,
                    builder: (_, value, __) {
                      final contactText = _messageTextController.text;
                      final address = value.text;

                      return NepanikarButton(
                        onTap: () async {
                          final isEmail = address.contains('@');
                          final uri = Uri(
                            scheme: isEmail ? 'mailto' : 'sms',
                            path: address,
                            queryParameters: {
                              if (isEmail) 'subject': context.l10n.contacts_message,
                              'body': contactText,
                            },
                          );
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            debugPrint('Could not launch $uri');
                          }
                        },
                        expandToContentWidth: true,
                        enabled: address.isNotEmpty,
                        text: context.l10n.send,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
