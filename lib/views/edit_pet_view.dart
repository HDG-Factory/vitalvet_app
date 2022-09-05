import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/globals.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'package:vitalvet_app/widgets/custom_text_field.dart';

import '../constants/constants.dart';
import '../widgets/custom_date_picker.dart';

class EditPetView extends StatelessWidget {
  final fieldsControllers = List.generate(6, (_) => TextEditingController());

  EditPetView({Key? key}) : super(key: key);

  void _initState(context) {
    Globals.saveBtnVisible = true;
    Globals.onPressed = () {
      print('Save');
    };
    forceRerender(context);
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Container(
                height: 93.5.hb - 200,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.9, 1],
                          colors: [
                            Colors.blue.withOpacity(0.8),
                            Colors.blue.withOpacity(0.68),
                            Colors.blue.withOpacity(0),
                          ],
                        ),
                      ),
                      width: 30.wb,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/shiba_inu.png',
                              ),
                              radius: 120,
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              fieldController: fieldsControllers[0],
                              labelText: 'Nombre',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                              fieldController: fieldsControllers[1],
                              labelText: 'Dueño',
                            ),
                            const SizedBox(height: 20),
                            CustomDatePicker(
                              labelText: 'Fecha de nacimiento',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor seleccione una fecha de nacimiento';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              fieldController: fieldsControllers[3],
                              labelText: 'Peso (kg)',
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              fieldController: fieldsControllers[4],
                              labelText: 'Especie',
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              fieldController: fieldsControllers[5],
                              labelText: 'Raza',
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Ver imágenes'),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    '$HOME_ROUTE/$PETS_LIST_VIEW_ROUTE/$PET_MEDICAL_HISTORY_VIEW_ROUTE');
                              },
                              child: const Text('Ver historial clínico'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 150.0, vertical: 100.0),
              child: SizedBox(
                height: 94.78.hb - 200,
                child: GridView.count(
                    childAspectRatio: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 4,
                    children: [
                      ...List.generate(
                        12,
                        (index) => Container(
                          color: Colors.grey.withOpacity(0.1),
                          child: Image.asset('assets/shiba_inu.png'),
                        ),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        child: TextButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]
                    // [
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Image.asset('assets/shiba_inu.png'),
                    //   ),
                    //   Container(
                    //     color: Colors.green,
                    //     child: Center(
                    //       child: TextButton(
                    //         onPressed: () {},
                    //         child: Icon(
                    //           Icons.add,
                    //           size: 80,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
