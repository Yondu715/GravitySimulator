import 'package:flutter/material.dart';
import 'package:gravity_simulator/features/session/login_form/model/login_form_model.dart';
import 'package:gravity_simulator/shared/routing/routes.dart';
import 'package:gravity_simulator/shared/ui/textInput/text_input.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void onSubmited(BuildContext context) {
    LoginFormModel loginFormModel = context.read<LoginFormModel>();
    loginFormModel.auth().then((success) {
      if (success) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginFormModel loginFormModel = context.read<LoginFormModel>();
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        'Авторизация',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20.0),
      TextInput(
          placeHolder: "Введите логин",
          width: 250,
          onChanged: (value) => loginFormModel.setLogin(value)),
      const SizedBox(height: 20.0),
      TextInput(
          placeHolder: "Введите пароль",
          type: TextInputType.visiblePassword,
          width: 250,
          onChanged: (value) => loginFormModel.setPassword(value)),
      const SizedBox(height: 20.0),
      TextButton(
          onPressed: () => onSubmited(context),
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue, fixedSize: const Size(100, 30)),
          child: const Text(
            'Войти',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ))
    ]));
  }
}
