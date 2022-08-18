import 'package:flutter/material.dart';

import '../widgets/pets_list.dart';

class PetsView extends StatelessWidget {
  const PetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Mascotas'),
        Expanded(child: PetsList()),
      ],
    );
  }
}
