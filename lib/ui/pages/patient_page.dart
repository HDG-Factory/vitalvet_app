import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const Text(
            "Hola a todo esta es la vista del Paciente",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(            
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Atrás"),
          ),
          Container()
        ],
      ),
    );
  }
}