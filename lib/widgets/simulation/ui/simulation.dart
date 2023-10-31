import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../entities/particle/model/particle_model.dart';
import '../../../entities/particle/model/particle.dart';
import '../../../entities/particle/ui/particleList/List.dart';

class SimulationWidget extends StatefulWidget {
  const SimulationWidget({super.key});

  @override
  State<SimulationWidget> createState() => _SimulationWidgetState();
}

class _SimulationWidgetState extends State<SimulationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Random _random = Random();
  final Size _size =
      WidgetsBinding.instance.platformDispatcher.views.first.display.size;
  final double _pixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ParticleModel particleModel = context.read<ParticleModel>();
    List<Particle> temp = [];
    for (var i = 0; i < particleModel.getParticlesCount(); i++) {
      temp.add(Particle(
          x: getRandomBetween(25, _size.width / _pixelRatio - 60),
          y: getRandomBetween(25, _size.height / _pixelRatio - 200),
          mass: getRandomBetween(100, 500)));
    }
    Future.delayed(Duration.zero, () {
      particleModel.setAll(temp);
    });

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addListener(() {
      setState(() {
        if (!particleModel.getIsSimulating()) {
          particleModel.simulate();
        }
      });
    });
    _animationController.repeat();
  }

  double getRandomBetween(double min, double max) {
    return min + _random.nextDouble() * max;
  }

  @override
  Widget build(BuildContext context) {
    List<Particle> particles = context.watch<ParticleModel>().getParticles();

    return Scaffold(
        body: ParticleList(particles: particles, particleColor: Colors.grey));
  }
}
