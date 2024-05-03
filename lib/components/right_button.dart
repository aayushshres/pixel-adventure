import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class RightButton extends SpriteComponent
    with HasGameRef<PixelAdventure>, TapCallbacks {
  RightButton();

  final double margin = 608;
  final double buttonSize = 32;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('HUD/RightButton.png'));
    size = Vector2.all(buttonSize);
    position = Vector2(
      game.size.x - 560 - buttonSize,
      game.size.y - 32 - buttonSize,
    );
    priority = 10;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.horizontalMovement = 1;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.horizontalMovement = 0;
    super.onTapUp(event);
  }
}