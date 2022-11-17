import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class UniversityContactsList extends StatelessWidget {
  const UniversityContactsList({
    super.key,
    required this.universityContact,
  });

  final UniversityContact universityContact;

  Widget _buildUniversityHeader() {
    return Text(
      universityContact.name,
      style: NepanikarFonts.title3.copyWith(
        color: NepanikarColors.primary,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final linkifiedTextStyle = NepanikarFonts.bodyBlack.copyWith(
      color: NepanikarColors.primary,
      decoration: TextDecoration.underline,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildUniversityHeader(),
        ...universityContact.contacts.map((contact) {
          final linkifiedText = linkify(
            contact,
            linkifiers: const [EmailLinkifier(), UrlLinkifier()],
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
                            isEmail ? displayText : displayUrlLink,
                            style: linkifiedTextStyle,
                          ),
                        ),
                      );
                    }
                    return TextSpan(text: e.text, style: linkifiedTextStyle);
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
