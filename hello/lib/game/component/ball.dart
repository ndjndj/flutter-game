import 'dart:async';
import "dart:ui";
import "dart:math";

import 'package:flame/collisions.dart';
import "package:flame/components.dart";

import "package:hello/constants/constants.dart";

class Ball extends CircleComponent with CollisionCallbacks {
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

  @override
  Future<void> onLoad() async {
    final hitbox = CircleHitbox(radius: radius);
    await add(hitbox);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += velocity * dt;
    super.update(dt);
  }

}
