import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  AppConfig get _appConfig => registry.get<AppConfig>();

  DatabaseService get _databaseService => registry.get<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: 'Nastavení',
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.white,
            child: Column(
              children: [
                _SettingsMenuItem(
                  hideTopSeparator: true,
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.reset_inputs,
                  onTap: () {
                    // TODO: l10n
                    context.showNepanikarDialog(
                      title: 'Smazat data',
                      text: 'Opravdu chcete smazat všechna data?',
                      secondaryBtnLabel: 'Zrušit',
                      onSecondaryBtnTap: (dialogContext) => Navigator.pop(dialogContext),
                      primaryBtnLabel: 'Smazat',
                      onPrimaryBtnTap: (dialogContext) async {
                        await _databaseService.clearAll();
                        await _databaseService.preloadDefaultData(context.l10n);
                        Navigator.pop(dialogContext);
                        context.hideCurrentSnackBar();
                        context.showSuccessSnackbar(
                          text: 'Vaše data byla úspěšně smazaná.',
                          leading: Assets.icons.checkmarks.checkCircular.svg(),
                        );
                      },
                    );
                  },
                ),
                _SettingsMenuItem(
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.rate,
                  onTap: () async {
                    final uri = Uri.parse(
                      Platform.isAndroid
                          ? 'market://details?id=${_appConfig.googlePlayAppId}'
                          : 'https://apps.apple.com/app/id${_appConfig.appStoreAppId}',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
                _SettingsMenuItem(
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.about_app,
                  onTap: () {},
                ),
                _SettingsMenuItem(
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.import_export,
                ),
                _SettingsMenuItem(
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.support_us,
                ),
                const _LanguagePicker(),
                _SettingsMenuItem(
                  leading: const Icon(Icons.shield_outlined),
                  text: context.l10n.language,
                  onTap: () {},
                  trailing: const SizedBox(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _SettingsMenuItem extends StatelessWidget {
  const _SettingsMenuItem({
    this.hideTopSeparator = false,
    this.leading,
    this.trailing,
    required this.text,
    this.onTap,
  });

  final bool hideTopSeparator;
  final Widget? leading;
  final Widget? trailing;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: hideTopSeparator ? BorderSide.none : const BorderSide(color: Color(0xffF2F2F5)),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(
                  width: 16,
                ),
              ],
              Text(
                text,
                style: NepanikarFonts.bodySmallMedium.copyWith(fontSize: 15),
              ),
              const Spacer(),
              if (trailing != null)
                trailing!
              else
                Opacity(
                  opacity: onTap != null ? 1 : 0.5,
                  child: const Icon(Icons.chevron_right),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffF2F2F5),
          ),
        ),
      ),
      child: GridView.extent(
        maxCrossAxisExtent: 68,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: List.generate(
          8,
          (index) => ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              width: 56,
              height: 56,
              color: Colors.blue,
              child: const Center(
                child: Text('cz'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
