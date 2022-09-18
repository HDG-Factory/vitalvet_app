import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/patient_api.service.dart';
import 'package:vitalvet_app/services/species_api.service.dart';

part 'add_pet_event.dart';
part 'add_pet_state.dart';

class AddPetBloc extends Bloc<AddPetEvent, AddPetState> {
  AddPetBloc() : super(AddPetInitial()) {
    on<AddNewPetEvent>((event, emit) async {
      final allFieldsExist = checkRequiredFields(event, emit);
      if (allFieldsExist == false) {
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

      emit(AddingPet());
      await PatientApiService().createPatient(patientData).then((response) async {
        if (response.statusCode == 201) {
          emit(PetAdded());
        } else {
          emit(const AddPetError(error: 'Error al intentar registrar la mascota'));
        }
        print(response);
      });
    });
  }

  dynamic ensureSpeciesAndSubspeciesExist(int? speciesId, int? subspeciesId, AddNewPetEvent event, Emitter<AddPetState> emit) async {
    dynamic speciesCreated;
    if (subspeciesId == null) {
      List<dynamic>? speciesList;
      await SpeciesApiService().getAllSpeciesWithSubspecies().then((response) async {
        if (response.statusCode == 200) {
          speciesList = response.data;
        } else {
          emit(const AddPetError(error: 'Error al intentar mostrar las especies'));
          return false;
        }
      });

      String? subspeciesName = event.newSubspeciesName;
      if (subspeciesName == null || subspeciesName.isEmpty) {
        emit(const AddPetError(error: 'Debe ingresar el nombre de la raza'));
        return false;
      }
      if (speciesId == null) {
        String? speciesName = event.newSpeciesName;
        if (speciesName == null || speciesName.isEmpty) {
          emit(const AddPetError(error: 'Debe ingresar el nombre de la especie'));
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
              emit(const AddPetError(error: 'Error al intentar registrar la especie'));
              return false;
            }
          });
        }
      }

      dynamic subspeciesCreated;
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
            emit(const AddPetError(error: 'Error al intentar registrar la raza'));
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

  bool checkRequiredFields(AddNewPetEvent event, Emitter<AddPetState> emit) {
    if (event.name == null || event.name!.isEmpty) {
      emit(const AddPetError(error: 'El nombre de la mascota es obligatorio'));
      return false;
    }
    if (event.weight == null || event.weight!.isEmpty) {
      emit(const AddPetError(error: 'El peso de la mascota es obligatorio'));
      return false;
    }
    if (event.birthday == null || event.birthday!.isEmpty) {
      emit(const AddPetError(error: 'La fecha de nacimiento de la mascota es obligatoria'));
      return false;
    }
    if (event.ownerId == null) {
      emit(const AddPetError(error: 'Debe seleccionar el tutor de la mascota'));
      return false;
    }
    return true;
  }
}
