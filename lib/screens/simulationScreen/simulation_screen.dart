import 'package:flutter/material.dart';
import 'package:gravity_simulator/widgets/simulation/simulation.dart';
import '../../shared/ui/header/header.dart';

class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key, this.particleNum = 2});
  final int particleNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SimulationWidget(particleNum: particleNum)
    );
  }
}
