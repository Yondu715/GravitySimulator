import 'package:gravity_simulator/screens/home/home.dart';
import 'package:gravity_simulator/screens/simulation/simulation.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';

final routerView = {
  Routes.home: (_) => const HomeScreen(),
  Routes.simulation: (_) => const SimulationScreen()
};

const initialRoute = Routes.home;