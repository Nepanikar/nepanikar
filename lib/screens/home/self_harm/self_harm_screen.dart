import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_timer_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';

class SelfHarmRoute extends GoRouteData {
  const SelfHarmRoute();

  @override
  Widget build(BuildContext context) => const SelfHarmScreen();
}

class SelfHarmScreen extends StatelessWidget {
  const SelfHarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.self_harm_timer,
        image: Assets.illustrations.modules.selfHarm.svg(),
        onTap: () => context.push(const SelfHarmTimerRoute().location),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.self_harm)),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 55,
              color: NepanikarColors.primary,
            ),
            SeparatedColumn(
              separatorBuilder: NepanikarSizes.separatorBuilder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              children: modules,
            )
          ],
        ),
      ),
    );
  }
}
