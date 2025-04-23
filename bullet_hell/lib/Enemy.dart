

import 'dart:ui';

import 'package:bullet_hell/Bullet.dart';
import 'package:bullet_hell/Player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Enemy extends RectangleComponent with CollisionCallbacks{
  late Player player;
  double speed = 100;
  double hp = 20;
  double dmg = 50; 

  Enemy(Vector2 pos, Player player,{
    Color color = Colors.red,
    
  }) {
    super.anchor = Anchor.center;
    super.size = Vector2(100, 100);
    super.position = pos;
    super.setColor(color);
    this.player = player;
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
    MoveTowardsPlayer(dt);
     
  }

  void MoveTowardsPlayer(double dt) {
    Vector2 direction = player.position - this.position;
    direction.normalize();
    position.add(direction*speed*dt);
  }

  void RecieveDamage(double dmg) {
    hp-=dmg;

    if (hp <= 0) {
      removeFromParent();
    }
  }

  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet) {
      print("Hit enemy");
      other.removeFromParent();
      RecieveDamage(other.dmg);
    }

    else if (other is Player) {
      other.recieveDamage(dmg);
    }
  }


}