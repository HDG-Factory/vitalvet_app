import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_pet_event.dart';
part 'add_pet_state.dart';

class AddPetBloc extends Bloc<AddPetEvent, AddPetState> {
  AddPetBloc() : super(AddPetInitial()) {
    on<AddNewPetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
