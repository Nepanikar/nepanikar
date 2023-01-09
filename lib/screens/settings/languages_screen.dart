import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class LanguagesRoute extends GoRouteData {
  const LanguagesRoute();

  @override
  Widget build(BuildContext context, _) => const LanguagesScreen();
}

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.language,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: NepanikarColors.cardShadow,
            color: Colors.white,
          ),
          child: Column(
            children: AppLocalizations.supportedLocales
                .mapIndexed(
                  (index, item) => _LanguageItem(
                    text: item.languageCode,
                    hideTopSeparator: index == 0,
                    selected: _userSettingsDao.locale.languageCode == item.languageCode,
                    onTap: () => _userSettingsDao.saveLocale(Locale(item.languageCode)),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({
    required this.text,
    required this.selected,
    required this.onTap,
    this.hideTopSeparator = false,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;
  final bool hideTopSeparator;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text.toUpperCase(),
                style: NepanikarFonts.bodyHeavy,
              ),
              if (selected)
                const Icon(
                  Icons.check_outlined,
                  color: NepanikarColors.success,
                  size: 20,
                )
            ],
          ),
        ),
      ),
    );
  }
}
