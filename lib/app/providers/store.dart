import 'package:flutter/material.dart';
import 'package:gravity_simulator/features/particle/change_count/model/change_count_model.dart';
import 'package:gravity_simulator/features/session/login_form/model/login_form_model.dart';
import 'package:gravity_simulator/widgets/simulation/model/simulation_model.dart';
import 'package:provider/provider.dart';

class StoreProvider extends StatelessWidget {
  final Widget child;
  const StoreProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeCountModel>(create: (_) => ChangeCountModel()),
        ChangeNotifierProvider<LoginFormModel>(create: (_) => LoginFormModel()),
        ChangeNotifierProvider<SimulationModel>(create: (_) => SimulationModel())
      ],
      child: child,
    );
  }
}
