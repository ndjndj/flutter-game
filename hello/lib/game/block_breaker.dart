import "package:flame/game.dart";

import "package:hello/constants/constants.dart";
import "package:hello/game/component/paddle.dart";

class BlockBreaker extends FlameGame {
  @override
  Future<void>? onLoad() async {
    final paddle = Paddle();
    final paddleSize = paddle.size;

    paddle
    ..position.x = size.x / 2 - paddleSize.x / 2
    ..position.y = size.y - paddleSize.y - kPaddleStartY;

    await addAll([
      paddle,
    ]);
  }
}
