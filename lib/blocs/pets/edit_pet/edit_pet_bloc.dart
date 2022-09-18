import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/patient_api.service.dart';
import 'package:vitalvet_app/services/species_api.service.dart';

part 'edit_pet_event.dart';
part 'edit_pet_state.dart';

class EditPetBloc extends Bloc<EditPetEvent, EditPetState> {
  EditPetBloc() : super(EditPetInitial()) {
    on<EditCreatedPetEvent>((event, emit) async {
      if (event.id == null ||
          event.name == null ||
          event.name!.isEmpty ||
          event.weight == null ||
          event.weight!.isEmpty ||
          event.birthday == null ||
          event.birthday!.isEmpty ||
          event.ownerId == null) {
        emit(EditPetError());
        return;
      }

      int? subspeciesId = event.subspeciesId;
      int? speciesId = event.speciesId;
      final result = await ensureSpeciesAndSubspeciesExist(speciesId, subspeciesId, event, emit);
      if (result == false) {
        return;
      }
      speciesId = result[0];
      subspeciesId = result[1];

      int patientId = event.id!;

      String? formattedBirthday;
      if (event.birthday != null && event.birthday!.isNotEmpty) {
        final birthdayData = event.birthday!.split('/');
        DateTime birthdayDate = DateTime(
          int.parse(birthdayData[2]),
          int.parse(birthdayData[1]),
          int.parse(birthdayData[0]),
        );
        formattedBirthday = birthdayDate.toString().split(' ')[0];
      }

      String? formattedDateOfDeath;
      if (event.dateOfDeath != null && event.dateOfDeath!.isNotEmpty) {
        final dayOfDeathData = event.dateOfDeath!.split('/');
        DateTime dayOfDeathDate = DateTime(
          int.parse(dayOfDeathData[2]),
          int.parse(dayOfDeathData[1]),
          int.parse(dayOfDeathData[0]),
        );
        formattedDateOfDeath = dayOfDeathDate.toString().split(' ')[0];
      }

      String name = event.name!.trim();
      double weight = double.parse(event.weight!);
      String? mainPicture = (event.mainPicture != null && event.mainPicture!.isNotEmpty) ? event.mainPicture!.trim() : null;

      final patientData = {
        'name': name,
        'weight': weight,
        'birthday': formattedBirthday,
        'dateOfDeath': formattedDateOfDeath,
        'mainPicture': mainPicture,
        'subspeciesId': subspeciesId,
        'ownerId': event.ownerId,
      };

      emit(EditingPet());
      await PatientApiService().updatePatient(patientId, patientData).then((response) async {
        if (response.statusCode == 201) {
          emit(PetEdited());
        } else {
          emit(EditPetError());
        }
        print(response);
      });
    });
  }

  dynamic ensureSpeciesAndSubspeciesExist(int? speciesId, int? subspeciesId, event, emit) async {
    dynamic? speciesCreated;
    if (subspeciesId == null) {
      List<dynamic>? speciesList;
      await SpeciesApiService().getAllSpeciesWithSubspecies().then((response) async {
        if (response.statusCode == 200) {
          speciesList = response.data;
        } else {
          emit(EditPetError());
          return false;
        }
      });

      String? subspeciesName = event.newSubspeciesName;
      if (subspeciesName == null || subspeciesName.isEmpty) {
        emit(EditPetError());
        return false;
      }
      if (speciesId == null) {
        String? speciesName = event.newSpeciesName;
        if (speciesName == null || speciesName.isEmpty) {
          emit(EditPetError());
          return false;
        }

        speciesCreated = speciesList!.firstWhere((species) {
          return species['name'] == speciesName;
        }, orElse: () => null);
        if (speciesCreated != null) {
          speciesId = speciesCreated['id'];
        } else {
          final speciesData = {
            'name': speciesName,
          };

          await SpeciesApiService().createSpecies(speciesData).then((response) async {
            if (response.statusCode == 201) {
              speciesId = response.data['id'];
            } else {
              emit(EditPetError());
              return false;
            }
          });
        }
      }

      dynamic? subspeciesCreated;
      if (speciesCreated != null) {
        subspeciesCreated = speciesCreated['subspecies'].firstWhere((subspecies) => subspecies['name'] == subspeciesName, orElse: () => null);
      }
      if (subspeciesCreated != null) {
        subspeciesId = subspeciesCreated['id'];
      } else {
        final subspeciesData = {
          'name': subspeciesName,
        };
        await SpeciesApiService().createSubspecies(speciesId!, subspeciesData).then((response) async {
          if (response.statusCode == 201) {
            subspeciesId = response.data['id'];
          } else {
            emit(EditPetError());
            return false;
          }
        });
      }
    }
    return [
      speciesId,
      subspeciesId,
    ];
  }
}
