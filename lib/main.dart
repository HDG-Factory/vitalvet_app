import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalvet_app/config/config.dart';
import 'package:vitalvet_app/router/app_router.dart';
// import 'package:vitalvet_app/widgets/custom_title_bar.dart';

import 'blocs/simple_bloc_observer.dart';

void main() {
  if (Config.isInDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  runApp(VitalVetApp(
    router: AppRouter(),
  ));

  doWhenWindowReady(() {
    const minSize = Size(400, 519);
    appWindow.minSize = minSize;
    appWindow.title = 'Vitalvet';
    appWindow.show();
  });
}

class VitalVetApp extends StatelessWidget {
  final AppRouter router;

  const VitalVetApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
        title: 'VitalVet',
        theme: ThemeData());
  }
}
