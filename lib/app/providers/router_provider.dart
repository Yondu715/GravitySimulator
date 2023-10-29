import 'package:gravity_simulator/screens/homeScreen/home_screen.dart';
import 'package:gravity_simulator/screens/simulationScreen/simulation_screen.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';

final routerView = {
  Routes.home: (_) => const HomeScreen(),
  Routes.simulation: (_) => const SimulationScreen()
};

const initialRoute = Routes.home;