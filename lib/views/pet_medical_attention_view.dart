import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'package:vitalvet_app/widgets/custom_date_picker.dart';
import 'package:vitalvet_app/widgets/custom_text_field.dart';
import 'package:vitalvet_app/widgets/pet_medical_attentions_list.dart';

import '../utils/globals.dart';

class PetMedicalAttentionView extends StatefulWidget {
  PetMedicalAttentionView({Key? key}) : super(key: key);

  @override
  State<PetMedicalAttentionView> createState() =>
      _PetMedicalAttentionViewState();
}

class _PetMedicalAttentionViewState extends State<PetMedicalAttentionView> {
  final fieldsControllers = List.generate(6, (_) => TextEditingController());

  void _initState(context) {
    Globals.saveBtnVisible = true;
    forceRerender(context);
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              border: Border.all(
                color: Colors.blue.withOpacity(0.6),
                width: 3.5,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            width: 27.wb,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/shiba_inu.png',
                        ),
                        radius: 45.0,
                      ),
                      Expanded(
                        child: Text('Pepito',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tutor: Manuel Quispe',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Edad: 12 años y 3 meses',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Fecha de nacimiento: 17 / 03 / 2010  ',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Peso: 40 kg',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Especie: Perro',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Raza: Shiba Inu',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(height: 10),
                      Text('Total de citas: 7',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 45.wb,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: ExpansionTile(
                      title: const Text('Datos de la cita'),
                      collapsedBackgroundColor: Colors.blue,
                      backgroundColor: Colors.blue,
                      textColor: Colors.black54,
                      iconColor: Colors.black54,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      fieldController: fieldsControllers[0],
                                      labelText: 'Peso (kg)',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomDatePicker(
                                      fieldController: fieldsControllers[1],
                                      labelText: 'Fecha de la cita',
                                    ),
                                  ),
                                ],
                              ),
                              CustomTextField(
                                fieldController: fieldsControllers[2],
                                labelText: 'Descripción',
                                multiLine: true,
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: Colors.black54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text('Siguiente'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: ExpansionTile(
                      title: const Text('Observaciones'),
                      collapsedBackgroundColor: Colors.blue,
                      backgroundColor: Colors.blue,
                      textColor: Colors.black54,
                      iconColor: Colors.black54,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                fieldController: fieldsControllers[3],
                                labelText: 'Observaciones',
                                multiLine: true,
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: Colors.black54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text('Siguiente'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: ExpansionTile(
                      title: const Text('Receta'),
                      collapsedBackgroundColor: Colors.blue,
                      backgroundColor: Colors.blue,
                      textColor: Colors.black54,
                      iconColor: Colors.black54,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      fieldController: fieldsControllers[4],
                                      labelText:
                                          'Nombre de medicina o tratamiento',
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                ],
                              ),
                              CustomTextField(
                                fieldController: fieldsControllers[5],
                                labelText: 'Detalles',
                                multiLine: true,
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: Colors.black54,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text('Finalizar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
