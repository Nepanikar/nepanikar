// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_entry_detail_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$moodEntryDetailRoute];

RouteBase get $moodEntryDetailRoute => GoRouteData.$route(
  path: '/home/my-records/mood-records/mood-entry',
  factory: $MoodEntryDetailRoute._fromState,
);

mixin $MoodEntryDetailRoute on GoRouteData {
  static MoodEntryDetailRoute _fromState(GoRouterState state) =>
      const MoodEntryDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/mood-records/mood-entry');

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
