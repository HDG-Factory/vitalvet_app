import 'package:flutter/material.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_title_bar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Iniciar sesión'),
          const Text('¿No tienes cuenta? Regístrate'),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Correo',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
          ),
          _loginBtn(context),
        ],
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Iniciar Sesión'),
      onPressed: () {
        // Navigator.pushNamed(context, '/home');
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
    );
  }
}
