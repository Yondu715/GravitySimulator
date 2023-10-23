import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/particle/changeCount/change_count.dart';
import '../../entities/particle/model/store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ParticleModel>(
        create: (_) => ParticleModel(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Gravity Simulator'),
            ),
            body: const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gravity Simulator',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                ChangeCount()
              ])
            )
        )
      );
  }
}
