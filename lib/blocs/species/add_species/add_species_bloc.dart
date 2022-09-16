import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_species_event.dart';
part 'add_species_state.dart';

class AddSpeciesBloc extends Bloc<AddSpeciesEvent, AddSpeciesState> {
  AddSpeciesBloc() : super(AddSpeciesInitial()) {
    on<AddSpeciesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
