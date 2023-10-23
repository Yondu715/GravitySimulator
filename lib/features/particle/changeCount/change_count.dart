import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/store.dart';
import 'package:gravity_simulator/screens/simulationScreen/simulation_screen.dart';
import 'package:gravity_simulator/shared/ui/textInput/text_input.dart';
import 'package:provider/provider.dart';


class ChangeCount extends StatelessWidget {
  const ChangeCount({super.key});

  @override
  Widget build(BuildContext context) {
    ParticleModel particleModel = context.read<ParticleModel>();
    return TextInput(
      width: 250,
      type: TextInputType.number,
      placeHolder: "Введите число точек",
      onSubmited: (_) => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const SimulationScreen()))
      },
      onChanged: (value) => {
    log(particleModel.particleCount.toString()),
        particleModel.setCount(int.parse(value))
        },
    );
  }
}
