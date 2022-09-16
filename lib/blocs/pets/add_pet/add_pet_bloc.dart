import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/patient_api.service.dart';
import 'package:vitalvet_app/services/species_api.service.dart';

part 'add_pet_event.dart';
part 'add_pet_state.dart';

class AddPetBloc extends Bloc<AddPetEvent, AddPetState> {
  AddPetBloc() : super(AddPetInitial()) {
    on<AddNewPetEvent>((event, emit) async {
      if (event.name == null ||
          event.name!.isEmpty ||
          event.weight == null ||
          event.weight!.isEmpty ||
          event.birthday == null ||
          event.birthday!.isEmpty ||
          event.ownerId == null) {
        emit(AddPetError());
        return;
      }

      int? subspeciesId = event.subspeciesId;
      if (subspeciesId == null) {
        String? subspeciesName = event.newSubspeciesName;
        if (subspeciesName == null || subspeciesName.isEmpty) {
          emit(AddPetError());
          return;
        }
        int? speciesId = event.speciesId;
        if (speciesId == null) {
          String? speciesName = event.newSpeciesName;
          if (speciesName == null || speciesName.isEmpty) {
            emit(AddPetError());
            return;
          }

          final speciesData = {
            'name': speciesName,
          };

          await SpeciesApiService().createSpecies(speciesData).then((response) async {
            if (response.statusCode == 201) {
              speciesId = response.data['id'];
            } else {
              emit(AddPetError());
            }
          });
        }

        final subspeciesData = {
          'name': subspeciesName,
        };
        await SpeciesApiService().createSubspecies(speciesId!, subspeciesData).then((response) async {
          if (response.statusCode == 201) {
            subspeciesId = response.data['id'];
          } else {
            emit(AddPetError());
          }
        });
      }

      String? formattedBirthday;
      if (event.birthday != null) {
        final birthdayData = event.birthday!.split('/');
        DateTime birthdayDate = DateTime(
          int.parse(birthdayData[2]),
          int.parse(birthdayData[1]),
          int.parse(birthdayData[0]),
        );
        formattedBirthday = birthdayDate.toString().split(' ')[0];
      }

      String? formattedDateOfDeath;
      if (event.dateOfDeath != null) {
        final dayOfDeathData = event.dateOfDeath!.split('/');
        DateTime dayOfDeathDate = DateTime(
          int.parse(dayOfDeathData[2]),
          int.parse(dayOfDeathData[1]),
          int.parse(dayOfDeathData[0]),
        );
        formattedDateOfDeath = dayOfDeathDate.toString().split(' ')[0];
      }

      final patientData = {
        'name': event.name,
        'weight': double.parse(event.weight!),
        'birthday': formattedBirthday,
        'dateOfDeath': formattedDateOfDeath,
        'mainPicture': event.mainPicture,
        'subspeciesId': subspeciesId,
        'ownerId': event.ownerId,
      };

      emit(AddingPet());
      await PatientApiService().createPatient(patientData).then((response) async {
        if (response.statusCode == 201) {
          emit(PetAdded());
        } else {
          emit(AddPetError());
        }
        print(response);
      });
    });
  }
}
