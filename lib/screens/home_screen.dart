import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/utils/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.app_name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.push(const AboutAppRoute().location);
                  },
                  child: Text(
                    context.l10n.about_app,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: NepanikarTheme.primary,
                        height: 30,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: NepanikarTheme.secondary,
                        height: 30,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: NepanikarTheme.success,
                        height: 30,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: NepanikarTheme.error,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.language),
                    ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<Locale>(
                        value: context.watch<LocalizationProvider>().locale,
                        items: AppLocalizations.supportedLocales
                            .map<DropdownMenuItem<Locale>>(
                          (Locale locale) {
                            return DropdownMenuItem<Locale>(
                              value: locale,
                              child: Text(locale.toLanguageTag()),
                            );
                          },
                        ).toList(),
                        onChanged: (Locale? locale) {
                          if (locale != null) {
                            context
                                .read<LocalizationProvider>()
                                .setLocale(locale);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(context.l10n.depression_tips),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
