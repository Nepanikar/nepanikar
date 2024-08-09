import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:sembast/sembast.dart';

class EmotionsDao {
  EmotionsDao({
    required DatabaseService dbService,
    String? storeKeyName,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(storeKeyName ?? _storeKeyName);

  Future<EmotionsDao> init() async {
    registry.registerSingleton<EmotionsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, Object?>> _store;

  static const _storeKeyName = 'emotions';

  Database get _db => _dbService.database;

  static final List<String> defaultEmotions = [
    'Happy',
    'Sad',
    'Excited',
    'Relaxed',
    'Angry'
  ];

  Future<void> initEmotions() async {
    final existingEmotions = await getEmotions();
    if (existingEmotions.isEmpty) {
      for (final String emotion in defaultEmotions) {
        await addEmotion(emotion);
      }
    }
  }

  Future<bool> addEmotion(String emotion) async {
    final key = emotion.toLowerCase();
    final value = {'emotion': emotion};

    final existingRecord = await _store.record(key).get(_db);

    if (existingRecord == null) {
      await _store.record(key).put(_db, value);
      return true;
    }
    return false;
  }

  Future<List<String>> getEmotions() async {
    final finder = Finder(sortOrders: [SortOrder(Field.key)]);
    final records = await _store.find(_db, finder: finder);

    return records
        .map((record) => record.value['emotion'] as String)
        .whereType<String>()
        .toList();
  }

  //TODO urobit odstranovanie a updatovanie emocii + case ked su emocie pouzivane
  Future<bool> deleteEmotion(String emotion) async {
    final key = emotion.toLowerCase();

    final existingRecord = await _store.record(key).get(_db);
    if(existingRecord != null){
      await _store.record(key).delete(_db);
      return true;
    }
    return false;
  }

  Future<void> clear() async {
    await _store.delete(_db);
  }
}
