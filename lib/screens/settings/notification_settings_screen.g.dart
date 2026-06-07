// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$notificationSettingsRoute];

RouteBase get $notificationSettingsRoute => GoRouteData.$route(
  path: '/settings/notification-settings',
  factory: $NotificationSettingsRoute._fromState,
);

mixin $NotificationSettingsRoute on GoRouteData {
  static NotificationSettingsRoute _fromState(GoRouterState state) =>
      const NotificationSettingsRoute();

  @override
  String get location =>
      GoRouteData.$location('/settings/notification-settings');

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
