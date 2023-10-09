import '../../entities/particle/particle.dart';

abstract class IParticleService {
  void simulateParticles(List<Particle> particles);
}