import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:pixel_adventure/components/hitbox.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

class Fruit extends SpriteAnimationComponent
    with HasGameRef<PixelAdventure>, CollisionCallbacks {
  final String fruit;
  Fruit({
    super.position,
    super.size,
    super.removeOnFinish = true,
    this.fruit = "Apple",
  });

  final double stepTime = 0.05;
  final hitbox = CustomHitBox(
    offsetX: 10,
    offsetY: 10,
    width: 12,
    height: 12,
  );
  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(
      position: Vector2(hitbox.offsetX, hitbox.offsetY),
      size: Vector2(hitbox.width, hitbox.height),
      collisionType: CollisionType.passive,
    ));
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache("Items/Fruits/$fruit.png"),
        SpriteAnimationData.sequenced(
          amount: 17,
          stepTime: stepTime,
          textureSize: Vector2.all(32),
        ));
    return super.onLoad();
  }

  void collidedWithPlayer() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache("Items/Fruits/Collected.png"),
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );

    await animationTicker?.completed;
    removeFromParent();
  }
}
