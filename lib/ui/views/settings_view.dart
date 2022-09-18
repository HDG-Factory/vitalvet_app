import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/title_bar/title_bar_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  void _initState(context) {
    // Globals.saveBtnVisible = false;
    BlocProvider.of<TitleBarBloc>(context).add(const ChangeTitleBarEvent(onPressed: null));
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
