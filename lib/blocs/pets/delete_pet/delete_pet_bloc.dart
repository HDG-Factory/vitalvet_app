import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_pet_event.dart';
part 'delete_pet_state.dart';

class DeletePetBloc extends Bloc<DeletePetEvent, DeletePetState> {
  DeletePetBloc() : super(DeletePetInitial()) {
    on<DeletePetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
