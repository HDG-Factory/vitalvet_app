import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_pet_event.dart';
part 'update_pet_state.dart';

class UpdatePetBloc extends Bloc<UpdatePetEvent, UpdatePetState> {
  UpdatePetBloc() : super(UpdatePetInitial()) {
    on<UpdatePetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
