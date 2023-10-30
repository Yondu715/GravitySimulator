import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/particle_model.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';
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
        Navigator.pushNamed(context, Routes.simulation)
      },
      onChanged: (value) => {
    log(particleModel.getParticlesCount().toString()),
        particleModel.setCount(int.parse(value))
        },
    );
  }
}
