import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_species_event.dart';
part 'edit_species_state.dart';

class EditSpeciesBloc extends Bloc<EditSpeciesEvent, EditSpeciesState> {
  EditSpeciesBloc() : super(EditSpeciesInitial()) {
    on<EditSpeciesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
