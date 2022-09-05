import 'package:flutter/material.dart';

import '../utils/globals.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  void _initState(context) {
    Globals.saveBtnVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
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
