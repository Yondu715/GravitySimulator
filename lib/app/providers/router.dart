import 'package:gravity_simulator/screens/home/ui/home.dart';
import 'package:gravity_simulator/screens/login/ui/login.dart';
import 'package:gravity_simulator/screens/simulation/ui/simulation.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';

final routerView = {
  Routes.home: (_) => const HomeScreen(),
  Routes.simulation: (_) => const SimulationScreen(),
  Routes.login: (_) => const LoginScreen()
};

const initialRoute = Routes.login;