import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart'; // Adjust the import based on your project structure

class MoodState with ChangeNotifier {
  Mood? _activeMood;

  Mood? get activeMood => _activeMood;

  void setActiveMood(Mood mood) {
    _activeMood = mood;
    notifyListeners();
  }
}