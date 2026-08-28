import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

/// Outlined "Chci vědět víc" style button that opens an external URL (article,
/// Google Doc, guided-exercise video) in the system browser.
///
/// Used by the HPO programme day pages, where the source content links out to
/// supporting material.
class ExternalLinkButton extends StatelessWidget {
  const ExternalLinkButton({
    super.key,
    required this.label,
    required this.url,
    this.icon = Icons.open_in_new,
  });

  final String label;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return OutlinedButton(
      onPressed: () => launchUrLink(url, launchMode: LaunchMode.externalApplication),
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 48),
        side: BorderSide(color: primaryColor.withOpacity(0.5), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

/// Compact inline variant of [ExternalLinkButton] — a tappable text link with a
/// small play/open icon, for use inside a card or a list of several links.
class ExternalLinkText extends StatelessWidget {
  const ExternalLinkText({
    super.key,
    required this.label,
    required this.url,
    this.icon = Icons.play_circle_outline,
  });

  final String label;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () => launchUrLink(url, launchMode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, size: 18, color: primaryColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: primaryColor.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small note styled like the secondary body text, used to introduce a link
/// block ("Pro zájemce vedené dýchání skrze video:").
class LinkLeadText extends StatelessWidget {
  const LinkLeadText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        height: 1.4,
        color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
      ),
    );
  }
}
