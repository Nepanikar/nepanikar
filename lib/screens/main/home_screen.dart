import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/theme.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/widgets/home_tile.dart';
import 'package:nepanikar/widgets/mood_picker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _illustrations = <SvgGenImage>[
    Assets.illustrations.modules.anxietyPanic,
    Assets.illustrations.modules.depression,
    Assets.illustrations.modules.selfHarm,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 92.0,
              collapsedHeight: 60,
              elevation: 2,
              backgroundColor: NepanikarTheme.themeData.scaffoldBackgroundColor,
              title: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Assets.icons.logo.svg(),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.l10n.app_name,
                          style: NepanikarTheme.title3.copyWith(fontSize: 18.6),
                        ),
                      ],
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: NepanikarColors.secondary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Assets.icons.phone.svg(width: 20, height: 20, color: Colors.white),
                            const SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Text(
                                'Rychlá pomoc',
                                //TODO: l10n
                                style: NepanikarTheme.bodyHeavy.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(child: MoodPicker()),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0, top: 30),
                child: Text(
                  'S čím můžeme pomoci?',
                  //TODO: l10n
                  style: NepanikarTheme.title2,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.331,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return HomeTile(
                      text: 'Chci si ublížit',
                      image: Assets.illustrations.modules.selfHarm.svg(),
                      onTap: () => context.push(const MathGameRoute().location),
                    );
                  },
                  childCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
