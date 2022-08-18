import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_loginBtn(context)],
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Iniciar Sesión'),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
