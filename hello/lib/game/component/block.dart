import "dart:math";
import "dart:ui";

import 'package:flame/collisions.dart';
import "package:flame/components.dart";
import "package:hello/constants/constants.dart";
import 'package:hello/game/component/ball.dart';

class Block extends RectangleComponent with CollisionCallbacks {
  Block({
    required this.blockSize
  }) : super(
    size: blockSize,
    paint: Paint()..color = kBlockColors[Random().nextInt(kBlockColors.length)]
  );

  final Vector2 blockSize;

  @override
  Future<void> onLoad() async {
    final blockHitBox = RectangleHitbox(size: size);

    await add(blockHitBox);

    return super.onLoad();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other
  ) {
    if (other is Ball) {
      removeFromParent();
    }

    super.onCollisionStart(intersectionPoints, other);
  }
}
