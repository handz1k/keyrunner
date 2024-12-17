import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../key_runner.dart';
import 'play_area.dart';

class PlayerRectangle extends RectangleComponent
    with CollisionCallbacks, HasGameRef<KeyRunner> {
  PlayerRectangle({required this.velocity, required super.position})
      : super(
            anchor: Anchor.center,
            size: Vector2.all(40),
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [RectangleHitbox()]);

  final Vector2 velocity;
  final double gravity = 9.8;
  final double force = 450;
  final double termVelocity = 300;
  bool hasJumped = false;
  bool onGround = false;


  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    gravityMethod(dt);
    if (position.y >= game.height-height-20) {
      position.y = game.height-height-20;
    }
  }

@override
void onCollisionStart(
    Set<Vector2> intersectionPoints, PositionComponent other) {
  super.onCollisionStart(intersectionPoints, other);
  if (other is PlayArea) {
    if (intersectionPoints.first.x <= 0 || intersectionPoints.first.x >= 0) {
      velocity.x = -velocity.x;
    }

  }
}

  void gravityMethod(double dt) {
    velocity.y += gravity;
    velocity.y = velocity.y.clamp(-force, termVelocity);
    position.y += gravity*dt;
  }
}
