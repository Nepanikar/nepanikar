import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/screens/home/anxiety_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_screen.dart';
import 'package:nepanikar/widgets/contacts/quick_help_button.dart';
import 'package:nepanikar/widgets/home_tile.dart';
import 'package:nepanikar/widgets/mood_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.showQuickHelpButton,
  });

  final bool showQuickHelpButton;

  @override
  Widget build(BuildContext context) {
    final modules = <HomeTile>[
      HomeTile(
        text: context.l10n.depression,
        image: Assets.illustrations.modules.depression.svg(),
        location: const MathGameRoute().location,
      ),
      HomeTile(
        text: 'Úzkost a panika',
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        location: const AnxietyAppRoute().location,
      ),
      HomeTile(
        text: context.l10n.self_harm,
        image: Assets.illustrations.modules.selfHarm.svg(),
        location: const SelfHarmRoute().location,
      ),
      HomeTile(
        text: context.l10n.suicidal_thoughts,
        image: Assets.illustrations.modules.suicidalThoughts.svg(),
        location: const MathGameRoute().location,
      ),
      HomeTile(
        text: context.l10n.food,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        location: const MathGameRoute().location,
      ),
      HomeTile(
        text: context.l10n.relaxation,
        image: Assets.illustrations.modules.myRecords.svg(),
        location: const MathGameRoute().location,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 92.0,
                collapsedHeight: 60,
                elevation: 2,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Assets.icons.logo.svg(),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            context.l10n.app_name,
                            style: NepanikarFonts.title3.copyWith(fontSize: 18.6),
                          ),
                        ],
                      ),
                    ),
                    if (showQuickHelpButton) const Expanded(child: QuickHelpButton()),
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
                  //TODO: l10n
                  'S čím můžeme pomoci?',
                  style: NepanikarFonts.title2,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 185.0,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.331,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return modules.elementAt(index);
                  },
                  childCount: modules.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
