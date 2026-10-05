import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> logExceptionToCrashlytics(
  dynamic exception,
  StackTrace? stackTrace, {
  required String logMessage,
}) async {
  if (kDebugMode) {
    debugPrint(logMessage);
    debugPrint(exception.toString());
    debugPrint(stackTrace.toString());
  } else {
    await FirebaseCrashlytics.instance.log(logMessage);
    await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  }
}
