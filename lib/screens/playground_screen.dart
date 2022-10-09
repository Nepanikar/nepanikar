import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/theme.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:provider/provider.dart';

class PlaygroundScreen extends StatelessWidget {
  PlaygroundScreen({super.key});

  final _colors = <Color>[
    NepanikarColors.primary,
    NepanikarColors.secondary,
    NepanikarColors.success,
    NepanikarColors.error,
    NepanikarColors.dark,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _fonts
                    .map(
                      (e) => Text(
                        context.l10n.app_name,
                        style: e,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 4,
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
                style: TextStyle(color: NepanikarColors.error),
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
              const SizedBox(height: 20),
              ..._buildButtonsSection(context),
              const SizedBox(height: 25),
              _buildColorsSection(),
              const SizedBox(height: 20),
              Text(context.l10n.depression_tips),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtonsSection(BuildContext context) {
    return [
      Row(
        children: [
          Flexible(
            child: NepanikarButton(
              onTap: () => context.push(const MathGameRoute().location),
              text: '${context.l10n.game} ${context.l10n.math}',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondary(
              onTap: () => context.push(const AboutAppRoute().location),
              text: context.l10n.about_app,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Flexible(
            child: NepanikarButton.async(
              onTapAsync: () async => Future.delayed(const Duration(seconds: 2)),
              expandToContentWidth: true,
              trailingIcon: Assets.icons.navigation.chevronRight,
              text: 'Spinner test',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondaryAsync(
              onTapAsync: () async => Future.delayed(const Duration(seconds: 2)),
              expandToContentWidth: true,
              text: 'Spinner test secondary',
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Flexible(
            child: NepanikarButton(
              onTap: () => debugPrint('disabled primary'),
              enabled: false,
              text: 'disabled primary',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondary(
              onTap: () => debugPrint('disabled secondary'),
              enabled: false,
              text: 'disabled secondary',
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildColorsSection() {
    return Row(
      children: _colors.map((e) => Flexible(child: Container(color: e, height: 30))).toList(),
    );
  }
}
