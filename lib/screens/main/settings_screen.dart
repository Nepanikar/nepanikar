import 'package:flutter/material.dart';
import 'package:nepanikar/screens/playground_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: l10n
        title: const Text('Nastavení'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PlaygroundScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
