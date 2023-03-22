import "dart:math";
import "dart:ui";

import "package:flame/components.dart";
import "package:hello/constants/constants.dart";

class Block extends RectangleComponent {
  Block({
    required this.blockSize
  }) : super(
    size: blockSize,
    paint: Paint()..color = kBlockColors[Random().nextInt(kBlockColors.length)]
  );

  final Vector2 blockSize;
}
