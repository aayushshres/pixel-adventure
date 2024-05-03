import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

PixelAdventure game = PixelAdventure();

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: kDebugMode ? PixelAdventure() : game);
  }
}
