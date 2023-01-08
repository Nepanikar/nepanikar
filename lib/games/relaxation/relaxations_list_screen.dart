import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/relaxation/relaxation_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class RelaxationsListRoute extends GoRouteData {
  const RelaxationsListRoute();

  @override
  Widget build(BuildContext context, _) => const RelaxationsListScreen();
}

class RelaxationsListScreen extends StatelessWidget {
  const RelaxationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.relaxation,
      children: [
        LongTile(
          text: 'Relaxace',
          image: Assets.illustrations.modules.relaxation.svg(),
          onTap: () => context.push(
            const RelaxationRoute(
              relaxationType: RelaxationType.general,
            ).location,
          ),
        ),
        LongTile(
          text: 'Ranní zastavení',
          image: Assets.illustrations.modules.relaxation.svg(),
          onTap: () => context.push(
            const RelaxationRoute(
              relaxationType: RelaxationType.morning,
            ).location,
          ),
        ),
        LongTile(
          text: 'Večerní zastavení',
          image: Assets.illustrations.modules.relaxation.svg(),
          onTap: () => context.push(
            const RelaxationRoute(
              relaxationType: RelaxationType.evening,
            ).location,
          ),
        ),
      ],
    );
  }
}
