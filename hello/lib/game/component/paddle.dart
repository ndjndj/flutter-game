import "dart:ui";

import "package:flame/components.dart";

import "package:hello/constants/constants.dart";

class Paddle extends RectangleComponent {
  Paddle()
  : super(
    size: Vector2(kPaddleWidth, kPaddleHeight),
    paint: Paint()..color = kPaddleColor
  );
}
