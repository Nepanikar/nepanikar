import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';

class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context, _) => const AboutAppScreen();
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  Future<String> readOldAppContents() async {
    final db = registry.get<DatabaseService>();
    if (Platform.isAndroid) {
      final configContents = await db.getOldAndroidAppConfigFile();
      if (configContents == null) return 'Konfig soubor stare verze appky nebyl nenalezen';
      return configContents.readAsString();
    } else {
      try {
        final map = await NativeSharedPreferences.getSharedPreferencesMap();
        if (!map.containsKey('selfHarmExist') && !map.containsKey('selfHarmPlan.size')) {
          return 'Konfig soubor stare verze appky nebyl nalezen';
        }
        return map.toString().split(',').join('\n');
      } on Exception catch (e) {
        return 'Chyba pri cteni IOS konfig souboru stare verze appky: $e';
      }
    }
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
                    final configContents = snapshot.data!;
                    return Center(
                      child: GestureDetector(
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: configContents));
                          context.showInfoSnackbar(text: 'Konfig byl zkopírován do schránky');
                        },
                        child: Text(configContents),
                      ),
                    );
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
