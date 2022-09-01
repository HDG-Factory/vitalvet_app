import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/config/config.dart';
import 'package:vitalvet_app/router/app_router.dart';
import 'package:vitalvet_app/services/api.dart';
import 'blocs/simple_bloc_observer.dart';

void main() {
  if (Config.isInDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  runApp(VitalVetApp(
    router: AppRouter(),
  ));

  // WidgetsBinding.instance.addObserver(ChangeWindowSizeObserver());

  doWhenWindowReady(() {
    const minSize = Size(400, 519);
    appWindow.minSize = minSize;
    appWindow.title = 'Vitalvet';
    appWindow.show();
  });

  Api.initializeApi();
}

class VitalVetApp extends StatefulWidget {
  final AppRouter router;

  const VitalVetApp({super.key, required this.router});

  @override
  State<VitalVetApp> createState() => _VitalVetAppState();
}

class _VitalVetAppState extends State<VitalVetApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.router.generateRoute,
      title: 'VitalVet',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      darkTheme: ThemeData.light(),
    );
  }
}
