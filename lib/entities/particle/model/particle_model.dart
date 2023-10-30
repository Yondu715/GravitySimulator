import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/lib/phisics.dart';
import './particle.dart';
import './vector.dart';

class ParticleModel with ChangeNotifier {
  final Physics _physics = Physics(G: 0.001);
  int _particlesCount = 0;
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

  ParticleModel._privateConstructor();
  static final ParticleModel _instance = ParticleModel._privateConstructor();

  factory ParticleModel() {
    return _instance;
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

  void simulate() async {
    if (_isSimulating) {
      return;
    }
    _isSimulating = true;
    for (var i = 0; i < _particles.length - 1; i++) {
      final Particle p0 = _particles[i];
      for (var j = i + 1; j < _particles.length; j++) {
        final Particle p1 = _particles[j];
        Vector force = _physics.getAttractiveForceVector(p0, p1);
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