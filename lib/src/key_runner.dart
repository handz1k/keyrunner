import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:key_runner/objects/platform_block.dart';
import 'package:key_runner/src/components/components.dart';
import 'dart:math' as math;
import '../managers/segment_manager.dart';
import '../objects/ground_block.dart';
import '../objects/diamond.dart';
import 'package:flutter/material.dart';

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

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll(['ground.png', 'star.png', 'platform.png']);
    camera.viewfinder.anchor = Anchor.topLeft;
    //debugMode = true;
    initializeGame();
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
    for (final block in segments[segmentIndex]) {
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

  void initializeGame() {
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }
    world.add(Player(
        position: Vector2(0, 800),
        velocity: Vector2(0, 0),
        hasJumped: hasJumped));
  }
}
