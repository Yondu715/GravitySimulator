import 'package:flutter/material.dart';
import '../../../widgets/simulation/ui/Simulation.dart';
import '../../../widgets/header/header.dart';

class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: Header(), body: SimulationWidget());
  }
}
