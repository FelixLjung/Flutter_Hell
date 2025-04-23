

import 'dart:async';

import 'package:bullet_hell/Bullet.dart';
import 'package:bullet_hell/MainGame.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Player extends RectangleComponent with HasGameRef<MainGame>, KeyboardHandler{
  double hp = 10000;
  double speed = 5;
  late Vector2 direction;
  Player({
    Color color = Colors.white,
    // TapDetector tap = new TapDetector();

  }) {
    super.position = Vector2(0,0);
    super.size = Vector2(100,100);
    super.anchor = Anchor.center;
  }



  bool move(Vector2 dir) {
    print(dir);

    position.add(dir*speed);
    return true;
  }

  
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Add a hitbox for collision detection
    add(RectangleHitbox());
    add(
      KeyboardListenerComponent(
        keyDown: {
          LogicalKeyboardKey.keyW: (keysPressed) {  move(Vector2(0, -1)); return true; },
          LogicalKeyboardKey.keyD: (keysPressed) {  move(Vector2(1, 0)); return true; },
          LogicalKeyboardKey.keyA: (keysPressed) {  move(Vector2(-1, 0)); return true;  },
          LogicalKeyboardKey.keyS: (keysPressed) {  move(Vector2(0, 1)); return true;  },
        }
      )
    );
  }

  void look(Vector2 pos) {
    direction = pos - position;
    // direction.normalize();
    // print(direction);
  }

  void Fire() {
    // print("Fire!");
    final Vector2 aimDir = direction.normalized();
    Bullet bullet = Bullet(aimDir);
  
    add(bullet);
  }

  void recieveDamage(double dmg) {
    hp-=dmg;
    if (hp <= 0) {
      removeFromParent();
      print("Player died!");
    }
  }




}