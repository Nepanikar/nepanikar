import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/utils/registry.dart';

final goRouterConfig = GoRouter(
  initialLocation: const MainRoute().location,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
  observers: [GoRouterObserver(analytics: registry.get<FirebaseAnalytics>())],
);

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.analytics});

  final FirebaseAnalytics analytics;

  /// The screen name to report, with path parameters filled in.
  ///
  /// go_router names each page after the route *pattern* it matched
  /// (`state.name ?? state.path`), so every parameterised route arrives in
  /// Analytics as a single screen with the placeholder still in it: all eight
  /// rest days of the programme were one
  /// `bpd-programme/week/:weekNumber/day/:dayNumber/pause`, and all seven week
  /// lists one `bpd-programme/week/:weekNumber`. Nobody could look up
  /// "week 2, day 5" because no such screen name was ever sent.
  ///
  /// The page's `arguments` hold the matched path parameters (go_router puts
  /// them there alongside the query parameters), so the real values are to
  /// hand; substituting them turns the pattern back into the route the person
  /// actually opened. Doing it here covers every parameterised route at once,
  /// including any added later.
  ///
  /// Only the path is reported, never the query string — and these paths carry
  /// week and day numbers, nothing about the person. See [BpdAnalytics] on why
  /// that limit matters for this programme.
  static String? _screenName(Route<dynamic>? route) {
    final pattern = route?.settings.name;
    if (pattern == null) return null;
    final arguments = route?.settings.arguments;
    if (arguments is! Map<String, String>) return pattern;
    var name = pattern;
    for (final parameter in arguments.entries) {
      name = name.replaceAll(':${parameter.key}', parameter.value);
    }
    return name;
  }

  void _logScreenView(Route<dynamic>? route) {
    final screenName = _screenName(route);
    if (screenName == null) return;
    unawaited(analytics.logScreenView(screenName: screenName, screenClass: screenName));
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logScreenView(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logScreenView(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logScreenView(newRoute);
  }
}
