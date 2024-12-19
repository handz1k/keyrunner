import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:key_runner/objects/ground_block.dart';
import 'package:key_runner/objects/platform_block.dart';
import 'package:key_runner/objects/star.dart';
import '../key_runner.dart';

class PlayerRectangle extends CircleComponent
    with CollisionCallbacks, TapCallbacks, HasGameRef<KeyRunner> {
  PlayerRectangle({required this.velocity, required super.position})
      : super(
            anchor: Anchor.topLeft,
            radius: 20,
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double gravity = 9.8;
  final double force = 700;
  final double termVelocity = 300;
  bool hasJumped = false;
  bool onGround = false;
  final double moveSpeed = 190;

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
    if (other is GroundBlock || other is PlatformBlock) {
      final intersectionPoint = intersectionPoints.first;

      if (velocity.y > 0 &&
          position.y < other.height + other.y - 40 &&
          intersectionPoint.y >= other.absoluteTopLeftPosition.y &&
          intersectionPoints.last.x > other.absoluteTopLeftPosition.x) {
        velocity.y = 0;
        position.y = other.y - other.height - radius * 2 - 0.5;
        onGround = true;
      } else if (velocity.y < 0 && (intersectionPoint.y >= other.y)) {
        velocity.y = 0;
        position.y = other.y + other.size.y - other.height;
        onGround = false;
      }
    }
    if (other is Star) {
      debugPrint('winner');
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  void gravityMethod(double dt) {
    velocity.y += gravity;
    velocity.y = velocity.y.clamp(-force, termVelocity);
    position.y += gravity * dt;
  }
}
