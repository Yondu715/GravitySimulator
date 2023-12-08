import 'dart:math';

import 'package:flutter/material.dart';
import './particle.dart';
import './vector.dart';

class ParticleModel with ChangeNotifier {
  int _particlesCount = 0;
  double G = 0.001;
  bool _isSimulating = false;
  final List<Particle> _particles = [];

  List<Particle> getParticles() {
    return _particles;
  }

  int getParticlesCount() {
    return _particlesCount;
  }

  bool getIsSimulating() {
    return _isSimulating;
  }

  void add(Particle particle) {
    _particles.add(particle);
    notifyListeners();
  }

  void setAll(List<Particle> particles) {
    _particles.clear();
    _particles.addAll(particles);
    notifyListeners();
  }

  void setCount(int count) {
    _particlesCount = count;
    notifyListeners();
  }

  double getAttractiveForce(double mass1, double mass2, double range) {
    return G * mass1 * mass2 / max(range * range, 0.00001);
  }

  Vector getAttractiveForceVector(Particle a, Particle b) {
    final Vector forceVector = a.getPosition().clone();
    forceVector.sub(b.getPosition());
    double dist = a.distanceTo(b);
    double force = getAttractiveForce(a.getMass(), b.getMass(), dist);
    forceVector.mult(force);
    return forceVector;
  }

  Future<void> simulate() async {
    if (_isSimulating) {
      return;
    }
    _isSimulating = true;
    for (var i = 0; i < _particles.length - 1; i++) {
      final Particle p0 = _particles[i];
      for (var j = i + 1; j < _particles.length; j++) {
        final Particle p1 = _particles[j];
        Vector force = getAttractiveForceVector(p0, p1);
        p0.addForce(force.getNegative());
        p1.addForce(force);
      }
    }
    for (var particle in _particles) {
      Vector force = particle.getForce().clone();
      Vector acc = force.div(particle.getMass());
      particle.addVelocity(acc);
      particle.addPositionVector(particle.getVelocity());
      particle.resetForce();
    }
    _isSimulating = false;
    notifyListeners();
  }
}
