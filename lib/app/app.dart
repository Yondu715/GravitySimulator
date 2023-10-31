import 'package:flutter/material.dart';
import 'package:gravity_simulator/app/providers/router.dart';
import 'package:gravity_simulator/app/providers/store.dart';
import 'package:gravity_simulator/shared/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    setPathUrlStrategy();
    return StoreProvider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gravity Simulation',
      theme: AppTheme.getTheme(),
      routes: routerView,
      initialRoute: initialRoute,
    ));
  }
}
