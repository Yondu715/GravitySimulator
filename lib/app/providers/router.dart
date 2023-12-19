import 'package:gravity_simulator/screens/home/ui/home.dart';
import 'package:gravity_simulator/screens/auth/ui/login.dart';
import 'package:gravity_simulator/screens/simulation/ui/simulation.dart';
import 'package:gravity_simulator/screens/start/ui/start.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';

final routerView = {
  Routes.root: (_) => const StartScreen(),
  Routes.home: (_) => const HomeScreen(),
  Routes.simulation: (_) => const SimulationScreen(),
  Routes.login: (_) => const LoginScreen()
};

const initialRoute = Routes.root;