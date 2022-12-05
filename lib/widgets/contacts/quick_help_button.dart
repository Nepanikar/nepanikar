import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';

class QuickHelpButton extends StatelessWidget {
  const QuickHelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Material(
            color: NepanikarColors.secondary,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () => context.push(const ContactsRoute().location),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ],
    );
  }
}
