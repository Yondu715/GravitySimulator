import 'dart:async';
import 'dart:math';

import 'types/particle.dart';
import 'types/vector.dart';

class ParticleService {
  int _particlesCount = 0;
  double G = 0.0001;
  final List<Particle> _particles = [];
  final _particleStream = StreamController<List<Particle>>();

  static final ParticleService _instance = ParticleService._singleton();
  factory ParticleService() {
    return _instance;
  }
  ParticleService._singleton();

  Stream<List<Particle>> get particleStream => _particleStream.stream;

  void dispose() {
    _particleStream.close();
  }

  List<Particle> getParticles() {
    return _particles;
  }

  int getParticlesCount() {
    return _particlesCount;
  }

  void add(Particle particle) {
    _particles.add(particle);
    _particleStream.add(_particles.toList());
  }

  void setAll(List<Particle> particles) {
    _particles.clear();
    _particles.addAll(particles);
    _particleStream.add(_particles.toList());
  }

  void setCount(int count) {
    _particlesCount = count;
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

  Future<void> simulateFx() async {
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
    List<Particle> newParticles = [];
    List<Particle> forDelete = [];
    for (var i = 0; i < _particles.length - 1; i++) {
      var a = _particles[i];
      if (forDelete.contains(a)) {
        continue;
      }
      for (var j = i + 1; j < _particles.length; j++) {
        var b = _particles[j];
        if (forDelete.contains(b)) {
          continue;
        }
        Vector posA = a.getPosition().clone();
        Vector posB = b.getPosition().clone();
        Vector diff = posA.clone().sub(posB);
        if (diff.getLength() < (a.getRadius() + b.getRadius()) / 2) {
          var mass = a.getMass() + b.getMass();
          Particle newParticle = Particle(mass: mass);
          newParticle.addPositionNum(
              posB.x +
                  (diff.x * a.getMass()) / newParticle.getMass(),
              posB.y +
                  (diff.y * a.getMass()) / newParticle.getMass());
          newParticle.addVelocityNum(
              (a.getMass() / newParticle.getMass()) * a.getVelocity().x + (b.getMass() / newParticle.getMass()) * b.getVelocity().x,
              (a.getMass() / newParticle.getMass()) * a.getVelocity().y + (b.getMass() / newParticle.getMass()) * b.getVelocity().y);
          newParticles.add(newParticle);
          forDelete.addAll([a, b]);
        }
      }
    }
    List<Particle> updateParticles = [];
    for (var particle in _particles) {
      if (!forDelete.contains(particle)) {
        updateParticles.add(particle);
      }
    }
    _particlesCount = updateParticles.length;
    updateParticles.addAll(newParticles);
    setAll(updateParticles);
  }
}
