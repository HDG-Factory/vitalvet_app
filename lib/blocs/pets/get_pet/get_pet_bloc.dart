import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/patient_api.service.dart';

part 'get_pet_event.dart';
part 'get_pet_state.dart';

class GetPetBloc extends Bloc<GetPetEvent, GetPetState> {
  GetPetBloc() : super(GetPetInitial()) {
    on<LoadPetEvent>((event, emit) async {
      if (event.id == null) {
        emit(LoadPetError());
        return;
      }

      int petId = event.id!;
      emit(LoadingPet());
      await PatientApiService().getPatientById(petId).then((response) {
        if (response.statusCode == 200) {
          emit(PetLoaded(pet: response.data));
        } else {
          emit(LoadPetError());
        }
      });
    });
  }
}
