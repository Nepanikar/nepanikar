import 'package:flutter/material.dart';
import 'package:nepanikar/l10n/ext.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.contacts),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(context.l10n.contacts),
            ),
          ],
        ),
      ),
    );
  }
}
