import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/widgets/list_viewer.dart';

import '../blocs/pets/pets_list/pets_list_bloc.dart';
import '../constants/constants.dart';

class PetMedicalAttentionsList extends StatelessWidget {
  const PetMedicalAttentionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PetsListBloc>(context).add(LoadPetsListEvent());

    return BlocBuilder<PetsListBloc, PetsListState>(
      builder: (context, state) {
        if (state is! PetsListLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<dynamic> pets = state.pets;

        return ListViewer(
          items: pets,
          onItemTap: () {
            Navigator.pushNamed(context,
                '$HOME_ROUTE/$PETS_LIST_VIEW_ROUTE/$PET_MEDICAL_ATTENTION_VIEW_ROUTE');
          },
          tileTemplate: (item, onTap) {
            return ListTile(
              hoverColor: Colors.blue,
              leading: const Icon(Icons.pets),
              title: Text(item['subspeciesId'].toString()),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onTap,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
          },
          header: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            tileColor: Colors.blue.withOpacity(0.5),
            leading: const SizedBox(),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 22.0),
                  child: Text(
                    "N° cita",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "Fecha de la cita",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "Última fecha de visualización",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            trailing: const SizedBox(),
          ),
        );
      },
    );
  }
}
