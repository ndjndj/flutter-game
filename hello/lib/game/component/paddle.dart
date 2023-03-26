import "dart:ui";

import "package:flame/components.dart";
import 'package:flame/experimental.dart';

import "package:hello/constants/constants.dart";

class Paddle extends RectangleComponent with DragCallbacks {
  Paddle({
    required this.draggingPaddle
  })
  : super(
    size: Vector2(kPaddleWidth, kPaddleHeight),
    paint: Paint()..color = kPaddleColor
  );

  final void Function(DragUpdateEvent event) draggingPaddle;

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
