import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/my_records/emotions_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart'; // Adjust the import based on your project structure
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodState with ChangeNotifier {
  MoodState(this._emotionsDao) {
    _loadEmotions(); // Load emotions when the MoodState is initialized
  }

  Mood? _activeMood;
  List<String> _emotions = [];

  final EmotionsDao _emotionsDao;

  List<String> get emotions => _emotions;

  Mood? get activeMood => _activeMood;

  void setActiveMood(Mood mood) {
    _activeMood = mood;
    notifyListeners();
  }

  Future<void> _loadEmotions() async {
    _emotions = await _emotionsDao.getEmotions();
    notifyListeners();
  }

  Future<bool> addEmotion(String emotion) async {
    final succeed = await _emotionsDao.addEmotion(emotion);
    await _loadEmotions(); // Reload emotions to include the new one
    return succeed;
  }

  Future<void> deleteEmotion(String emotion) async {
    await _emotionsDao.deleteEmotion(emotion);
  }
}
