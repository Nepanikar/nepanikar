import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/utils/meal_plan_config.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MealPlanRoute extends GoRouteData {
  const MealPlanRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MealPlanScreen(
      id: state.queryParams['id'],
      title: state.queryParams['title'],
    );
  }
}

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({
    super.key,
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final meals = getMealsById(context, id ?? '');
    final backgroundColor = customColorsBasedOnDarkMode(context, NepanikarColors.containerD, NepanikarColors.white);
    return NepanikarScreenWrapper(
      appBarTitle: title.toString(),
      children: [
        Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 24.0,
            ),
            child: Column(
              children: meals
                  .map(
                    (meal) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9.0),
                          child: Image.asset('${meal.image}'),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${meal.title?.trim()}',
                          style: NepanikarFonts.title3.copyWith(color: textColorBasedOnDarkMode(context)),
                        ),
                        if (meal.description != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              '${meal.description?.trim()}',
                              style: NepanikarFonts.bodySmallMedium,
                            ),
                          )
                        else
                          const SizedBox(
                            height: 32,
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
