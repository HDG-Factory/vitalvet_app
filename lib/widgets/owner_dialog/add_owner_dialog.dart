import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/owners/add_owner/add_owner_bloc.dart';
import '../../utils/screen_size.dart';
import 'owner_dialog.dart';

class AddOwnerDialog extends StatelessWidget {
  final AddOwnerBloc addOwnerBloc;
  String? ownerCompleteName;

  AddOwnerDialog({Key? key, required this.addOwnerBloc}) : super(key: key);

  void _initState(BuildContext context) {
    forceRerender(context);
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return BlocListener<AddOwnerBloc, AddOwnerState>(
      listener: (context, state) {
        if (state is OwnerAdded) {
          Navigator.pop(context, ownerCompleteName);
        }
      },
      child: BlocBuilder<AddOwnerBloc, AddOwnerState>(
        builder: (context, state) {
          bool isAddingOwner = state is AddingOwner;

          return OwnerDialog(
            title: isAddingOwner ? 'Agregando tutor...' : 'Nuevo tutor',
            isDoingOwnerAction: isAddingOwner,
            addOwnerAction: addOwnerBloc.add,
            getOwnerCompleteName: (name) {
              ownerCompleteName = name;
            },
          );
        },
      ),
    );
  }
}
