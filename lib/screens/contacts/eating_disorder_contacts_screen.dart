import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify/linkify.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/custom_linkifiers.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderContactsRoute extends GoRouteData {
  const EatingDisorderContactsRoute();

  ContactsDataManager get _contactsManager => registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    final eatingDisorderContacts =
        _contactsManager.getContactsFromLocale(locale).eatingDisorderContacts;
    return EatingDisorderContactsScreen(
      appBarTitle: context.l10n.universities,
      eatingDisorderContacts: eatingDisorderContacts ?? [],
    );
  }
}

class EatingDisorderContactsScreen extends StatelessWidget {
  const EatingDisorderContactsScreen({
    super.key,
    required this.appBarTitle,
    required this.eatingDisorderContacts,
  });

  final String appBarTitle;
  final List<String> eatingDisorderContacts;

  @override
  Widget build(BuildContext context) {
    final linkifiedTextStyle = NepanikarFonts.bodyBlack.copyWith(
      color: NepanikarColors.primary,
      decoration: TextDecoration.underline,
    );

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_contact,
      isModuleList: false,
      // TODO: description
      appBarDescription: AppConstants.loremIpsumShort,
      isCardStackLayout: true,
      children: [
        ...eatingDisorderContacts.map((contact) {
          final linkifiedText = linkify(
            contact,
            linkifiers: const [EmailLinkifier(), UrlLinkifier(), PhoneNumberLinkifier()],
            options: const LinkifyOptions(looseUrl: true, removeWww: true),
          );

          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text.rich(
              TextSpan(
                children: linkifiedText.map(
                  (e) {
                    if (e is LinkableElement) {
                      final displayText = e.text;
                      final fullLink = e.url;
                      final displayUrlLink = Uri.tryParse(fullLink)?.host ?? displayText;
                      final isEmail = EmailValidator.validate(displayText);
                      return WidgetSpan(
                        child: GestureDetector(
                          onTap: () async => launchLinkableContact(e),
                          onLongPress: () async => copyContact(context, displayText),
                          child: Text(
                            isEmail || e is PhoneNumberElement ? displayText : displayUrlLink,
                            style: linkifiedTextStyle,
                          ),
                        ),
                      );
                    }
                    return TextSpan(
                      text: e.text,
                      style: linkifiedTextStyle.copyWith(decoration: TextDecoration.none),
                    );
                  },
                ).toList(),
              ),
              style: linkifiedTextStyle,
            ),
          );
        }),
      ],
    );
  }
}
