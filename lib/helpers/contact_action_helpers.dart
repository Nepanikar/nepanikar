import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkify/linkify.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneNum(String phoneNum) async {
  final phoneUri = Uri.tryParse('tel:$phoneNum');
  if (phoneUri != null && await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    debugPrint('Could not launch phone: $phoneUri');
  }
}

Future<void> launchLinkableContact(LinkableElement linkableElement) async {
  final linkableContact = Uri.tryParse(linkableElement.url);
  if (linkableContact != null && await canLaunchUrl(linkableContact)) {
    await launchUrl(linkableContact, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not linkable contact: $linkableContact');
  }
}

Future<void> copyContact(BuildContext context, String contactStr) async {
  context.showInfoSnackbar(
    leading: const Icon(Icons.info_outline),
    // TODO: l10n
    text: 'Kontakt byl zkopírován do schránky',
  );
  await Clipboard.setData(ClipboardData(text: contactStr));
}
