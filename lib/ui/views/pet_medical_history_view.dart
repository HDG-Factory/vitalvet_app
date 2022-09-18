import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'package:vitalvet_app/ui/widgets/pet_medical_attentions_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/title_bar/title_bar_bloc.dart';
import 'package:vitalvet_app/utils/globals.dart';

class PetMedicalHistoryView extends StatelessWidget {
  const PetMedicalHistoryView({Key? key}) : super(key: key);

  void _initState(context) {
    // Globals.saveBtnVisible = false;
    BlocProvider.of<TitleBarBloc>(context).add(const ChangeTitleBarEvent(onPressed: null));
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
            child: const PetMedicalAttentionsList(),
          ),
        ],
      ),
    );
  }
}
