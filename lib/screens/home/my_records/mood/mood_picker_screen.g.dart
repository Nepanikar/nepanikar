// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_picker_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$moodPickerRoute];

RouteBase get $moodPickerRoute => GoRouteData.$route(
  path: '/home/my-records/mood-picker',
  factory: $MoodPickerRoute._fromState,
);

mixin $MoodPickerRoute on GoRouteData {
  static MoodPickerRoute _fromState(GoRouterState state) =>
      const MoodPickerRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/mood-picker');

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
