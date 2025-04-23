
import 'dart:async';
import 'dart:ui';

import 'package:bullet_hell/GameWorld.dart';
import 'package:bullet_hell/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainGame extends FlameGame<GameWorld> with HorizontalDragDetector, HasCollisionDetection, HasKeyboardHandlerComponents{

  MainGame({super.children}) : super (
    world: GameWorld(),
    camera: CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight
    ),
  );

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    debugMode = true;
  }
  @override
  Color backgroundColor() {
    return Colors.green;
  }



    // @overrid
  // void onHorizontalDragUpdate(DragUpdateInfo info) {
  //   super.onHorizontalDragUpdate(info);
  //   // world.player.move(info.delta.global.x);
  //   world.player.Move(info.delta.global.x);
  // }

  
}

  
