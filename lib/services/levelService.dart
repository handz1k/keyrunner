import 'package:hive_ce_flutter/hive_flutter.dart';

class LevelService {
  final totalLevels = 3;
  Set<int> completedLevels = {};
  int currentLevel = 1;

  final storage = Hive.box('levels');

  void loadProgress() {
    final saved = storage.get('completedLevels', defaultValue: {});
    completedLevels = Set<int>.from(saved);
    currentLevel = (storage.get('currentLevel') ?? 1);
  }

  void saveProgress() {
    storage.put('completedLevels', completedLevels.toList());
    storage.put('currentLevel', currentLevel);
  }

  void completeLevel(int levelNumber) {
    completedLevels.add(levelNumber);
    saveProgress();
  }
}
