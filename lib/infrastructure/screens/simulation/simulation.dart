import 'package:flutter/material.dart';
import 'package:gravity_simulator/domain/entities/particle.dart';
import 'package:gravity_simulator/domain/services/particle_service.dart';
import 'package:gravity_simulator/infrastructure/screens/simulation/painter/particle_painter.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> with TickerProviderStateMixin {
  final List<Particle> _particles = [];
  final ParticleService particleService = ParticleService();
  AnimationController? _animationController;
  Animation<double>? _animation;

    @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _particles.add(Particle(x: 500, y: 500, mass: 300));
    _particles.add(Particle(x: 100, y: 200, mass: 101));
    _particles.add(Particle(x: 300, y: 700, mass: 101));

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!);
    _animation!.addListener(() {
        setState(() {
          updateParticles();
        });
      });
    _animationController!.repeat();
  }


  void updateParticles() {
    particleService.simulateParticles(_particles);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: ParticlePainter(_particles, Paint()..color = Colors.blue),
      ),
    );
  }
}


