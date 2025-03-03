import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:key_runner/objects/ground_block.dart';
import 'package:key_runner/objects/platform_block.dart';
import '../key_runner.dart';

class Player extends CircleComponent
    with CollisionCallbacks, TapCallbacks, HasGameRef<KeyRunner> {
  Player({required this.velocity, required super.position, required hasJumped})
      : super(
            anchor: Anchor.topLeft,
            radius: 20,
            paint: Paint()
              ..color = const Color.fromARGB(255, 255, 0, 0)
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double gravity = 9.8;
  final double force = 700;
  final double termVelocity = 300;
  bool onGround = false;
  final double moveSpeed = 190;
  final Vector2 up = Vector2(0, -1);

  @override
  void update(double dt) {
    super.update(dt);
    bool wasOnGround = onGround;
    velocity.x = moveSpeed;
    position += velocity * dt;
    gravityMethod(dt);

    if (gameRef.hasJumped && wasOnGround) {
      if (onGround) {
        velocity.y = -force;
        gameRef.hasJumped = false;
        onGround = false;
      }
      gameRef.hasJumped = false;
    }
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

        if (velocity.y > 0 && up.dot(collisionNormal) > 0.4) {
          onGround = true;
          velocity.y = 0;
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
