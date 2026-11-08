import 'dart:io' show Platform;

import 'package:health/health.dart';

class HealthService {
  final Health _health = Health();
  bool _isConfigured = false;
  static const List<HealthDataType> types = [
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BODY_FAT_PERCENTAGE,
    HealthDataType.BODY_TEMPERATURE,
    HealthDataType.HEART_RATE,
    HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
    // HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.BODY_WATER_MASS,
    HealthDataType.HEIGHT,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.WEIGHT,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_AWAKE_IN_BED,
    HealthDataType.SLEEP_DEEP,
    // HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_OUT_OF_BED,
    HealthDataType.SLEEP_REM,
    HealthDataType.SLEEP_UNKNOWN,
    HealthDataType.SLEEP_SESSION,
    HealthDataType.WATER,
    HealthDataType.LEAN_BODY_MASS,
    HealthDataType.MENSTRUATION_FLOW,
    HealthDataType.NUTRITION,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.SKIN_TEMPERATURE,
    HealthDataType.BODY_MASS_INDEX,
    // activity
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.DISTANCE_DELTA,
    HealthDataType.STEPS,
  ];

  Health get health => _health;

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
    return await _health.requestAuthorization(types);
  }

  // Future<List<HealthDataPoint>> getHealthData(DateTime startDate, DateTime endDate) async {
  //   await _ensureConfigured();
  //   return await _health.getHealthDataFromTypes(
  //     types: _types,
  //     startTime: startDate,
  //     endTime: endDate,
  //   );
  // }

  Future<HealthDataPoint?> getLatestHealthData(HealthDataType type) async {
    await _ensureConfigured();
    final now = DateTime.now();
    final startDates = [
      now.subtract(const Duration(days: 1)),
      now.subtract(const Duration(days: 7)),
      now.subtract(const Duration(days: 30)),
    ];

    List<HealthDataPoint> data = [];
    do {
      final startDate = startDates.removeAt(0);
      data = await _health.getHealthDataFromTypes(
        types: [type],
        startTime: startDate,
        endTime: now,
      );
    } while (startDates.isNotEmpty && data.isEmpty);
    return data.lastOrNull;
  }

  Future<bool?> hasPermissions() async {
    await _ensureConfigured();
    return await _health.hasPermissions(types);
  }
}
