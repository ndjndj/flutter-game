import 'dart:async';
import "dart:ui";

import 'package:flame/collisions.dart';
import "package:flame/components.dart";
import 'package:flame/experimental.dart';

import "package:hello/constants/constants.dart";

class Paddle extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  Paddle({
    required this.draggingPaddle
  }): super(
    size: Vector2(kPaddleWidth, kPaddleHeight),
    paint: Paint()..color = kPaddleColor
  );

  final void Function(DragUpdateEvent event) draggingPaddle;

  @override
  FutureOr<void> onLoad() {
    final paddleHitBox = RectangleHitbox(
      size: size
    );

    add(paddleHitBox);
    return super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
