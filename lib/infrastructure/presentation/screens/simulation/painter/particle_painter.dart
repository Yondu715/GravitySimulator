import 'package:flutter/material.dart';
import 'package:gravity_simulator/domain/entities/particle.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> _particles;
  final Paint _particlePaint;

  ParticlePainter(this._particles, this._particlePaint);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in _particles) {
      canvas.drawCircle(
          Offset(particle.getPosition().x, particle.getPosition().y),
          particle.getRadius(),
          _particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) {
    return true;
  }
}
