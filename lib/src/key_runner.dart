import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'dart:math' as math;
import 'components/components.dart';
import 'config.dart';

class KeyRunner extends FlameGame with HasCollisionDetection {
  KeyRunner()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );
  final rand = math.Random();

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());
    world.add(PlayerRectangle(
        position: Vector2(width - 40, height - 40),
        velocity: Vector2((rand.nextDouble() - 0.5) * width, 5).normalized()
          ..scale(height / 4)));
  }
}
