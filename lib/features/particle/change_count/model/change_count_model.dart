import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/particle_model.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';
import 'package:provider/provider.dart';

class ChangeCountModel with ChangeNotifier {
  String count = "";

  void setCount(String count) {
    this.count = count;
  }

  void onSubmited(BuildContext context) {
    ParticleModel particleModel = context.read<ParticleModel>();
    int countNum = count.isNotEmpty ? int.parse(count) : 0;
    particleModel.setCount(countNum);
    Navigator.pushNamed(context, Routes.simulation);
  }
}
