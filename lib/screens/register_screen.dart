import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _registerBtn(context),
        ],
      ),
    );
  }

  Widget _registerBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Registrarse'),
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
    );
  }
}
