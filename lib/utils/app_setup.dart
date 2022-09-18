import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // router
  final appRouter = GoRouter(
    initialLocation: HomeRoute().location,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
  );
  registry.registerSingleton<GoRouter>(appRouter);

  // TODO: Integrate with Firebase Analytics & Crashlytics
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);

  // registry.registerSingleton<FirebaseAnalytics>(FirebaseAnalytics.instance);
  // await registry.get<FirebaseAnalytics>().setAnalyticsCollectionEnabled(!kDebugMode);

  final appInfo = await PackageInfo.fromPlatform();
  final config = AppConfig(packageInfo: appInfo);

  registry.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey());
  registry.registerLazySingleton<AppConfig>(() => config);

  // services
  registry.registerSingleton<SaveDirectories>(SaveDirectories());
  await registry.get<SaveDirectories>().init();
}
