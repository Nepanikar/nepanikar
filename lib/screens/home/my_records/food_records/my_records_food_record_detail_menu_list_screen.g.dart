// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_food_record_detail_menu_list_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsFoodRecordsDetailMenuListRoute];

RouteBase get $myRecordsFoodRecordsDetailMenuListRoute => GoRouteData.$route(
  path: '/home/my-records/food-records/detail',
  factory: $MyRecordsFoodRecordsDetailMenuListRoute._fromState,
);

mixin $MyRecordsFoodRecordsDetailMenuListRoute on GoRouteData {
  static MyRecordsFoodRecordsDetailMenuListRoute _fromState(
    GoRouterState state,
  ) => const MyRecordsFoodRecordsDetailMenuListRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/food-records/detail');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
