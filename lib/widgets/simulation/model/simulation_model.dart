import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:gravity_simulator/entities/particle/model/particle.dart';
import 'package:gravity_simulator/entities/particle/model/particle_service.dart';

class SimulationModel with ChangeNotifier {
  final ParticleService _particleModel = ParticleService();
  final List<Particle> _particles = [];
  final Random _random = Random();
  bool _isSimulating = false;

  get particles => _particles;
  get isSimulating => _isSimulating;

  void initParticles(double screenHeight, double screenWidth) {
    for (var i = 0; i < _particleModel.getParticlesCount(); i++) {
      _particles.add(Particle(
          x: _getRandomBetween(25, screenWidth),
          y: _getRandomBetween(25, screenHeight),
          mass: _getRandomBetween(100, 500)));
    }
    _particleModel.setAll(_particles);
  }

  double _getRandomBetween(double min, double max) {
    return min + _random.nextDouble() * max;
  }

  void addParticle(Particle particle) {
    _particleModel.add(particle);
    _particles.add(particle);
    notifyListeners();
  }

  void addAllParticles(List<Particle> particles) {
    _particleModel.setAll(particles);
    _particles.clear();
    _particles.addAll(particles);
    notifyListeners();
  }

  Future<void> simulate() async {
    if (_isSimulating) {
      return;
    }
    _isSimulating = true;
    notifyListeners();
    await _particleModel.simulate();
    _particles.clear();
    _particles.addAll(_particleModel.getParticles());
    _isSimulating = false;
    notifyListeners();
  }
}
