import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:get/get.dart';
import 'package:key_runner/objects/platform_block.dart';
import 'package:key_runner/src/components/player.dart';
import 'package:key_runner/views/gameover_screen.dart';
import 'dart:math' as math;
import '../managers/segment_manager.dart';
import '../objects/ground_block.dart';
import '../objects/diamond.dart';
import 'package:flutter/material.dart';
import '../src/components/level.dart';
import '../views/level_screen.dart';

class KeyRunner extends FlameGame
    with HasCollisionDetection, TapCallbacks, HasKeyboardHandlerComponents {
  KeyRunner();

  final rand = math.Random();
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  double get width => size.x;
  double get height => size.y;
  bool hasJumped = false;
  int diamondsCollected = 0;
  int health = 1;
  bool isGameOver = false;

  final List<Level> levels = [
    Level(levelNumber: 1, segmentsToLoad: 5),
    Level(levelNumber: 2, segmentsToLoad: 6),
    Level(levelNumber: 3, segmentsToLoad: 7),
  ];

  final levelService = Get.find<LevelService>();
  Level get currentLevelData => levels[levelService.currentLevel - 1];

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll(['ground.png', 'star.png', 'platform.png']);
    camera.viewfinder.anchor = Anchor.topLeft;
    //debugMode = true;
    initializeGame(currentLevelData.levelNumber);
    ParallaxComponent cloudBackground = await loadParallaxComponent([
      ParallaxImageData('Clouds1.png'),
      ParallaxImageData('Clouds2.png'),
      ParallaxImageData('Clouds4.png'),
    ], baseVelocity: Vector2(4, 0), velocityMultiplierDelta: Vector2(1.6, 1.0));
    super.onLoad();
    add(cloudBackground);
  }

  @override
  void onTapDown(TapDownEvent event) {
    hasJumped = true;
  }

  //Code for segment loading from flame documentation https://docs.flame-engine.org/latest/tutorials/platformer/platformer.html
  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    final availableSegments = levelSegments[levelService.currentLevel] ?? [];
    if (segmentIndex < 0 ||
        segmentIndex >= levelSegments[levelService.currentLevel]!.length) {
      return;
    }
    for (final block in availableSegments[segmentIndex]) {
      final component = switch (block.blockType) {
        GroundBlock => GroundBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ),
        Star => Star(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ),
        PlatformBlock => PlatformBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ),
        _ => throw Exception('Unknown block type: ${block.blockType}'),
      };
      world.add(component);
    }
  }

  @override
  void update(double dt) {
    if (health <= 0 && !isGameOver) {
      isGameOver = true;
      Get.off(() => GameOverScreen(game: this));
    }
    super.update(dt);
  }

  void initializeGame(int level) {
    final segmentsToLoad = levels[level - 1].segmentsToLoad;
    final availableSegments = levelSegments[levelService.currentLevel] ?? [];

    segmentsToLoad.clamp(0, availableSegments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
    world.add(Player(
        position: Vector2(0, 800),
        velocity: Vector2(0, 0),
        hasJumped: hasJumped));
  }

  void reset() {
    diamondsCollected = 0;
    isGameOver = false;
    health = 1;
    initializeGame(currentLevelData.levelNumber);
  }
}
