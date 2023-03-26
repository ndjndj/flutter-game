import 'package:flame/collisions.dart';
import 'package:flame/experimental.dart';
import "package:flame/game.dart";

import "package:hello/constants/constants.dart";
import "package:hello/game/exports.dart";

class BlockBreaker extends FlameGame with HasDraggableComponents, HasCollisionDetection {
  @override
  Future<void>? onLoad() async {
    final paddle = Paddle(
      draggingPaddle: draggingPaddle
    );
    final paddleSize = paddle.size;

    paddle.position
    ..x = size.x / 2 - paddleSize.x / 2
    ..y = size.y - paddleSize.y - kPaddleStartY;

    await addAll([
      ScreenHitbox(),
      paddle,
    ]);

    await resetBall();
    await resetBlock();
  }

  Future<void> resetBall() async {
    final ball = Ball();

    ball.position
    ..x = size.x / 2 - ball.size.x / 2
    ..y = size.y * kBallStartYRatio;

    await add(ball);
  }

  Future<void> resetBlock() async {
    final sizeX = (
      size.x - kBlocksStartXPosition * 2 - kBlockPadding * (kBlocksRowCount - 1)
    ) / kBlocksRowCount;

    final sizeY = (
      size.y * kBlocksHeightRatio - kBlocksStartYPosition - kBlockPadding + (kBlocksColumnCount - 1)
    ) / kBlocksColumnCount;

    final blocks = List<Block>.generate(
      kBlocksColumnCount * kBlocksRowCount,
      (int index) {
        final block = Block(
          blockSize:  Vector2(sizeX, sizeY)
        );

        final indexX = index % kBlocksRowCount;
        final indexY = index ~/ kBlocksRowCount;

        block.position
        ..x = kBlocksStartXPosition + indexX * (block.size.x + kBlockPadding)
        ..y = kBlocksStartYPosition + indexY * (block.size.y + kBlockPadding);

        return block;
      }
    );

    await addAll(blocks);
  }

  void draggingPaddle(DragUpdateEvent event) {
    final paddle = children.whereType<Paddle>().first;
    paddle.position.x += event.delta.x;
    paddle.position.y += event.delta.y;

    if (paddle.position.x < 0) {
      paddle.position.x = 0;
    }

    if (paddle.position.x > size.x - paddle.size.x) {
      paddle.position.x = size.x - paddle.size.x;
    }

    if (paddle.position.y < 0) {
      paddle.position.y = 0;
    }

    if (paddle.position.y > size.y - paddle.size.y) {
      paddle.position.y = size.y - paddle.size.y;
    }
  }

}
