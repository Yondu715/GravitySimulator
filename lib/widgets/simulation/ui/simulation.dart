import 'package:flutter/material.dart';
import 'package:gravity_simulator/widgets/simulation/model/simulation_model.dart';
import 'package:provider/provider.dart';
import '../../../entities/particle/model/types/particle.dart';
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
    SimulationModel simulationModel = context.read<SimulationModel>();
    simulationModel.initParticles(_size.height / _pixelRatio, _size.width / _pixelRatio);

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addListener(() {
      setState(() {
          simulationModel.simulateFx();
      });
    });
    _animationController.repeat();
  }
  
  @override
  Widget build(BuildContext context) {
    List<Particle> particles = context.watch<SimulationModel>().particles;

    return Scaffold(
        body: ParticleList(particles: particles, particleColor: Colors.cyan));
  }
}
