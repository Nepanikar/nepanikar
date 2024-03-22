import 'package:flutter/foundation.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodEntryProvider with ChangeNotifier {
  MoodTrack? _selectedMoodEntry;

  MoodTrack? get selectedMoodEntry => _selectedMoodEntry;

  void selectMoodEntry(MoodTrack moodEntry) {
    _selectedMoodEntry = moodEntry;
    notifyListeners();
  }

  void clearSelection() {
    _selectedMoodEntry = null;
    notifyListeners();
  }
}
