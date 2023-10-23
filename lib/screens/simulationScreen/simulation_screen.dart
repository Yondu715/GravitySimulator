import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/store.dart';
import 'package:provider/provider.dart';
import '../../widgets/simulation/simulation.dart';
import '../../shared/ui/header/header.dart';

class SimulationScreen extends StatelessWidget {
  const SimulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ParticleModel(),
        child: const Scaffold(appBar: Header(), body: SimulationWidget()));
  }
}
