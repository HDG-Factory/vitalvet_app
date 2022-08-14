import 'package:flutter/material.dart';
import 'package:vitalvet_app/router/app_router.dart';

void main() {
  runApp(VitalVetApp(
    router: AppRouter(),
  ));
}

class VitalVetApp extends StatelessWidget {
  final AppRouter router;

  const VitalVetApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
