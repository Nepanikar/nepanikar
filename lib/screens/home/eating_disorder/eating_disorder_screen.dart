import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_distractions_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_samples_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tasks_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tips_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderRoute extends GoRouteData {
  const EatingDisorderRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderScreen();
}

class EatingDisorderScreen extends StatelessWidget {
  const EatingDisorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_tips,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTipsRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderTasksRoute().location),
      ),
      LongTile(
        text: context.l10n.food_dishes,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderSamplesRoute().location),
      ),
      LongTile(
        text: context.l10n.distraction,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderDistractionsRoute().location),
      ),
      LongTile(
        text: '${context.l10n.food_contact} TODO',
        image: Assets.illustrations.contacts.phones.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food,
      children: modules,
    );
  }
}
