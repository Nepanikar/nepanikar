import 'dart:io' show Platform;

import 'package:health/health.dart';

class HealthService {
  final Health _health = Health();
  bool _isConfigured = false;
  static const List<HealthDataType> _types = [HealthDataType.STEPS, HealthDataType.HEART_RATE];

  Future<void> _ensureConfigured() async {
    if (_isConfigured) {
      return;
    }

    if (Platform.isAndroid) {
      await _health.configure();
      _isConfigured = true;
    } else {
      throw StateError('HealthService is only supported on Android platforms.');
    }
  }

  Future<bool> requestAuthorization() async {
    await _ensureConfigured();
    return await _health.requestAuthorization(_types);
  }

  Future<List<HealthDataPoint>> getHealthData(DateTime startDate, DateTime endDate) async {
    await _ensureConfigured();
    return await _health.getHealthDataFromTypes(
      types: _types,
      startTime: startDate,
      endTime: endDate,
    );
  }
}
