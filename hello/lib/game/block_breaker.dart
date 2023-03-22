import "package:flame/game.dart";

import "package:hello/constants/constants.dart";
import "package:hello/game/exports.dart";

class BlockBreaker extends FlameGame {
  @override
  Future<void>? onLoad() async {
    final paddle = Paddle();
    final paddleSize = paddle.size;

    paddle.position
    ..x = size.x / 2 - paddleSize.x / 2
    ..y = size.y - paddleSize.y - kPaddleStartY;

    await addAll([
      paddle,
    ]);

    await resetBall();
  }

  Future<void> resetBall() async {
    final ball = Ball();

    ball.position
    ..x = size.x / 2 - ball.size.x / 2
    ..y = size.y * kBallStartYRatio;
  }

}
