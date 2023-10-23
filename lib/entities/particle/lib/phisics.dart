import 'dart:math';
import 'package:gravity_simulator/entities/particle/model/particle.dart';
import 'package:gravity_simulator/entities/particle/model/vector.dart';

class Physics {
  double G;

  Physics({this.G = 0.01});

  double getAttractiveForce(double mass1, double mass2, double range) {
    double force = G * mass1 * mass2 / max(range * range, 0.00001);
    return force;
  }

  Vector getAttractiveForceVector(Particle a, Particle b) {
    final Vector forceVector = a.getPosition().clone();
    forceVector.sub(b.getPosition());
    double dist = a.distanceTo(b);
    double force = getAttractiveForce(a.getMass(), b.getMass(), dist);
    forceVector.mult(force);
    return forceVector;
  }
}