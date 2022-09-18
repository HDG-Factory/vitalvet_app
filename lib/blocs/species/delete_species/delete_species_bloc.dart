import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_species_event.dart';
part 'delete_species_state.dart';

class DeleteSpeciesBloc extends Bloc<DeleteSpeciesEvent, DeleteSpeciesState> {
  DeleteSpeciesBloc() : super(DeleteSpeciesInitial()) {
    on<DeleteSpeciesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
