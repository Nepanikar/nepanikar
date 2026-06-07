// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_track_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$moodTrackRoute];

RouteBase get $moodTrackRoute => GoRouteData.$route(
  path: '/home/my-records/mood-track',
  factory: $MoodTrackRoute._fromState,
);

mixin $MoodTrackRoute on GoRouteData {
  static MoodTrackRoute _fromState(GoRouterState state) =>
      const MoodTrackRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/mood-track');

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
