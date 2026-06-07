// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_food_record_detail_menu_detail_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsFoodRecordsDetailMenuDetailRoute];

RouteBase get $myRecordsFoodRecordsDetailMenuDetailRoute => GoRouteData.$route(
  path: '/home/my-records/food-records/detail/menu-detail',
  factory: $MyRecordsFoodRecordsDetailMenuDetailRoute._fromState,
);

mixin $MyRecordsFoodRecordsDetailMenuDetailRoute on GoRouteData {
  static MyRecordsFoodRecordsDetailMenuDetailRoute _fromState(
    GoRouterState state,
  ) => const MyRecordsFoodRecordsDetailMenuDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/food-records/detail/menu-detail');

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
