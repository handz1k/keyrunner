import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;
import 'components/components.dart';
import 'config.dart';
import '../managers/segment_manager.dart';
import '../objects/ground_block.dart';
import 'package:flutter/material.dart';

class KeyRunner extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  KeyRunner();

  final rand = math.Random();
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'ground.png',
    ]);
    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();
    super.onLoad();
  }
    @override
    Color backgroundColor() {
      return const Color.fromARGB(255, 173, 223, 247);
    }

  //Code for segment loading from flame documentation https://docs.flame-engine.org/latest/tutorials/platformer/platformer.html
  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      final component = switch (block.blockType) {
        const (GroundBlock) => GroundBlock(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ),
        Type() => throw UnimplementedError(),
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
    world.add(PlayerRectangle(
        position: Vector2(width - 40, height - 40),
        velocity: Vector2((rand.nextDouble() - 0.5) * width, 5).normalized()
          ..scale(height / 4)));  }
}
