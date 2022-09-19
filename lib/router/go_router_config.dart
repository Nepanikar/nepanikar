import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/router/routes.dart';

final goRouterConfig = GoRouter(
  initialLocation: const HomeRoute().location,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
);
