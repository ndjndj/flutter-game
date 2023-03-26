import 'dart:async';
import "dart:ui";
import "dart:math";

import 'package:flame/collisions.dart';
import "package:flame/components.dart";

import "package:hello/constants/constants.dart";
import 'package:hello/game/component/paddle.dart';

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

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other
  ) {
    final collisionPoint = intersectionPoints.first;

    if (other is Paddle) {
      final paddleRect = other.toAbsoluteRect();
      updateBallTrajectory(collisionPoint, paddleRect);
    }

    super.onCollisionStart(intersectionPoints, other);
  }

  void updateBallTrajectory(
    Vector2 collisionPoint,
    Rect rect
  ) {
    final isLeftHit = collisionPoint.x == rect.left;
    final isRightHit = collisionPoint.x == rect.right;
    final isTopHit = collisionPoint.y == rect.top;
    final isBottomHit = collisionPoint.y == rect.bottom;

    final isLeftOrRightHit = isLeftHit || isRightHit;
    final isTopOrBottomHit = isTopHit || isBottomHit;

    if (isLeftOrRightHit) {
      if (isRightHit && velocity.x > 0) {
        velocity.x += kBallNudgeSpeed;
        return;
      }

      if (isLeftHit && velocity.x < 0) {
        velocity.x -= kBallNudgeSpeed;
        return;
      }

      velocity.x = -velocity.x;
      return;
    }

    if (isTopOrBottomHit) {
      if (Random().nextInt(kBallRandomNumber) % kBallRandomNumber == 0) {
        velocity.x += kBallNudgeSpeed;
      }
    }
  }

}
