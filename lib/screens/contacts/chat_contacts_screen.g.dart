// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_contacts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$chatContactsRoute];

RouteBase get $chatContactsRoute => GoRouteData.$route(
  path: '/contacts/chat',
  factory: $ChatContactsRoute._fromState,
);

mixin $ChatContactsRoute on GoRouteData {
  static ChatContactsRoute _fromState(GoRouterState state) =>
      const ChatContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/chat');

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
