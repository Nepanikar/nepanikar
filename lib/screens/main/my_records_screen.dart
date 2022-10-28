import 'package:flutter/material.dart';
import 'package:nepanikar/l10n/ext.dart';

class MyRecordsScreen extends StatelessWidget {
  const MyRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.my_records)),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(context.l10n.my_records),
            ),
          ],
        ),
      ),
    );
  }
}
