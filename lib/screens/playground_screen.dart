import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/theme.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:provider/provider.dart';

class PlaygroundScreen extends StatelessWidget {
  PlaygroundScreen({super.key});

  final _colors = <Color>[
    NepanikarTheme.primary,
    NepanikarTheme.secondary,
    NepanikarTheme.success,
    NepanikarTheme.error,
    NepanikarTheme.dark,
  ];
  final _fonts = <TextStyle>[
    NepanikarTheme.title1,
    NepanikarTheme.title2,
    NepanikarTheme.title3,
    NepanikarTheme.bodyBlack,
    NepanikarTheme.bodyHeavy,
    NepanikarTheme.bodyRoman,
    NepanikarTheme.bodySmallHeavy,
    NepanikarTheme.bodySmallMedium,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                children:
                    _colors.map((e) => Flexible(child: Container(color: e, height: 30))).toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _fonts
                    .map(
                      (e) => Text(
                        'Lorem Ipsum',
                        style: e,
                      ),
                    )
                    .toList(),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'placeholder',
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'placeholder',
                  errorText: 'error',
                ),
                style: TextStyle(color: NepanikarTheme.error),
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    onChanged: (bool? value) {},
                  ),
                  Checkbox(
                    value: false,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    onChanged: (bool? value) {},
                  ),
                  Radio(value: true, groupValue: true, onChanged: (val) {}),
                  Radio(value: false, groupValue: true, onChanged: (val) {})
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
      ),
    );
  }
}
