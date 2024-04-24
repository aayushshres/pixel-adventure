import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/painting.dart';
import 'package:pixel_adventure/components/player.dart';
import 'package:pixel_adventure/components/level.dart';

class PixelAdventure extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks, HasCollisionDetection {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late final CameraComponent cam;
  Player player = Player(character: "Mask Dude");
  late JoystickComponent joyStick;
  bool showJoyStick = false; // for mobile

  @override
  FutureOr<void> onLoad() async {
    // load all images into cache
    await images.loadAllImages();

    @override
    final world = Level(
      levelName: "level-01",
      player: player,
    );

    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 360,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    cam.priority = 0;

    addAll([cam, world]);
    if (showJoyStick) {
      addJoyStick();
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showJoyStick) {
      _updateJoyStick();
    }
    super.update(dt);
  }

  void addJoyStick() {
    joyStick = JoystickComponent(
      priority: 1,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache("HUD/Knob.png"),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache("HUD/Joystick.png"),
        ),
      ),
      margin: const EdgeInsets.only(
        left: 32,
        bottom: 32,
      ),
    );
    add(joyStick);
  }

  void _updateJoyStick() {
    switch (joyStick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }
}
