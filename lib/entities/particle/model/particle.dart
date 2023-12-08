import 'dart:math';
import 'package:gravity_simulator/entities/particle/model/vector.dart';

class Particle {
  final Vector _position;
  final Vector _velocity;
  final Vector _force;
  double _mass;

  Particle(
      {double x = 0,
      double y = 0,
      double vx = 0,
      double vy = 0,
      double mass = 1})
      : _position = Vector(x: x, y: y),
        _velocity = Vector(x: vx, y: vy),
        _mass = mass,
        _force = Vector();

  double getRadius() {
    return sqrt(_mass / pi) / 2;
  }

  Vector getPosition() {
    return _position;
  }

  void addPositionNum(double x, double y) {
    _position.x += x;
    _position.y += y;
  }

  void addPositionVector(Vector position) {
    _position.add(position);
  }

  Vector getVelocity() {
    return _velocity;
  }

  void addVelocity(Vector velocity) {
    _velocity.add(velocity);
  }

  void addVelocityNum(double x, double y) {
    _velocity.x += x;
    _velocity.y += y;
  }

  Vector getForce() {
    return _force;
  }

  void addForce(Vector force) {
    _force.add(force);
  }

  void resetForce() {
    _force.x = 0;
    _force.y = 0;
  }

  double getMass() {
    return _mass;
  }

  void addMass(double mass) {
    _mass += mass;
  }

  double distanceTo(Particle particle) {
    double dx = _position.x - particle._position.x;
    double dy = _position.y - particle._position.y;
    double dist = sqrt(dx * dx + dy * dy);
    return dist;
  }
}
