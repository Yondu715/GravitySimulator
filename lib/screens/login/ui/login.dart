import 'package:flutter/material.dart';
import 'package:gravity_simulator/features/session/login_form/ui/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gravity Simulator'),
        ),
        body: const LoginForm());
  }
}
