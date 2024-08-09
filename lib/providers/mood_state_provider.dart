import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/my_records/emotions_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart'; // Adjust the import based on your project structure
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodState with ChangeNotifier {
  MoodState(
    this._emotionsDao,
    this._trackDao,
  ) {
    _loadEmotions();
  }

  Mood? _activeMood;
  List<String> _emotions = [];
  final EmotionsDao _emotionsDao;
  bool _editing = false;
  final MoodTrackDao _trackDao;
  MoodTrack? _selectedMoodEntry;
  List<MoodTrack> _moodEntries = [];

  MoodTrack? get selectedMoodEntry => _selectedMoodEntry;

  List<MoodTrack> get moodEntries => _moodEntries;

  List<String> get emotions => _emotions;

  Mood? get activeMood => _activeMood;

  bool get editing => _editing;

  void setActiveMood(Mood mood) {
    _activeMood = mood;
    notifyListeners();
  }

  void selectMoodEntry(MoodTrack moodEntry) {
    _selectedMoodEntry = moodEntry;
    notifyListeners();
  }

  void clearSelection() {
    _selectedMoodEntry = null;
    notifyListeners();
  }

  void init() {
    fetchMoodEntries();
  }

  List<MoodTrack> fetchMoodTracksInRange(DateTime start, DateTime end)  {
    return _moodEntries.where((entry) => entry.date.isAfter(start) && entry.date.isBefore(end)).toList();
  }

  void setEditing(bool value){
    _editing = value;
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

  Future<void> saveMoodTrack(String summary, String description, List<String> emotions, Mood mood) async {
     await _trackDao.saveMoodTrack(
      mood,
      emotions,
      summary,
      description,
    );
     await fetchMoodEntries();
  }

  Future<void> updateMoodTrack(DateTime date, String summary, String description, List<String> emotions, Mood mood) async {
    await _trackDao.updateMoodTrack(date, summary, description, emotions, mood);
    await fetchMoodEntries();
  }

  Future<void> fetchMoodEntries() async {
    _moodEntries = await _trackDao.getAllMoodTracks();
    notifyListeners();
  }

  Future<void> deleteEmotion(String emotion) async {
    await _emotionsDao.deleteEmotion(emotion);
  }

  Future<void> deleteMoodTrack(MoodTrack moodTrack) async{
    await _trackDao.deleteMoodTrackByDate(moodTrack.date);
    _moodEntries.remove(moodTrack);
    notifyListeners();
  }
}
