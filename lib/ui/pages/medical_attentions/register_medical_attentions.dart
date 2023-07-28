import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/components/responsive_page.dart';
import 'package:vitalvet_app/utils/responsive_utils.dart';

class RegisterMedicalAttention extends StatelessWidget {
  const RegisterMedicalAttention({super.key});

  void _initState(BuildContext context) => forceRerender(context);

  @override
  Widget build(BuildContext context) {
    _initState(context);

    return ResponsivePage(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Nueva Atención Médica"),
          ),
          body: Row(
            children: [
              const IntrinsicHeight(
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
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: IntrinsicHeight(
                    child: Card(
                      child: Container(
                        width: 50.wb,
                        child: const Column(
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
              ),
            ],
          )),
    );
  }
}
