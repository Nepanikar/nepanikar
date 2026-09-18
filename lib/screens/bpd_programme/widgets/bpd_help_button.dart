import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';

/// One tap from anywhere in the DBT programme to the app's help contacts.
///
/// The programme walks through self-harm, life-threatening behaviour and
/// crisis, and a page can land badly on someone at the wrong moment. The
/// researcher's supervisors asked (2026-09-18) that professional help never be
/// more than one tap away, so this rides in the corner of every screen in the
/// module rather than appearing only on the pages that discuss a hard topic —
/// the page that triggers someone is not necessarily the page about triggers.
///
/// It goes to [ContactsRoute], the same destination as the "Rychlá pomoc"
/// button on the home screen, and wears the same teal so it is recognised
/// rather than deciphered. Nothing new is maintained here: the crisis lines,
/// chat services and centres are the ones the app already ships.
///
/// [onDarkBackground] only affects the ring drawn around the circle, for the
/// purple app bars where a shadow would disappear.
class BpdHelpButton extends StatelessWidget {
  const BpdHelpButton({super.key, this.onDarkBackground = false, this.size = 38});

  final bool onDarkBackground;
  final double size;

  @override
  Widget build(BuildContext context) {
    final label = context.l10n.quick_help_btn;

    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        label: label,
        child: Material(
          color: NepanikarColors.secondary,
          shape: CircleBorder(
            side: onDarkBackground
                ? const BorderSide(color: Colors.white24, width: 1)
                : BorderSide.none,
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => context.push(const ContactsRoute().location),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                Icons.support_agent_outlined,
                size: size * 0.55,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
