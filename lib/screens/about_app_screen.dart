import 'package:flutter/material.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/registry.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.about_app),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Verze: ${_appConfig.appVersion}\n'),
            Text(context.l10n.about_app_text),
          ],
        ),
      ),
    );
  }
}
