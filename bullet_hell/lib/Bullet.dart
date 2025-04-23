import 'package:bullet_hell/Enemy.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Bullet extends RectangleComponent with CollisionCallbacks {
  late final Vector2 direction;
  final double dmg = 10;
  double speed = 500; // Speed of the bullet in pixels per second
  Bullet(Vector2 dir) {
    super.position = Vector2(0, 0);
    super.size = Vector2(20, 10);
    super.anchor = Anchor.center;
    direction = dir;
    // super.color = Colors.red; 
  }

    @override
  Future<void> onLoad() async {
    super.onLoad();
    // Add a hitbox for collision detection
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // print("Bullet");
    // Example: Move the bullet upwards
    position.add(direction*dt*speed);
  }

  // @override
  // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  //   super.onCollision(intersectionPoints, other);
  //   print("bullet hit");

  // }



}
