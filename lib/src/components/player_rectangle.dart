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
  final Vector2 up = Vector2(0, -1);

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

  //collision function from flame docs
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is GroundBlock || other is PlatformBlock) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;
        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if (up.dot(collisionNormal) > 0.9) {
          onGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  void gravityMethod(double dt) {
    velocity.y += gravity;
    velocity.y = velocity.y.clamp(-force, termVelocity);
    position.y += gravity * dt;
  }
}
