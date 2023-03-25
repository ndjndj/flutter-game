import "dart:ui";
import "dart:math";

import "package:flame/components.dart";

import "package:hello/constants/constants.dart";

class Ball extends CircleComponent {
  Ball() {
    radius = kBallRadius;
    paint = Paint()..color = kBallColor;

    final vx = kBallSpeed * cos(spawnAngle * kRad);
    final vy = kBallSpeed * sin(spawnAngle * kRad);
    velocity = Vector2(vx, vy);
  }
  late Vector2 velocity;

  double get spawnAngle {
    final random = Random().nextDouble();
    return lerpDouble(kBallMinSpawnAngle, kBallMaxSpawnAngle, random)!;
  }

}
