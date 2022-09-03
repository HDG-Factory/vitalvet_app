import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/blocs/pets/pets_list/pets_list_bloc.dart';
import 'package:vitalvet_app/constants/constants.dart';
import 'package:vitalvet_app/widgets/search_bar.dart';

import '../widgets/pets_list.dart';

class PetsListView extends StatelessWidget {
  const PetsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Mascotas'),
            SizedBox(
              width: 300,
              child: SearchBar(
                withWidget: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '$HOME_ROUTE/$PETS_LIST_VIEW_ROUTE/$ADD_PET_VIEW_ROUTE');
                  },
                  child: const Text('Agregar'),
                ),
              ),
            ),
          ],
        ),
        const Expanded(child: PetsList()),
      ],
    );
  }
}
