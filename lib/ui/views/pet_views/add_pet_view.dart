// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vitalvet_app/blocs/owners/delete_owner/delete_owner_bloc.dart';
// import 'package:vitalvet_app/blocs/owners/edit_owner/edit_owner_bloc.dart';
// import 'package:vitalvet_app/blocs/owners/get_owner/get_owner_bloc.dart';
// import 'package:vitalvet_app/blocs/species/species_list/species_list_bloc.dart';
// import 'package:vitalvet_app/utils/screen_size.dart';
// import 'package:vitalvet_app/utils/validators.dart';
// import 'package:vitalvet_app/ui/widgets/templates/custom_text_field.dart';
// import 'package:vitalvet_app/blocs/owners/add_owner/add_owner_bloc.dart';
// import 'package:vitalvet_app/blocs/owners/owners_list/owners_list_bloc.dart';
// import 'package:vitalvet_app/blocs/pets/add_pet/add_pet_bloc.dart';
// import 'package:vitalvet_app/utils/globals.dart';
// import 'package:vitalvet_app/ui/widgets/owner_dialogs/add_owner_dialog.dart';
// import 'package:vitalvet_app/ui/widgets/owner_dialogs/edit_owner_dialog.dart';
// import 'package:vitalvet_app/ui/widgets/templates/custom_date_picker.dart';
// import 'package:vitalvet_app/ui/widgets/templates/custom_text_field_with_suggestions.dart';

// class AddPetView extends StatefulWidget {
//   final AddPetBloc addPetBloc;
//   final DeleteOwnerBloc deleteOwnerBloc;

//   AddPetView({Key? key, required this.addPetBloc, required this.deleteOwnerBloc}) : super(key: key);

//   @override
//   State<AddPetView> createState() => _AddPetViewState(addPetBloc, deleteOwnerBloc);
// }

// class _AddPetViewState extends State<AddPetView> {
//   final ownerFieldWithSuggestionsKey = GlobalKey<CustomTextFieldWithSuggestionsState>();
//   final formKey = GlobalKey<FormState>();
//   final fieldsControllers = List.generate(6, (_) => TextEditingController());
//   final List<dynamic> owners = [];
//   final List<dynamic> species = [];
//   final List<dynamic> subspecies = [];
//   int? referencedOwnerId;
//   int? referencedSpeciesId;
//   int? referencedSubspeciesId;
//   final AddPetBloc addPetBloc;
//   final DeleteOwnerBloc deleteOwnerBloc;

//   _AddPetViewState(this.addPetBloc, this.deleteOwnerBloc);

//   void _initState(BuildContext context) {
//     BlocProvider.of<OwnersListBloc>(context).add(LoadOwnersListEvent());
//     BlocProvider.of<SpeciesListBloc>(context).add(LoadSpeciesListEvent());

//     Globals.saveBtnVisible = true;
//     Globals.onPressed = () {
//       if (formKey.currentState!.validate()) {
//         if (referencedOwnerId == null) return;

