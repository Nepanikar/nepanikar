import 'package:flutter/cupertino.dart';
import 'package:nepanikar/app/l10n/ext.dart';

enum MealType { breakfast, amSnack, lunch, pmSnack, dinner }

class Meal {
  const Meal({this.title, this.description, this.image});

  final String? title;
  final String? description;
  final String? image;
}

List<Meal> getMealsById(BuildContext context, String id) {
  final meals = {
    MealType.breakfast.name: List.generate(
      context.l10n.food_dishes_breakfast.split('\n').length,
      (index) => Meal(
        title: context.l10n.food_dishes_breakfast.split('\n').elementAt(index),
        image: 'assets/meals/breakfast$index.jpg',
      ),
    ).toList(),
    MealType.amSnack.name: List.generate(
      context.l10n.food_dishes_am_snack.split('\n').length,
      (index) => Meal(
        title: context.l10n.food_dishes_am_snack.split('\n').elementAt(index),
        image: 'assets/meals/amSnack$index.jpg',
      ),
    ).toList(),
    MealType.lunch.name: List.generate(
      context.l10n.food_dishes_lunch.split('\n').length,
      (index) => Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(index),
        image: 'assets/meals/lunch$index.jpg',
      ),
    ).toList(),
    MealType.pmSnack.name: List.generate(
      context.l10n.food_dishes_pm_snack.split('\n').length,
      (index) => Meal(
        title: context.l10n.food_dishes_pm_snack.split('\n').elementAt(index),
        image: 'assets/meals/pmSnack$index.jpg',
      ),
    ).toList(),
    MealType.dinner.name: List.generate(
      context.l10n.food_dishes_dinner.split('\n').length,
      (index) => Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(index),
        image: 'assets/meals/dinner$index.jpg',
      ),
    ).toList()
  };
  return meals[id] ?? [];
}
