import 'dart:math';

import 'package:gravity_simulator/domain/entities/vector.dart';

class Particle {
  final Vector _position;
  final Vector _velocity;
  final Vector _acceleration;
  final List<Vector> _forces = [];
  double? _mass;

  Particle({double x = 0, double y = 0, double vx = 0, double vy = 0, double ax = 0, double ay = 0, double mass = 1}): 
    _position = Vector(x: x, y: y),
    _velocity = Vector(x: vx, y: vy),
    _acceleration = Vector(x: ax, y: ay)
  {
    _mass = mass;
  }

  double distanceTo(Particle a) {
    return _position.distanceToVector(a.getPosition());
  }

  double getRadius() {
    return sqrt(_mass!/pi);
  }

  Vector getPosition() {
    return _position;
  }

  Vector getVelocity() {
    return _velocity;
  }

  Vector getAcceleration() {
    return _acceleration;
  }

  double getMass() {
    return _mass!;
  }

  List<Vector> getForces() {
    return _forces;
  }

  void setPosition(Vector position) {
    _position.setXY(position);
  }

  void setVelocity(Vector velocity) {
    _velocity.setXY(velocity);
  }

  void setAcceleration(Vector acceleration) {
    _velocity.setXY(acceleration);
  }

}