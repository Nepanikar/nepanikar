import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/database_service.dart';
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

  Future<String> readOldAppContents() async {
    final db = registry.get<DatabaseService>();
    final configContents = await db.getOldAppConfigFile();
    if (configContents == null) return 'Konfig soubor stare verze appky nebyl nenalezen';
    return configContents.readAsString();
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
                    return Center(child: Text(snapshot.data!));
                  } else {
                    return const Center(child: CircularProgressIndicator());
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
