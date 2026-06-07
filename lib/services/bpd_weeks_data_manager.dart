import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:nepanikar/services/db/bpd/bpd_week_models.dart';

class BpdWeeksDataManager {
  static const String _dataPath = 'assets/bpd/bpd_weeks_data.json';

  List<BpdWeekData>? _weeksData;

  Future<void> init() async {
    await _loadWeeksData();
  }

  Future<void> _loadWeeksData() async {
    final jsonString = await rootBundle.loadString(_dataPath);
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;
    final weeksList = jsonData['weeks'] as List<dynamic>;

    _weeksData = weeksList
        .map(
          (weekJson) => BpdWeekData.fromJson(weekJson as Map<String, dynamic>),
        )
        .toList();
  }

  List<BpdWeekData> get weeksData {
    if (_weeksData == null) {
      throw StateError(
        'BpdWeeksDataManager not initialized. Call init() first.',
      );
    }
    return _weeksData!;
  }

  BpdWeekData? getWeekData(int weekNumber) {
    if (_weeksData == null) {
      throw StateError(
        'BpdWeeksDataManager not initialized. Call init() first.',
      );
    }
    try {
      return _weeksData!.firstWhere((week) => week.weekNumber == weekNumber);
    } catch (e) {
      return null;
    }
  }
}
