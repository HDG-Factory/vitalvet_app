import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/widgets/date_input.dart';
import 'package:vitalvet_app/ui/widgets/dropdown_input.dart';
import 'package:vitalvet_app/ui/widgets/vitalvet_input.dart';


class PatientForm extends StatelessWidget {
  const PatientForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> species = ['Perro', 'Gato', 'Loro', 'Conejo', 'Pez'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Tutor'
            ),
          ),
        ),
        DateInput(),
        VitalvetInput(label: 'Peso', icon: Icons.scale),
        DropdownInput(label: 'Especie', items: species),
        DropdownInput(label: 'Raza', items: species,)        
      ],
    );
  }
}