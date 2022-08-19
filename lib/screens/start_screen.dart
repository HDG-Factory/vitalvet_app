import 'package:flutter/material.dart';
import 'package:vitalvet_app/widgets/custom_screen.dart';
import 'package:vitalvet_app/widgets/custom_title_bar.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: const CustomTitleBar(title: 'Vitalvet'),
    //   body: _body(context),
    // );
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginBtn(context),
          const SizedBox(height: 16),
          _registerBtn(context),
        ],
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Iniciar Sesión'),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
    );
  }

  Widget _registerBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Registrarse'),
      onPressed: () {
        Navigator.pushNamed(context, '/register');
      },
    );
  }
}
