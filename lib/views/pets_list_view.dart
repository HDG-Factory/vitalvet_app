import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/constants.dart';
import 'package:vitalvet_app/widgets/templates/search_bar.dart';

import '../utils/globals.dart';
import '../widgets/pets_list.dart';

class PetsListView extends StatelessWidget {
  const PetsListView({Key? key}) : super(key: key);

  void _initState(context) {
    Globals.saveBtnVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
          child: SizedBox(
            height: 500,
            child: PetsList(),
          ),
        ),
      ],
    );
  }
}
