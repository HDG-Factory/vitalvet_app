import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/components/responsive_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'Vitalvet',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'George & Doc Chocolate, You have pushed the button this many times:',
              ),
              const Text(
                'Creo que jodí tus estilos George :D',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/patient_page');
                },
                child: const Text('Patient Page'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_medical_attention');
                },
                child: const Text('Medical Attention Page'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_profile');
                },
                child: const Text('Registro de Perfil'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: _incrementCounter,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('GAYYYY'),
              ),
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
