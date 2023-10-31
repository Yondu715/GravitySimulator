import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/particle.dart';
import './Painter.dart';

class ParticleList extends StatelessWidget {
  final List<Particle> particles;
  final Color particleColor;

  const ParticleList({super.key, required this.particles, this.particleColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ParticlePainter(
            particles, Paint()..color = particleColor),
      );
  }

}
