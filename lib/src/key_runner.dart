import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:get/get.dart';
import '../objects/platform_block.dart';
import '../src/components/player.dart';
import '../views/game_over_screen.dart';
import '../views/level_complete_screen.dart';
import 'dart:math' as math;
import '../managers/segment_manager.dart';
import '../objects/ground_block.dart';
import '../objects/key.dart';
import 'package:flutter/material.dart';
import '../src/components/level.dart';
import '../services/levelService.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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
  int health = 1;
  bool isGameOver = false;
  bool levelComplete = false;
  late final World world;
  late final CameraComponent cameraComponent;
  late Player player;
  var _dtSum = 0.0;
  final fixedRate = 1 / 60;
  final storage = Hive.box("levels");

  final List<Level> levels = [
    Level(levelNumber: 1, segmentsToLoad: 5),
    Level(levelNumber: 2, segmentsToLoad: 6),
    Level(levelNumber: 3, segmentsToLoad: 7),
  ];

  final levelService = Get.find<LevelService>();
  Level get currentLevelData => levels[levelService.currentLevel - 1];

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll(['ground.png', 'key.png', 'platform.png']);
    world = World();
    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: 1280,
      height: 800,
    );

    addAll([cameraComponent, world]);
    // debugMode = true;
    initializeGame(currentLevelData.levelNumber);
    ParallaxComponent cloudBackground = await loadParallaxComponent([
      ParallaxImageData('Clouds1.png'),
      ParallaxImageData('Clouds2.png'),
      ParallaxImageData('Clouds4.png'),
    ], baseVelocity: Vector2(4, 0), velocityMultiplierDelta: Vector2(1.6, 1.0));
    super.onLoad();
    camera.backdrop.add(cloudBackground);
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
        GoldKey => GoldKey(
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
    if (levelComplete) {
      levelService.completeLevel(currentLevelData.levelNumber - 1);
      Get.off(() => LevelCompleteScreen(game: this));
    }
    _dtSum += dt;
    if (_dtSum > fixedRate) {
      super.update(fixedRate);
      _dtSum -= fixedRate;
    }
  }

  void initializeGame(int level) {
    final segmentsToLoad = levels[level - 1].segmentsToLoad;
    final availableSegments = levelSegments[levelService.currentLevel] ?? [];

    segmentsToLoad.clamp(0, availableSegments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
    final groundBlocks = world.children.whereType<GroundBlock>();

    final firstGround = groundBlocks
        .where((block) => block.position.x <= 0 + block.size.x)
        .reduce((a, b) => a.position.y < b.position.y ? a : b);

    final blockTopY = firstGround.position.y;
    final blockSideX = firstGround.position.x;

    player = Player(
      position: Vector2(blockSideX - 50, blockTopY - 200),
      velocity: Vector2(0, 0),
      hasJumped: false,
    );
    world.add(player);
    cameraComponent.follow(player);
  }

  void nextLevel() {
    isGameOver = false;
    health = 1;
    if (currentLevelData.levelNumber < levels.length) {
      levelService.currentLevel = currentLevelData.levelNumber + 1;
      initializeGame(levelService.currentLevel);
    }
  }

  void reset() {
    isGameOver = false;
    health = 1;
    initializeGame(currentLevelData.levelNumber);
  }
}
