import 'package:flutter/cupertino.dart';
import 'package:nepanikar/app/l10n/ext.dart';

class Meal {
  Meal({this.title, this.description, this.image});

  String? title;
  String? description;
  String? image;
}

List<Meal> getMealsById(BuildContext context, String id) {
  final meals = {
    'breakfast': [
      Meal(
        title: context.l10n.food_dishes_breakfast.split('\n').elementAt(0),
        image: 'assets/meals/breakfast0.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_breakfast.split('\n').elementAt(1),
        image: 'assets/meals/breakfast1.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_breakfast.split('\n').elementAt(2),
        image: 'assets/meals/breakfast2.jpg',
      ),
    ],
    'am_snack': [
      Meal(
        title: context.l10n.food_dishes_am_snack.split('\n').elementAt(0),
        image: 'assets/meals/amSnack0.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_am_snack.split('\n').elementAt(1),
        image: 'assets/meals/amSnack1.jpg',
      ),
    ],
    'lunch': [
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(0),
        image: 'assets/meals/lunch0.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(1),
        image: 'assets/meals/lunch1.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(2),
        image: 'assets/meals/lunch2.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(3),
        image: 'assets/meals/lunch3.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(4),
        image: 'assets/meals/lunch4.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_lunch.split('\n').elementAt(5),
        image: 'assets/meals/lunch5.jpg',
      ),
    ],
    'pm_snack': [
      Meal(
        title: context.l10n.food_dishes_pm_snack.split('\n').elementAt(0),
        image: 'assets/meals/pmSnack0.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_pm_snack.split('\n').elementAt(1),
        image: 'assets/meals/pmSnack1.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_pm_snack.split('\n').elementAt(2),
        image: 'assets/meals/pmSnack2.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_pm_snack.split('\n').elementAt(3),
        image: 'assets/meals/pmSnack3.jpg',
      ),
    ],
    'dinner': [
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(0),
        image: 'assets/meals/dinner0.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(1),
        image: 'assets/meals/dinner1.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(2),
        image: 'assets/meals/dinner2.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(3),
        image: 'assets/meals/dinner3.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(4),
        image: 'assets/meals/dinner4.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(5),
        image: 'assets/meals/dinner5.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(6),
        image: 'assets/meals/dinner6.jpg',
      ),
      Meal(
        title: context.l10n.food_dishes_dinner.split('\n').elementAt(7),
        image: 'assets/meals/dinner7.jpg',
      ),
    ]
  };
  return meals[id] ?? [];
}
