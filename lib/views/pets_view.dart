import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/blocs/pets/pets_list/pets_list_bloc.dart';
import 'package:vitalvet_app/widgets/search_bar.dart';

import '../widgets/pets_list.dart';

class PetsView extends StatelessWidget {
  const PetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mascotas'),
              const SizedBox(
                width: 300,
                child: SearchBar(),
              ),
            ],
          ),
        ),
        const Expanded(child: PetsList()),
      ],
    );
  }
}
