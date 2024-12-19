import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:key_runner/objects/ground_block.dart';
import '../key_runner.dart';
import 'play_area.dart';

class PlayerRectangle extends RectangleComponent
    with CollisionCallbacks, TapCallbacks, HasGameRef<KeyRunner> {
  PlayerRectangle({required this.velocity, required super.position})
      : super(
            anchor: Anchor.topLeft,
            size: Vector2.all(40),
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double gravity = 9.8;
  final double force = 700;
  final double termVelocity = 100;
  bool hasJumped = false;
  bool onGround = false;
  final double moveSpeed = 100;

  @override
  void update(double dt) {
    super.update(dt);
    velocity.x = moveSpeed;
    position += velocity * dt;

    gravityMethod(dt);
    if (hasJumped) {
      if (onGround) {
        velocity.y = -force;
        onGround = false;
      }
      hasJumped = false;
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    hasJumped = true;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is GroundBlock) {
      final intersectionPoint = intersectionPoints.first;
      if (velocity.y > 0 &&
          intersectionPoint.y >= other.absoluteTopLeftPosition.y - 40 &&
          intersectionPoint.x > other.absoluteTopLeftPosition.x) {
        velocity.y = 0;
        position.y = other.y - other.size.y - size.y - 1;
        onGround = true;
      } else if (velocity.y < 0 &&
          (intersectionPoint.y > other.absoluteTopLeftPosition.y)) {
        velocity.y = 0;
        position.y = other.y + other.size.y;
      }
      if (intersectionPoint.x <= other.absoluteTopLeftPosition.x) {
        velocity.x = 0;
        position.x = other.x - other.size.x + 23;
      }
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  void gravityMethod(double dt) {
    velocity.y += gravity;
    velocity.y = velocity.y.clamp(-force, termVelocity);
    position.y += gravity * dt;
  }
}
