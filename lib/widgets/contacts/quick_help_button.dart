import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/screens/contacts/phone_contacts_screen.dart';

class QuickHelpButton extends StatelessWidget {
  const QuickHelpButton({
    super.key,
    required this.show,
  });

  final bool show;

  @override
  Widget build(BuildContext context) {
    return !show
        ? const SizedBox.shrink()
        : SizedBox(
            width: 163,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: NepanikarColors.secondary,
              child: InkWell(
                onTap: () => context.push(const PhoneContactsRoute().location),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Assets.icons.phone.svg(width: 20, height: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          // TODO: l10n
                          'Rychlá pomoc',
                          style: NepanikarFonts.bodyHeavy.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
