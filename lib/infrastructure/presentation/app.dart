import 'package:flutter/material.dart';
import 'package:gravity_simulator/infrastructure/presentation/screens/home/home.dart';
import 'package:gravity_simulator/infrastructure/presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gravity Simulation',
      theme: AppTheme.getAppTheme(),
      home: const HomePage(),
    );
  }
}
