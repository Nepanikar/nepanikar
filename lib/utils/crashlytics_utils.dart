import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> logExceptionToCrashlytics(
  dynamic exception,
  StackTrace? stackTrace, {
  required String logMessage,
}) async {
  if (!kDebugMode) {
    debugPrint(logMessage);
    debugPrint(exception.toString());
    debugPrint(stackTrace.toString());
  } else {
    // Logs a message that's included in the next fatal or non-fatal report.
    await FirebaseCrashlytics.instance.log(logMessage);

    // Submits a Crashlytics report of a caught error.
    await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  }
}
