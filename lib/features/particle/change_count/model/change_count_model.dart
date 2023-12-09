import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/particle_service.dart';

class ChangeCountModel with ChangeNotifier {
  final ParticleService _particleService = ParticleService();

  void setCount(String count) {
    int countNum = count.isNotEmpty
        ? int.parse(count)
        : 0;
    _particleService.setCount(countNum);
    notifyListeners();
  }

}
