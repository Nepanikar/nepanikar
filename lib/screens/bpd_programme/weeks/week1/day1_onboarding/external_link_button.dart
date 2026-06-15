import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

/// Outlined button that opens an external URL (e.g. the HPO/DBT info docs).
class ExternalLinkButton extends StatelessWidget {
  const ExternalLinkButton({super.key, required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () =>
            launchUrLink(url, launchMode: LaunchMode.externalApplication),
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(color: primaryColor, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.open_in_new, size: 18),
          ],
        ),
      ),
    );
  }
}
