import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../key_runner.dart'; // And this import
import 'play_area.dart';

class PlayerRectangle extends RectangleComponent
    with CollisionCallbacks, HasGameReference<KeyRunner> {
  PlayerRectangle({required this.velocity, required super.position})
      : super(
            anchor: Anchor.center,
            size: Vector2.all(40),
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [RectangleHitbox()]);
  final Vector2 velocity;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.x <= 0) {
        debugPrint('collision with $other');
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= 0) {
        debugPrint('collision with $other');
        velocity.x = -velocity.x;
      }
      velocity.y = 0;
    }
  }
}
