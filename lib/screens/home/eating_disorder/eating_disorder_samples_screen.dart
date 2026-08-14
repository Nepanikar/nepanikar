import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/screens/home/eating_disorder/meal_plan_screen.dart';
import 'package:nepanikar/utils/meal_plan_config.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'eating_disorder_samples_screen.g.dart';

@TypedGoRoute<EatingDisorderSamplesRoute>(path: '/home/eating-disorder/samples')
class EatingDisorderSamplesRoute extends GoRouteData with $EatingDisorderSamplesRoute {
  const EatingDisorderSamplesRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisordersSamplesScreen();
}

class EatingDisordersSamplesScreen extends StatelessWidget {
  const EatingDisordersSamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    svgColorBasedOnDarkMode(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_breakfast,
        image: Assets.illustrations.modules.eatingBreakfast.svg(colorFilter: colorFilter),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {'id': MealType.breakfast.name, 'title': context.l10n.food_breakfast},
          ).toString(),
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: '${context.l10n.food_am_snack} ',
        image: Assets.illustrations.modules.eatingAmSnack.svg(colorFilter: colorFilter),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {'id': MealType.amSnack.name, 'title': context.l10n.food_am_snack},
          ).toString(),
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: '${context.l10n.food_lunch} ',
        image: Assets.illustrations.modules.eatingLunch.svg(colorFilter: colorFilter),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {'id': MealType.lunch.name, 'title': context.l10n.food_lunch},
          ).toString(),
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_pm_snack,
        image: Assets.illustrations.modules.eatingPmSnack.svg(colorFilter: colorFilter),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {'id': MealType.pmSnack.name, 'title': context.l10n.food_pm_snack},
          ).toString(),
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.food_dinner,
        image: Assets.illustrations.modules.eatingDinner.svg(colorFilter: colorFilter),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {'id': MealType.dinner.name, 'title': context.l10n.food_dinner},
          ).toString(),
        ),
        isDarkMode: isDarkMode,
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_dishes,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
