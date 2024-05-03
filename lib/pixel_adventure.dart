import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:pixel_adventure/components/jump_button.dart';
import 'package:pixel_adventure/components/left_button.dart';
import 'package:pixel_adventure/components/player.dart';
import 'package:pixel_adventure/components/level.dart';
import 'package:pixel_adventure/components/right_button.dart';

class PixelAdventure extends FlameGame
    with
        HasKeyboardHandlerComponents,
        DragCallbacks,
        HasCollisionDetection,
        TapCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF000000);
  late CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  late JoystickComponent joystick;
  bool showControls = true;
  bool playSounds = true;
  double soundVolume = 1.0;
  List<String> levelNames = ['level-01', 'level-02'];
  int currentLevelIndex = 0;

  @override
  FutureOr<void> onLoad() async {
    // Load all images into cache
    await images.loadAllImages();

    _loadLevel();
    if (showControls) {
      add(JumpButton());
      add(RightButton());
      add(LeftButton());
    }

    return super.onLoad();
  }

  void loadNextLevel() {
    removeWhere((component) => component is Level);

    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      _loadLevel();
    } else {
      // no more levels
      currentLevelIndex = 0;
      _loadLevel();
    }
  }

  void _loadLevel() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Level world = Level(
        player: player,
        levelName: levelNames[currentLevelIndex],
      );

      cam = CameraComponent.withFixedResolution(
        world: world,
        width: 640,
        height: 360,
      )
        ..priority = 0
        ..viewfinder.anchor = Anchor.topLeft;

      addAll([cam, world]);
    });
  }
}
