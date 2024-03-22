import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart'; // Adjust the import based on your project structure
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodState with ChangeNotifier {
  MoodState(this._trackDao) {
    _loadEmotions(); // Load emotions when the MoodState is initialized
  }

  Mood? _activeMood;
  List<String> _emotions = [];

  final MoodTrackDao _trackDao;

  List<String> get emotions => _emotions;

  Mood? get activeMood => _activeMood;

  void setActiveMood(Mood mood) {
    _activeMood = mood;
    notifyListeners();
  }

  Future<void> _loadEmotions() async {
    _emotions = await _trackDao.getEmotions();
    notifyListeners();
  }

  Future<bool> addEmotion(String emotion) async {
    final succeed = await _trackDao.addEmotion(emotion);
    await _loadEmotions(); // Reload emotions to include the new one
    return succeed;
  }

  Future<void> deleteEmotion() async {
    await _trackDao.deleteEmotion();
  }
}
