import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vitalvet_app/config/config.dart';
import 'package:vitalvet_app/router/app_router.dart';

import 'blocs/simple_bloc_observer.dart';

void main() {
  if (Config.isInDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  runApp(VitalVetApp(
    router: AppRouter(),
  ));

  // doWhenWindowReady(() {
  //   const initialSize = Size(600, 450);
  //   appWindow.minSize = initialSize;
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.show();
  // });
}

class VitalVetApp extends StatelessWidget {
  final AppRouter router;

  const VitalVetApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      // home: Scaffold(
      //   body: WindowBorder(
      //     width: 1,
      //     color: const Color(0xFF805306),
      //     child: Column(children: <Widget>[
      //       WindowTitleBarBox(
      //         child: Row(children: [
      //           Expanded(child: MoveWindow()),
      //           const WindowButtons(),
      //         ]),
      //       ),
      //       const Text('VitalVetApp'),
      //     ]),
      //   ),
      // ),
    );
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        appWindow.isMaximized
            ? RestoreWindowButton(onPressed: maximizeOrRestore)
            : MaximizeWindowButton(onPressed: maximizeOrRestore),
        CloseWindowButton()
      ],
    );
  }
}
