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
    analytics.setCurrentScreen(screenName: route.settings.name);
  }
}
