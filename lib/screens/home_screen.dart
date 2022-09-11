import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.app_name),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.about_app),
                ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<Locale>(
                    value: context.watch<LocalizationProvider>().locale,
                    items: AppLocalizations.supportedLocales.map<DropdownMenuItem<Locale>>(
                      (Locale locale) {
                        return DropdownMenuItem<Locale>(
                          value: locale,
                          child: Text(locale.toLanguageTag()),
                        );
                      },
                    ).toList(),
                    onChanged: (Locale? locale) {
                      if (locale != null) {
                        context.read<LocalizationProvider>().setLocale(locale);
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
    );
  }
}
