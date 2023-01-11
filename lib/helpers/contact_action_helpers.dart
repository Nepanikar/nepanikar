import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkify/linkify.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchPhoneNum(String phoneNum) async {
  final phoneUri = Uri.tryParse('tel:$phoneNum');
  if (phoneUri != null && await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    debugPrint('Could not launch phone: $phoneUri');
  }
}

Future<void> launchSmsNum(String phoneNum) async {
  final smsUri = Uri.tryParse('sms:$phoneNum');
  if (smsUri != null && await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    debugPrint('Could not launch sms: $smsUri');
  }
}

Future<void> launchUrLink(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not url link: $url');
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
