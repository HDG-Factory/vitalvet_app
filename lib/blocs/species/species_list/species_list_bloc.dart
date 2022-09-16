import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/species_api.service.dart';

part 'species_list_event.dart';
part 'species_list_state.dart';

class SpeciesListBloc extends Bloc<SpeciesListEvent, SpeciesListState> {
  List<dynamic> species = [];

  SpeciesListBloc() : super(SpeciesListInitial()) {
    on<LoadSpeciesListEvent>((event, emit) async {
      emit(LoadingSpeciesList());
      await SpeciesApiService().getAllSpeciesWithSubspecies().then((response) {
        if (response.statusCode == 200) {
          emit(SpeciesListLoaded(species: response.data));
          species = response.data;
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

    on<LoadSubspeciesListEvent>((event, emit) async {
      emit(LoadingSubspeciesList());
      final subspecies = species.firstWhere(
          (element) => element['id'] == event.speciesId)['subspecies'];
      emit(SubspeciesListLoaded(subspecies: subspecies));
    });
  }
}
