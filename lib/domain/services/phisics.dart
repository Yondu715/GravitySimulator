import 'dart:math';
import 'package:gravity_simulator/domain/entities/particle.dart';
import 'package:gravity_simulator/domain/entities/vector.dart';
import 'dart:developer' as dev;

class Physics {
  double G;

  Physics({this.G = 0.01});

  double getAttractiveForce(double mass1, double mass2, double range) {
    double force = G * mass1 * mass2 / max(range * range, 0.00001);
    return force;
  }

  double getAttractiveForceVector(double mass1, double mass2, double range, double x1, double x2) {
    double force = (G * mass1 * mass2) / max(range * range, 0.00001) * (x1 - x2) / max(range, 0.00001);
    return force;
  }

  Vector getTest(Particle a, Particle b) {
    final Vector test = a.getPosition().clone();
    test.add(b.getPosition().getNegative());
    double dist = a.distanceTo(b);
    double force = getAttractiveForce(a.getMass(), b.getMass(), dist);
    test.mult(force);
    return test;
  }
}