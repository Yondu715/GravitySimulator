import 'package:flutter/material.dart';
import 'package:gravity_simulator/infrastructure/presentation/screens/simulation/simulation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onSubmit(String value) {
    int val = int.parse(value);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimulationPage(particleNum: val))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gravity Simulator'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gravity Simulator',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250,
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Введите число точек",
                ),
                onSubmitted: onSubmit,
              ),
            )
          ],
        )));
  }
}
