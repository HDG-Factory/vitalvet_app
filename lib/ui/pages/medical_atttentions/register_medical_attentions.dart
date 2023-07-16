import 'package:flutter/material.dart';

class RegisterMedicalAttention extends StatelessWidget {
  const RegisterMedicalAttention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nueva Atención Médica"),
        ),
        body: const Row(
          children: [
            IntrinsicHeight(
              child: Card(
                child: Column(
                  children: [
                    Text("Datos del Paciente"),
                    Text("Nombre"),
                    Text("Especie"),
                    Text("Raza"),
                    Text("Sexo"),
                    Text("Edad"),
                    Text("Peso"),
                    Text("Color"),
                    Text("Señas Particulares"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: IntrinsicHeight(
                  child: Card(
                    child: Column(
                      children: [
                        Text("Datos de la Atención Médica"),
                        Text("Fecha"),
                        Text("Motivo"),
                        Text("Diagnóstico"),
                        Text("Tratamiento"),
                        Text("Observaciones"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