//         addPetBloc.add(
//           AddNewPetEvent(
//             name: fieldsControllers[0].text,
//             weight: fieldsControllers[3].text,
//             birthday: fieldsControllers[2].text,
//             dateOfDeath: null,
//             mainPicture: null,
//             subspeciesId: referencedSubspeciesId,
//             ownerId: referencedOwnerId,
//             speciesId: referencedSpeciesId,
//             newSpeciesName: fieldsControllers[4].text,
//             newSubspeciesName: fieldsControllers[5].text,
//           ),
//         );
//       }
//     };
//     forceRerender(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     _initState(context);
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<AddPetBloc, AddPetState>(
//           listener: (context, state) {
//             if (state is PetAdded) {
//               Navigator.pop(context);
//             }
//           },
//         ),
//         BlocListener<DeleteOwnerBloc, DeleteOwnerState>(
//           listener: (context, state) {
//             if (state is OwnerDeleted) {
//               BlocProvider.of<OwnersListBloc>(context).add(LoadOwnersListEvent());
//             }
//           },
//         ),
//       ],
//       child: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(100.0),
//                 child: Container(
//                   height: 93.5.hb - 200,
//                   decoration: BoxDecoration(
//                     color: Colors.blue.withOpacity(0.3),
//                     borderRadius: const BorderRadius.all(Radius.circular(18)),
//                   ),
//                   child: Form(
//                     key: formKey,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18),
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               stops: const [0, 0.9, 1],
//                               colors: [
//                                 Colors.blue.withOpacity(0.8),
//                                 Colors.blue.withOpacity(0.68),
//                                 Colors.blue.withOpacity(0),
//                               ],
//                             ),
//                           ),
//                           width: 30.wb,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 50.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const CircleAvatar(
//                                   backgroundImage: AssetImage(
//                                     'assets/shiba_inu.png',
//                                   ),
//                                   radius: 120,
//                                 ),
//                                 const SizedBox(height: 30),
//                                 CustomTextField(
//                                   fieldController: fieldsControllers[0],
//                                   labelText: 'Nombre',
//                                   validator: nameValidator,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 50.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 BlocBuilder<OwnersListBloc, OwnersListState>(
//                                   builder: (context, state) {
//                                     if (state is OwnersListLoaded) {
//                                       owners.clear();
//                                       owners.addAll(state.owners);
//                                     } else {}
//                                     return CustomTextFieldWithSuggestions(
//                                       key: ownerFieldWithSuggestionsKey,
//                                       fieldController: fieldsControllers[1],
//                                       labelText: 'Tutor',
//                                       suggestions: owners,
//                                       onSuggestionSelectedFillColor: Colors.purple.withOpacity(0.1),
//                                       onTextFieldChanged: (value) {
//                                         referencedOwnerId = null;
//                                       },
//                                       actions: [
//                                         ElevatedButton(
//                                           child: const Text('Agregar'),
//                                           onPressed: () async {
//                                             final ownerName = await showDialog(
//                                                 context: context,
//                                                 builder: (context) {
//                                                   final addOwnerBloc = AddOwnerBloc();
//                                                   return BlocProvider(
//                                                     create: (context) => addOwnerBloc,
//                                                     child: AddOwnerDialog(
//                                                       addOwnerBloc: addOwnerBloc,
//                                                     ),
//                                                   );
//                                                 });
//                                             if (ownerName == null || ownerName.isEmpty) {
//                                               return;
//                                             }
//                                             BlocProvider.of<OwnersListBloc>(context).add(LoadOwnersListEvent());
//                                             fieldsControllers[1].text = ownerName;
//                                             ownerFieldWithSuggestionsKey.currentState!.toggleSuggestionFillColor();
//                                           },
//                                         ),
//                                       ],
//                                       suggestionCallback: (pattern) {
//                                         List<dynamic> returnedList = [];
//                                         returnedList.addAll(owners.where((owners) =>
//                                             '${owners['name']} ${owners['lastname']}'.toLowerCase().trim().contains(pattern.toLowerCase().trim())));
//                                         return returnedList;
//                                       },
//                                       suggestionBuilder: (item) {
//                                         return ListTile(
//                                           title: Text('${item['name']} ${item['lastname']}'),
//                                           subtitle: Text('Celular: ${item['phone']}'),
//                                           trailing: SizedBox(
//                                             width: 80,
//                                             child: Row(
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () async {
//                                                     final ownerName = await showDialog(
//                                                         context: context,
//                                                         builder: (context) {
//                                                           final editOwnerBloc = EditOwnerBloc();
//                                                           return MultiBlocProvider(
//                                                             providers: [
//                                                               BlocProvider(
//                                                                 create: (context) => editOwnerBloc,
//                                                               ),
//                                                               BlocProvider(
//                                                                 create: (context) => GetOwnerBloc(),
//                                                               ),
//                                                             ],
//                                                             child: EditOwnerDialog(
//                                                               ownerId: item['id'],
//                                                               editOwnerBloc: editOwnerBloc,
//                                                             ),
//                                                           );
//                                                         });
//                                                     if (ownerName == null || ownerName.isEmpty) {
//                                                       return;
//                                                     }
//                                                     BlocProvider.of<OwnersListBloc>(context).add(LoadOwnersListEvent());
//                                                     if (referencedOwnerId == item['id']) {
//                                                       fieldsControllers[1].text = ownerName;
//                                                     }
//                                                   },
//                                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
//                                                   child: Container(
//                                                     width: 40,
//                                                     height: 40,
//                                                     decoration: const BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                     child: Icon(
//                                                       Icons.edit,
//                                                       size: 20,
//                                                       color: Colors.grey.shade600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () async {
//                                                     final deleted = await showDialog(
//                                                       context: context,
//                                                       builder: (context) => BlocProvider(
//                                                         create: (context) => deleteOwnerBloc,
//                                                         child: BlocListener<DeleteOwnerBloc, DeleteOwnerState>(
//                                                           listener: (context, state) {
//                                                             if (state is OwnerDeleted) {
//                                                               Navigator.pop(context, true);
//                                                             }
//                                                           },
//                                                           child: AlertDialog(
//                                                             title: const Text('Eliminar tutor'),
//                                                             content: SizedBox(
//                                                               width: 300,
//                                                               child: Text(
//                                                                   '¿Está seguro que desea eliminar al tutor(a) ${item['name']} ${item['lastname']}?'),
//                                                             ),
//                                                             actions: [
//                                                               TextButton(
//                                                                 onPressed: () => Navigator.pop(context, false),
//                                                                 child: const Text('Cancelar'),
//                                                               ),
//                                                               TextButton(
//                                                                 onPressed: () {
//                                                                   deleteOwnerBloc.add(DeleteCreatedOwnerEvent(id: item['id']));
//                                                                 },
//                                                                 child: const Text('Eliminar'),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );

//                                                     if (deleted == null || !deleted) {
//                                                       return;
//                                                     }

//                                                     BlocProvider.of<OwnersListBloc>(context).add(LoadOwnersListEvent());
//                                                   },
//                                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
//                                                   child: Container(
//                                                     width: 40,
//                                                     height: 40,
//                                                     decoration: const BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                     child: Icon(
//                                                       Icons.delete,
//                                                       size: 20,
//                                                       color: Colors.grey.shade600,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       onSuggestionSelected: (val) {
//                                         if (val is! Widget) {
//                                           fieldsControllers[1].text = '${val['name']} ${val['lastname']}';
//                                           referencedOwnerId = val['id'] as int;
//                                         }
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 const SizedBox(height: 20),
//                                 CustomDatePicker(
//                                   fieldController: fieldsControllers[2],
//                                   labelText: 'Fecha de nacimiento',
//                                   validator: birthdayValidator,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 CustomTextField(
//                                   fieldController: fieldsControllers[3],
//                                   labelText: 'Peso (kg)',
//                                   onlyNumbers: true,
//                                   validator: weightValidator,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 BlocBuilder<SpeciesListBloc, SpeciesListState>(
//                                   builder: (context, state) {
//                                     if (state is SpeciesListLoaded) {
//                                       species.clear();
//                                       species.addAll(state.species);
//                                     } else {}
//                                     return CustomTextFieldWithSuggestions(
//                                       fieldController: fieldsControllers[4],
//                                       labelText: 'Especie',
//                                       suggestions: species,
//                                       suggestionCallback: (pattern) {
//                                         List<dynamic> returnedList = [];
//                                         returnedList
//                                             .addAll(species.where((species) => species['name'].toLowerCase().contains(pattern.toLowerCase())));
//                                         returnedList = returnedList.map((species) => species['name']).toList();
//                                         return returnedList;
//                                       },
//                                       onSuggestionSelected: (val) {
//                                         fieldsControllers[4].text = val;
//                                         referencedSpeciesId = species.firstWhere((species) => species['name'] == val)['id'] as int;

//                                         if (referencedSpeciesId != null) {
//                                           BlocProvider.of<SpeciesListBloc>(context).add(LoadSubspeciesListEvent(speciesId: referencedSpeciesId!));
//                                         }
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 const SizedBox(height: 20),
//                                 BlocBuilder<SpeciesListBloc, SpeciesListState>(
//                                   builder: (context, state) {
//                                     if (state is SubspeciesListLoaded) {
//                                       subspecies.clear();
//                                       subspecies.addAll(state.subspecies);
//                                     } else {}
//                                     return CustomTextFieldWithSuggestions(
//                                       fieldController: fieldsControllers[5],
//                                       labelText: 'Raza',
//                                       suggestions: subspecies,
//                                       suggestionCallback: (pattern) {
//                                         List<dynamic> returnedList = [];
//                                         returnedList.addAll(
//                                             subspecies.where((subspecies) => subspecies['name'].toLowerCase().contains(pattern.toLowerCase())));
//                                         returnedList = returnedList.map((subspecies) => subspecies['name']).toList();
//                                         return returnedList;
//                                       },
//                                       onSuggestionSelected: (val) {
//                                         fieldsControllers[5].text = val;
//                                         referencedSubspeciesId = subspecies.firstWhere((subspecies) => subspecies['name'] == val)['id'] as int;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 const SizedBox(height: 30),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   child: const Text('Agregar imágenes'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 150.0, vertical: 100.0),
//                 child: SizedBox(
//                   height: 94.78.hb - 200,
//                   child: GridView.count(
//                     childAspectRatio: 2,
//                     mainAxisSpacing: 10.0,
//                     crossAxisSpacing: 10.0,
//                     crossAxisCount: 4,
//                     children: [
//                       ...List.generate(
//                         12,
//                         (index) => Container(
//                           color: Colors.grey.withOpacity(0.1),
//                           child: Image.asset('assets/shiba_inu.png'),
//                         ),
//                       ),
//                       Container(
//                         color: Colors.grey.withOpacity(0.1),
//                         child: TextButton(
//                           onPressed: () {},
//                           child: const Icon(
//                             Icons.add,
//                             size: 80,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vitalvet_app/blocs/owners/delete_owner/delete_owner_bloc.dart';
import 'package:vitalvet_app/blocs/pets/add_pet/add_pet_bloc.dart';
import 'package:vitalvet_app/ui/views/pet_views/pet_view.dart';

class AddPetView extends StatelessWidget {
  final AddPetBloc addPetBloc;
  final DeleteOwnerBloc deleteOwnerBloc;

  AddPetView({Key? key, required this.addPetBloc, required this.deleteOwnerBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PetView(
      addPetBloc: addPetBloc,
      deleteOwnerBloc: deleteOwnerBloc,
      actions: [
        ElevatedButton(
          child: const Text('Agregar imágenes'),
          onPressed: () {},
        ),
      ],
    );
  }
}
