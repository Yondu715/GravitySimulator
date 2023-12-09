import 'package:flutter/material.dart';
import 'package:gravity_simulator/entities/session/model/session_service.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final SessionService _sessionService = SessionService();
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    bool success = await _sessionService.checkAuthFx();
    if (success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
