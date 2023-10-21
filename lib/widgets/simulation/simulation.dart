import 'dart:math';

import 'package:flutter/material.dart';
import '../../entities/particle/model/particle.dart';
import '../../entities/particle/model/services/particle_service.dart';
import '../../entities/particle/ui/painter/particle_painter.dart';

class SimulationWidget extends StatefulWidget {
  const SimulationWidget({super.key, this.particleNum = 2});
  final int particleNum;

  @override
  State<SimulationWidget> createState() => _SimulationWidgetState();
}

class _SimulationWidgetState extends State<SimulationWidget>
    with TickerProviderStateMixin {
  final List<Particle> _particles = [];
  final ParticleService particleService = ParticleService();
  late AnimationController _animationController;
  late Animation<double> _animation;
  Random random = Random();
  final Size _size =
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.particleNum; i++) {
      _particles.add(Particle(
          x: getRandomBetween(200, _size.width - 500),
          y: getRandomBetween(300, _size.height - 500),
          mass: getRandomBetween(100, 500)));
    }

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addListener(() {
      setState(() {
        updateParticles();
      });
    });
    _animationController.repeat();
  }

  void updateParticles() {
    particleService.simulateParticles(_particles);
  }

  double getRandomBetween(double min, double max) {
    double result = min + random.nextDouble() * max;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ParticlePainter(_particles, Paint()..color = Colors.black),
      ),
    );
  }
}
