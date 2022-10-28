import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/registry.dart';

class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context) => const AboutAppScreen();
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.about_app)),
      body: SafeArea(
        child: Column(
          children: [
            // TODO: Localization
            Text('Verze: ${_appConfig.appVersion}\n'),
            Text(context.l10n.about_app_text),
          ],
        ),
      ),
    );
  }
}
