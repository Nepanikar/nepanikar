import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';

/// One tap from anywhere in the DBT programme to the app's help contacts.
///
/// The researcher's supervisors asked (2026-09-18) that professional help never
/// be more than one tap away, so this rides in the corner of every screen, not
/// only the pages about hard topics — the page that triggers someone is not
/// necessarily the page about triggers. Goes to [ContactsRoute], the same
/// destination and teal as the home screen's "Rychlá pomoc"; nothing new is
/// maintained here. [onDarkBackground] only affects the ring around the circle.
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
            side: onDarkBackground ? const BorderSide(color: Colors.white24) : BorderSide.none,
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => context.push(const ContactsRoute().location),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(Icons.support_agent_outlined, size: size * 0.55, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
