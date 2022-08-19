import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Settings'),
          _closeSesionBtn(context),
        ],
      ),
    );
  }

  Widget _closeSesionBtn(BuildContext context) {
    return ElevatedButton(
      child: const Text('Cerrar Sesión'),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
    );
  }
}
