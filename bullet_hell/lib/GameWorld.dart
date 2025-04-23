

import 'dart:async';
import 'dart:math';

import 'package:bullet_hell/Enemy.dart';
import 'package:bullet_hell/Player.dart';
import 'package:bullet_hell/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class GameWorld extends World with TapCallbacks, PointerMoveCallbacks {
    late final Player player;
  double time = 0;
  final double spawnRate = 3;
  late double lastSpawnTime = 0;

  late Random random = new Random();

  FutureOr<void> onLoad() {
    super.onLoad();
     player = Player();

     add(player);


  }

  @override
  void onTapDown(TapDownEvent event) {
    player.Fire();
    // add(Enemy(Vector2(500,500),player));
  }

  void onPointerMove(PointerMoveEvent event) {
    // print(event.localPosition);
    player.look(event.localPosition);
  }

  @override
  void update(double dt) {
    super.update(dt);
    time+=dt;
    if (time > lastSpawnTime + spawnRate) {
      spawnEnemy();
      lastSpawnTime = time;
    }

  }

  void spawnEnemy() {
  
    double x = doubleInRange(random, -gameWidth/2, gameWidth/2);
    double y = doubleInRange(random, -gameHeight/2, gameHeight/2);
    Vector2 pos = new Vector2(x, y);
    Enemy enemy = new Enemy(pos, player);
    add(enemy);
  }

  double doubleInRange(Random source, num start, num end) {
    return source.nextDouble() * (end - start) + start;
    
  }
}