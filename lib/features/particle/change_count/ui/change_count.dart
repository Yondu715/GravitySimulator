import 'package:flutter/material.dart';
import 'package:gravity_simulator/features/particle/change_count/model/change_count_model.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';
import 'package:provider/provider.dart';

class ChangeCount extends StatefulWidget {
  const ChangeCount({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeCountState();
}

class _ChangeCountState extends State<ChangeCount> {
  final TextEditingController _textEditingController = TextEditingController();

  void onSubmited(BuildContext context, String text) {
    ChangeCountModel changeCountModel = context.read<ChangeCountModel>();
    changeCountModel.setCount(text);
    Navigator.pushNamed(context, Routes.simulation);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ChangeCountModel changeCountModel = context.read<ChangeCountModel>();
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            onChanged: (value) => {changeCountModel.setCount(value)},
          )),
      const SizedBox(
        height: 20.0,
      ),
      TextButton(
          onPressed: () => onSubmited(context, _textEditingController.text),
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            'Начать симуляцию',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ))
    ]);
  }
}
