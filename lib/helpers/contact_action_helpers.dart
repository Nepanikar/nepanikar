import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneNum(int phoneNum) async {
  final phoneUri = Uri.tryParse('tel:$phoneNum');
  if (phoneUri != null && await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    debugPrint('Could not launch phone: $phoneUri');
  }
}

Future<void> copyPhoneNum(BuildContext context, int phoneNum) async {
  context.showInfoSnackbar(
    leading: const Icon(Icons.info_outline),
    // TODO: l10n
    text: 'Číslo bylo zkopírováno do schránky',
  );
  await Clipboard.setData(ClipboardData(text: phoneNum.toString()));
}
