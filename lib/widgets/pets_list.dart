import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/pets/pets_list/pets_list_bloc.dart';
import '../constants/constants.dart';
import 'list_viewer.dart';

class PetsList extends StatelessWidget {
  const PetsList({Key? key}) : super(key: key);

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
                '$HOME_ROUTE/$PETS_LIST_VIEW_ROUTE/$EDIT_PET_VIEW_ROUTE');
          },
          tileTemplate: (item, onTap) {
            return ListTile(
              hoverColor: Colors.blue,
              leading: const Icon(Icons.pets),
              title: Row(
                children: [
                  Text(
                    item['name'],
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      item['subspeciesId'].toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      "ㅤㅤㅤㅤㅤㅤㅤ-ㅤㅤㅤㅤㅤㅤㅤㅤ",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      "ㅤㅤ-ㅤㅤ",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
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
                Text(
                  "Mascotas",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "Especie",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "Última fecha de visualización",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    "N° citas",
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
