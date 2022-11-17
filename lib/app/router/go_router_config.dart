import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/router/routes.dart';

final goRouterConfig = GoRouter(
  initialLocation: const MainRoute().location,
  debugLogDiagnostics: kDebugMode,
  routes: $appRoutes,
);
