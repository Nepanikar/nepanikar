import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:path/path.dart';

class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context) => const AboutAppScreen();
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  Future<String> readOldAppContents() async {
    final supportDir = registry.get<SaveDirectories>().supportDir;
    final configPath = join(supportDir.path, '.config', 'DontPanicDevs', 'DontPanic.conf');
    final configContent = await File(configPath).readAsString();
    return configContent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.about_app)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TODO: Localization
              Text('Verze: ${_appConfig.appVersion}\n'),
              FutureBuilder<String>(
                future: readOldAppContents(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!);
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
