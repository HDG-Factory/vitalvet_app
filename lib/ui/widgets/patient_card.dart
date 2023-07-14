import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/widgets/vitalvet_input.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/patient_profile.jpg'),
          radius: 150,
          ),
        VitalvetInput()
      ],
    );
  }
}