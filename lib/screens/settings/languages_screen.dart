import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/app_localizations.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'languages_screen.g.dart';

@TypedGoRoute<LanguagesRoute>(path: '/settings/language')
class LanguagesRoute extends GoRouteData with $LanguagesRoute {
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
            boxShadow: NepanikarColors.cardShadow(context),
            color: Theme.of(context).brightness == Brightness.dark
                ? NepanikarColors.container(context)
                : NepanikarColors.filledContainer,
          ),
          child: Column(
            children: AppLocalizations.supportedLocales
                .mapIndexed(
                  (index, item) => _LanguageItem(
                    text: item.toLanguageTag(),
                    hideTopSeparator: index == 0,
                    selected: _userSettingsDao.locale.languageCode == item.languageCode,
                    onTap: () => _userSettingsDao.saveLocale(item),
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
                style: NepanikarFonts.bodyHeavy.copyWith(color: Theme.of(context).hintColor),
              ),
              if (selected)
                const Icon(Icons.check_outlined, color: NepanikarColors.success, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
