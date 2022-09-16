import 'package:flutter/material.dart';
import 'package:vitalvet_app/blocs/owners/edit_owner/edit_owner_bloc.dart';
import 'package:vitalvet_app/widgets/templates/custom_date_picker.dart';
import 'package:vitalvet_app/widgets/templates/custom_text_field.dart';

import '../../blocs/owners/add_owner/add_owner_bloc.dart';
import '../../utils/screen_size.dart';
import '../../utils/validators.dart';

class OwnerDialog extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final List<TextEditingController>? fieldsCtrlrs;
  late final List<TextEditingController> fieldsControllers;
  final String title;
  final bool isDoingOwnerAction;
  final int? editedOwnerId;
  final void Function(String) getOwnerCompleteName;
  final void Function(AddOwnerEvent)? addOwnerAction;
  final void Function(EditOwnerEvent)? editOwnerAction;

  OwnerDialog({
    Key? key,
    this.fieldsCtrlrs,
    required this.title,
    required this.isDoingOwnerAction,
    this.addOwnerAction,
    this.editOwnerAction,
    required this.getOwnerCompleteName,
    this.editedOwnerId,
  }) : super(key: key);

  void _initState(BuildContext context) {
    if (fieldsCtrlrs == null) {
      fieldsControllers = List.generate(7, (_) => TextEditingController());
    } else {
      fieldsControllers = fieldsCtrlrs!;
    }
    forceRerender(context);
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return AlertDialog(
      title: Text(title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: SizedBox(
        width: (isLargeOrMoreScreen)
            ? 650
            : (isMediumOrMoreScreen)
                ? 500
                : 300,
        child: SingleChildScrollView(
          child: isDoingOwnerAction
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if (!isSmallScreen)
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                fieldController: fieldsControllers[0],
                                labelText: 'Nombres',
                                validator: nameValidator,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomTextField(
                                fieldController: fieldsControllers[1],
                                labelText: 'Apellidos',
                                validator: lastnameValidator,
                              ),
                            )
                          ],
                        )
                      else
                        Column(
                          children: [
                            CustomTextField(
                              fieldController: fieldsControllers[0],
                              labelText: 'Nombres',
                              validator: nameValidator,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              fieldController: fieldsControllers[1],
                              labelText: 'Apellidos',
                              validator: lastnameValidator,
                            ),
                          ],
                        ),
                      const SizedBox(height: 15),
                      CustomDatePicker(
                        fieldController: fieldsControllers[2],
                        labelText: 'Fecha de nacimiento',
                        validator: birthdayValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        fieldController: fieldsControllers[3],
                        labelText: 'Dirección',
                        validator: directionValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        fieldController: fieldsControllers[4],
                        labelText: 'Número de celular',
                        onlyNumbers: true,
                        validator: phoneValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        fieldController: fieldsControllers[5],
                        labelText: 'DNI',
                        onlyNumbers: true,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        fieldController: fieldsControllers[6],
                        labelText: 'Email',
                        validator: (value) => emailValidator(value, false),
                      ),
                    ],
                  ),
                ),
        ),
      ),
      actions: [
        if (!isDoingOwnerAction)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
        if (!isDoingOwnerAction)
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (addOwnerAction != null) {
                  addOwnerAction!(
                    AddNewOwnerEvent(
                      name: fieldsControllers[0].text,
                      lastname: fieldsControllers[1].text,
                      birthday: fieldsControllers[2].text,
                      direction: fieldsControllers[3].text,
                      phone: fieldsControllers[4].text,
                      dni: fieldsControllers[5].text,
                      email: fieldsControllers[6].text,
                    ),
                  );
                  getOwnerCompleteName(
                      '${fieldsControllers[0].text} ${fieldsControllers[1].text}');
                } else if (editOwnerAction != null) {
                  editOwnerAction!(
                    EditCreatedOwnerEvent(
                      id: editedOwnerId,
                      name: fieldsControllers[0].text,
                      lastname: fieldsControllers[1].text,
                      birthday: fieldsControllers[2].text,
                      direction: fieldsControllers[3].text,
                      phone: fieldsControllers[4].text,
                      dni: fieldsControllers[5].text,
                      email: fieldsControllers[6].text,
                    ),
                  );
                  getOwnerCompleteName(
                      '${fieldsControllers[0].text} ${fieldsControllers[1].text}');
                }
              }
            },
            child: const Text('Aceptar'),
          ),
      ],
    );
  }
}
