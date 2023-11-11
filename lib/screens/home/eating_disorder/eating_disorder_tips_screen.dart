import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_fail.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_figure.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_general.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_overeat.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_remorse.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_vomit.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderTipsRoute extends GoRouteData {
  const EatingDisorderTipsRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderTipsScreen();
}

class EatingDisorderTipsScreen extends StatelessWidget {
  const EatingDisorderTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeMode currentThemeMode = Theme.of(context).brightness == Brightness.dark ?
    ThemeMode.dark : ThemeMode.light;
    bool isDarkMode = currentThemeMode == ThemeMode.dark ? true : false;

    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_figure,
        image: Assets.illustrations.modules.figure.svg(),
        onTap: () => context.push(const EatingDisorderTipsFigureAppRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_remorse,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsRemorseAppRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_overeat,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsOvereatAppRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_vomit,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsVomitAppRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_fail,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsFailAppRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_misc,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsGeneralAppRoute().location),
        isDarkMode: isDarkMode,
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_tips,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
