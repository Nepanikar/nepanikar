import 'dart:async';
import 'dart:ui' as ui;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/router/go_router_config.dart';
import 'package:nepanikar/firebase_options.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/app_config.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/utils/svg_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!AppConstants.DISABLE_FIREBASE) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled
    // by the Flutter framework to Crashlytics.
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  // Initialize intl localizations.
  for (final delegate in AppLocalizations.localizationsDelegates) {
    await delegate.load(ui.Locale(ui.window.locale.languageCode));
  }

  // router
  registry.registerSingleton<GoRouter>(goRouterConfig);
  registry.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey());

  // TODO: Integrate with Firebase Analytics & Crashlytics
  // firebase
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);

  // registry.registerSingleton<FirebaseAnalytics>(FirebaseAnalytics.instance);
  // await registry.get<FirebaseAnalytics>().setAnalyticsCollectionEnabled(!kDebugMode);

  // services
  registry.registerSingleton<SaveDirectories>(SaveDirectories());
  await registry.get<SaveDirectories>().init();

  registry.registerSingleton<DatabaseService>(
    DatabaseService(
      saveDirectories: registry.get<SaveDirectories>(),
    ),
  );
  await registry.get<DatabaseService>().init();

  // utils
  final appInfo = await PackageInfo.fromPlatform();
  final config = AppConfig(packageInfo: appInfo);
  registry.registerLazySingleton<AppConfig>(() => config);

  await precacheSvgs();
  registry.registerSingleton<LottieCacheManager>(LottieCacheManager());
  await registry.get<LottieCacheManager>().init();

  registry.registerSingleton<ContactsDataManager>(ContactsDataManager());
  await registry.get<ContactsDataManager>().init();
}
