import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/widgets/patient_card.dart';
import 'package:vitalvet_app/ui/widgets/patient_form.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva Mascota"),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 210, vertical: 110),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,        
          children: [
            Expanded(          
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all()
                // ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: PatientCard(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all()
                // ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: PatientForm(),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

//  ListView(
        
//         children: [
//           const Text(
//             "Hola a todo esta es la vista del Paciente",
//             style: TextStyle(fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           ElevatedButton(            
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             child: const Text("Atrás"),
//           ),
//           Container()
//         ],
//       ), 