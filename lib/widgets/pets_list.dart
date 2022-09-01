import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pets/pets_list/pets_list_bloc.dart';

class PetsList extends StatelessWidget {
  const PetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PetsListBloc>(context).add(LoadPetsListEvent());

    return Scrollbar(
      child: BlocBuilder<PetsListBloc, PetsListState>(
        builder: (context, state) {
          if (!(state is PetsListLoaded)) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<dynamic> pets = state.pets;
          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (_, i) {
              return ListTile(
                hoverColor: Colors.red,
                leading: Icon(Icons.pets),
                title: Text(pets[i]['name']),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
