import 'package:gravity_simulator/domain/entities/vector.dart';
import 'package:gravity_simulator/domain/services/phisics.dart';
import '../entities/particle.dart';

class ParticleService {
  final Physics _physics = Physics();

  void simulateParticles(List<Particle> particles) {
    for (var i = 0; i < particles.length - 1; i++) {
      final Particle p0 = particles[i];
      for (var j = i + 1; j < particles.length; j++) {
        final Particle p1 = particles[j];
        Vector force = _physics.getAttractiveForceVector(p0, p1);
        p0.addForce(force.getNegative());
        p1.addForce(force);
      }
    }
    for (var particle in particles) {
      Vector force = particle.getForce().clone();
      Vector acc = force.div(particle.getMass());
      particle.addVelocity(acc);
      particle.addPositionVector(particle.getVelocity());
      particle.resetForce();
    }
  }
}
