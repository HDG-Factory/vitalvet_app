import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/patient_api.service.dart';

part 'pets_list_event.dart';
part 'pets_list_state.dart';

class PetsListBloc extends Bloc<PetsListEvent, PetsListState> {
  PetsListBloc() : super(PetsListInitial()) {
    on<LoadPetsListEvent>((event, emit) async {
      emit(LoadingPetsList());
      await PatientApiService().getAllPatients().then((response) {
        if (response.statusCode == 200) {
          emit(PetsListLoaded(pets: response.data));
        } else {
          // switch (response.data['message']) {
          //   case 'Invalid email or password':
          //     emit(const RegisterAccountError(
          //         error: 'Correo o contraseña inválido'));
          //     break;
          //   default:
          //     emit(const RegisterAccountError(error: 'Error inesperado'));
          //     break;
          // }
        }
        print(response);
      });
    });
  }
}
