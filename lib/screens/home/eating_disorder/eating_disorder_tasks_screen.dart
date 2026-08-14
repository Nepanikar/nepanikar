import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_afraid_of_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_challenges_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_creative_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_i_like_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_motivation_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_like_on_myself_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'eating_disorder_tasks_screen.g.dart';

@TypedGoRoute<EatingDisorderTasksRoute>(path: '/home/eating-disorder/tasks')
class EatingDisorderTasksRoute extends GoRouteData with $EatingDisorderTasksRoute {
  const EatingDisorderTasksRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderTasksScreen();
}

class EatingDisorderTasksScreen extends StatelessWidget {
  const EatingDisorderTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    svgColorBasedOnDarkMode(context);
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_tasks_creative,
        image: Assets.illustrations.modules.eatingTips.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderFoodCreativeRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_tasks_motivation,
        image: Assets.illustrations.modules.eatingDisorder.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderFoodMotivationRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_tasks_challenge,
        image: Assets.illustrations.modules.eatingChallenge.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderFoodChallengesRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_tasks_like,
        image: Assets.icons.heart.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderLikeOnMyselfRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_tasks_food_like,
        image: Assets.illustrations.modules.eatingLike.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderFoodILikeRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_tasks_afraid,
        image: Assets.illustrations.modules.eatingAfraid.svg(colorFilter: colorFilter),
        onTap: () => context.push(const EatingDisorderFoodAfraidOfRoute().location),
        isDarkMode: isDarkMode,
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_tasks,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
