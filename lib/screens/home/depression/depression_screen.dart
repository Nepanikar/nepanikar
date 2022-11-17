import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class DepressionRoute extends GoRouteData {
  const DepressionRoute();

  @override
  Widget build(BuildContext context) => const DepressionScreen();
}

class DepressionScreen extends StatelessWidget {
  const DepressionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.depression_help,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.depression_plan,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.depression_nice,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.depression_praise,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.depression,
      children: modules,
    );
  }
}
