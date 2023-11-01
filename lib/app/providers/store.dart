import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/particle/model/particle_model.dart';
import 'package:gravity_simulator/features/particle/change_count/model/change_count_model.dart';
import 'package:provider/provider.dart';

class StoreProvider extends StatelessWidget {
  final Widget child;
  const StoreProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ParticleModel>(create: (_) => ParticleModel()),
        ChangeNotifierProvider<ChangeCountModel>(create: (_) => ChangeCountModel())
      ],
      child: child,
    );
  }
}
