import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/owners/delete_owner/delete_owner_bloc.dart';
import 'package:vitalvet_app/blocs/pets/edit_pet/edit_pet_bloc.dart';
import 'package:vitalvet_app/blocs/pets/get_pet/get_pet_bloc.dart';
import 'package:vitalvet_app/blocs/title_bar/title_bar_bloc.dart';
import 'package:vitalvet_app/ui/views/pet_views/pet_view.dart';
import 'package:vitalvet_app/utils/constants.dart';
import 'package:vitalvet_app/utils/globals.dart';
import 'package:vitalvet_app/utils/screen_size.dart';

class EditPetView extends StatelessWidget {
  final List<TextEditingController> fieldsControllers = List.generate(6, (_) => TextEditingController());
  final EditPetBloc editPetBloc;
  final DeleteOwnerBloc deleteOwnerBloc;
  final int petId;

  bool oneTime = false;

  EditPetView({Key? key, required this.editPetBloc, required this.deleteOwnerBloc, required this.petId}) : super(key: key);

  void _initState(BuildContext context) {
    BlocProvider.of<GetPetBloc>(context).add(LoadPetEvent(id: petId));
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return BlocBuilder<EditPetBloc, EditPetState>(
      builder: (context, state) {
        return BlocBuilder<GetPetBloc, GetPetState>(
          builder: (context, state) {
            if (state is PetLoaded) {
              DateTime birthday = DateTime.parse(state.pet['birthday']);
              final formattedBirthday = '${birthday.day} / ${birthday.month} / ${birthday.year}';

              int petId = state.pet['id'];
              int ownerId = state.pet['owner']['id'];
              String ownerName = '${state.pet['owner']['name']} ${state.pet['owner']['lastname']}';

              fieldsControllers[0].text = state.pet['name'];
              fieldsControllers[1].text = ownerName;
              fieldsControllers[2].text = formattedBirthday;
              fieldsControllers[3].text = state.pet['weight'].toString();
              fieldsControllers[4].text = state.pet['subspecies']['species']['name'];
              fieldsControllers[5].text = state.pet['subspecies']['name'];

              return PetView(
                fieldsCtrlrs: fieldsControllers,
                editPetBloc: editPetBloc,
                deleteOwnerBloc: deleteOwnerBloc,
                ownerFieldStartAsReferenced: true,
                editedPetId: petId,
                returnedOwnerId: ownerId,
                actions: [
                  ElevatedButton(
                    child: const Text('Ver imágenes'),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Ver historial clínico'),
                    onPressed: () {
                      Navigator.pushNamed(context, '$HOME_ROUTE/$PET_MEDICAL_HISTORY_VIEW_ROUTE');
                    },
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
