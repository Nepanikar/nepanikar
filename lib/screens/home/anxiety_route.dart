import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';

import 'package:nepanikar/widgets/long_tile.dart';

class AnxietyAppRoute extends GoRouteData {
  const AnxietyAppRoute();

  @override
  Widget build(BuildContext context) => const AnxietyAppScreen();
}

class AnxietyAppScreen extends StatelessWidget {
  const AnxietyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <LongTile>[
      LongTile(
        // TODO: l10n
        text: 'Co dělat při úzkosti',
        image: Assets.illustrations.modules.depression.svg(),
        onTap: () {},
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () {},
      ),
      LongTile(
        text: context.l10n.math,
        image: Assets.illustrations.games.math.math.svg(),
        onTap: () => context.push(const MathGameRoute().location),
      ),
      LongTile(
        // TODO: l10n
        text: 'Hra balóky',
        image: Assets.illustrations.games.baloons.baloons.svg(),
        onTap: () {},
      ),
      LongTile(
        // TODO: l10n
        text: 'Hra houpačka',
        image: Assets.illustrations.games.swing.swing.svg(),
        onTap: () {},
      ),
      LongTile(
        text: context.l10n.relaxation,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.anxiety_panic,
          style: NepanikarFonts.title3.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 55,
              color: NepanikarColors.primary,
            ),
            ListView.separated(
              itemCount: modules.length,
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (BuildContext context, int index) {
                return modules.elementAt(index);
              },
            )
          ],
        ),
        /*child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _modules.elementAt(index);
              },
              // 40 list items
              childCount: _modules.length,
            ))
          ],
        ),*/
      ),
    );
  }
}
