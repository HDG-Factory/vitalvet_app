import 'package:flutter/material.dart';
import 'package:vitalvet_app/router/app_router.dart';
import 'package:vitalvet_app/ui/pages/medical_atttentions/register_medical_attentions.dart';
import 'package:vitalvet_app/ui/pages/patient_page.dart';
import 'package:vitalvet_app/ui/pages/profiles/register_profile.dart';

void main() {
  runApp(VitalvetApp());
}

class VitalvetApp extends StatefulWidget {
  final AppRouter router = AppRouter();

  VitalvetApp({super.key});

  @override
  State<VitalvetApp> createState() => _VitalvetAppState();
}

class _VitalvetAppState extends State<VitalvetApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: widget.router.generateRoute,
      title: 'Vitalvet',
    );
  }
}







// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'George & Doc Chocolate, You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientPage()));
//               },
//               child: const Text('Patient Page'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterMedicalAttention()));
//               },
//               child: const Text('Medical Attention Page'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterProfile()));
//               },
//               child: const Text('Registro de Perfil'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         //onPressed: _incrementCounter,
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientPage()));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
