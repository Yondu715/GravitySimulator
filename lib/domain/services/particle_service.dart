import 'package:gravity_simulator/domain/entities/vector.dart';
import 'package:gravity_simulator/domain/services/phisics.dart';
import 'dart:developer' as dev;
import '../entities/particle.dart';

class ParticleService {
  final Physics _physics = Physics();

  void simulateParticles(List<Particle> particles) {
    for (var particle in particles) {
      particle.resetForce();
    }
    for (var i = 0; i < particles.length - 1; i++) {
      final Particle p0 = particles[i];
      for (var j = i + 1; j < particles.length; j++) {
        final Particle p1 = particles[j];
        Vector test = _physics.getTest(p0, p1);
        p0.addForce(test.getNegative());
        p1.addForce(test);
      }
    }
    for (var particle in particles) {
      Vector acc = particle.getForce().clone().mult(1/particle.getMass());
      particle.addVelocity(acc);
      particle.addPositionVector(particle.getVelocity());
    }
  }
}
