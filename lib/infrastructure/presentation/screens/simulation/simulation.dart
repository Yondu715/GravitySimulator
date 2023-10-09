import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gravity_simulator/domain/entities/particle/particle.dart';
import 'package:gravity_simulator/domain/services/particle-service/particle-service-interface.dart';
import 'package:gravity_simulator/domain/services/particle-service/particle-service.dart';
import './painter/particle_painter.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key, this.particleNum = 2});
  final int particleNum;

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage>
    with TickerProviderStateMixin {
  final List<Particle> _particles = [];
  final IParticleService particleService = ParticleService();
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
          x: getRandomBetween(0, _size.width),
          y: getRandomBetween(0, _size.height),
          mass: getRandomBetween(100, 500)));
    }

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
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

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => goBack(context),
        ),
      ),
      body: CustomPaint(
        painter: ParticlePainter(_particles, Paint()..color = Colors.black),
      ),
    );
  }
}
