import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/utils/registry.dart';

final goRouterConfig = GoRouter(
  initialLocation: const MainRoute().location,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
  observers: [
    GoRouterObserver(
      analytics: registry.get<FirebaseAnalytics>(),
    ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.analytics});

  final FirebaseAnalytics analytics;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final screenName = route.settings.name;
    if (screenName != null) {
      analytics.logScreenView(
        screenName: screenName,
        screenClass: screenName,
      );
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final screenName = previousRoute?.settings.name;
    if (screenName != null) {
      analytics.logScreenView(
        screenName: screenName,
        screenClass: screenName,
      );
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final screenName = newRoute?.settings.name;
    if (screenName != null) {
      analytics.logScreenView(
        screenName: screenName,
        screenClass: screenName,
      );
    }
  }
}
