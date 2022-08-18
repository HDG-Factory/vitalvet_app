import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: _body(context),
    );
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
