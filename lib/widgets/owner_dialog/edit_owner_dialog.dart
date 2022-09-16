import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/owners/edit_owner/edit_owner_bloc.dart';
import 'package:vitalvet_app/widgets/owner_dialog/owner_dialog.dart';

import '../../blocs/owners/add_owner/add_owner_bloc.dart';
import '../../blocs/owners/get_owner/get_owner_bloc.dart';
import '../../utils/screen_size.dart';

class EditOwnerDialog extends StatelessWidget {
  final fieldsControllers = List.generate(7, (_) => TextEditingController());
  final EditOwnerBloc editOwnerBloc;
  String? ownerCompleteName;
  final int ownerId;

  EditOwnerDialog(
      {Key? key, required this.ownerId, required this.editOwnerBloc})
      : super(key: key);

  void _initState(BuildContext context) {
    BlocProvider.of<GetOwnerBloc>(context).add(LoadOwnerEvent(id: ownerId));
    forceRerender(context);
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return BlocListener<EditOwnerBloc, EditOwnerState>(
      listener: (context, state) {
        if (state is OwnerEdited) {
          Navigator.pop(context, ownerCompleteName);
        }
      },
      child: BlocBuilder<EditOwnerBloc, EditOwnerState>(
        builder: (context, state) {
          bool isEditingOwner = state is EditingOwner;
          return BlocBuilder<GetOwnerBloc, GetOwnerState>(
            builder: (context, state) {
              if (state is OwnerLoaded) {
                DateTime birthday = DateTime.parse(state.owner['birthday']);
                final formattedBirthday =
                    '${birthday.day} / ${birthday.month} / ${birthday.year}';

                fieldsControllers[0].text = state.owner['name'];
                fieldsControllers[1].text = state.owner['lastname'];
                fieldsControllers[2].text = formattedBirthday;
                fieldsControllers[3].text = state.owner['direction'];
                fieldsControllers[4].text = state.owner['phone'];
                fieldsControllers[5].text = state.owner['dni'];
                fieldsControllers[6].text = state.owner['email'];

                return OwnerDialog(
                  fieldsCtrlrs: fieldsControllers,
                  title: isEditingOwner ? 'Editando tutor...' : 'Editar tutor',
                  isDoingOwnerAction: isEditingOwner,
                  editOwnerAction: editOwnerBloc.add,
                  editedOwnerId: ownerId,
                  getOwnerCompleteName: (name) {
                    ownerCompleteName = name;
                  },
                );
              } else {
                return AlertDialog(
                  title: const Text('Editar tutor'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
