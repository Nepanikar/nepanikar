import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context, _) => const AboutAppScreen();
}

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.about_app,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: NepanikarColors.cardShadow,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.about_app,
                      style: NepanikarFonts.title3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(context.l10n.about_app_text),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'v${_appConfig.appVersion}',
                  style: NepanikarFonts.bodySmallHeavy.copyWith(
                    color: NepanikarColors.primarySwatch.shade400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
