// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mood_entry.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$searchMoodEntryRoute];

RouteBase get $searchMoodEntryRoute => GoRouteData.$route(
  path: '/home/my-records/search-mood-entry',
  factory: $SearchMoodEntryRoute._fromState,
);

mixin $SearchMoodEntryRoute on GoRouteData {
  static SearchMoodEntryRoute _fromState(GoRouterState state) =>
      const SearchMoodEntryRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/search-mood-entry');

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
