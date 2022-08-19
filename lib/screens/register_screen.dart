import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_title_bar.dart';

class RegisterScreen extends StatelessWidget {
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
          const Text('¿Ya tienes cuenta? Iniciar sesión'),
          Row(
            children: const [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombres',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Apellidos',
                  ),
                ),
              ),
            ],
          ),
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
          _registerBtn(context),
        ],
      ),
    );
  }

  Widget _registerBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Registrarse'),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
    );
  }
}
