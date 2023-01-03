import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/depression/depression_activity_plan_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_nice_made_happy_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_praise_my_achievements_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_tips_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class DepressionRoute extends GoRouteData {
  const DepressionRoute();

  @override
  Widget build(BuildContext context, _) => const DepressionScreen();
}

class DepressionScreen extends StatelessWidget {
  const DepressionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.depression_help,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const DepressionTipsAppRoute().location),
      ),
      LongTile(
        text: context.l10n.depression_plan,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const DepressionActivityPlanRoute().location),
      ),
      LongTile(
        text: context.l10n.depression_nice,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const DepressionNiceMadeHappyRoute().location),
      ),
      LongTile(
        text: context.l10n.depression_praise,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const DepressionPraiseMyAchievementsRoute().location),
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.depression,
      children: modules,
    );
  }
}
