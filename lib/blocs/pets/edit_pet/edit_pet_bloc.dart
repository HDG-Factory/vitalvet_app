import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_pet_event.dart';
part 'edit_pet_state.dart';

class EditPetBloc extends Bloc<EditPetEvent, EditPetState> {
  EditPetBloc() : super(EditPetInitial()) {
    on<EditPetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
